using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Linq;

namespace HealthRegisterationSystem1
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Detect the language from URL, form data, or session
                string lang = Request.Form["language"] ??
                             Request.QueryString["lang"] ??
                             Session["language"]?.ToString() ??
                             "ar";

                // Set the button text based on language
                if (lang.ToLower() == "en")
                {
                    Button1.Text = "Register";
                }
                else
                {
                    Button1.Text = "تسجيل";
                }

                // Store language in session for consistency
                Session["language"] = lang;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string currentLang = Session["language"]?.ToString() ?? "ar";

                // Validate inputs before creating student object
                if (!ValidateInputs(currentLang))
                    return;

                // Generate unique reference number
                string referenceNumber = GenerateReferenceNumber();

                // Create student object with proper validation
                Student student = new Student
                {
                    id = Convert.ToInt64(txtId.Text.Trim()),
                    studentId = int.Parse(txtStudentId.Text.Trim()),
                    referenceNumber = referenceNumber, // Add reference number
                    studentNameInArabic = txtArabicName.Text.Trim(),
                    studentNameInEng = txtEnglishName.Text.Trim(),
                    age = int.Parse(txtAge.Text.Trim()),
                    gender = ddlGender.SelectedValue,
                    mobile = txtMobile.Text.Trim(),
                    email = txtEmail.Text.Trim(),
                    country = ddlCountry.SelectedValue,
                    universityName = txtUniversity.Text.Trim(),
                    degreeMajor = txtMajor.Text.Trim(),
                    degree = ddlDegree.SelectedValue,
                    trainingStartDate = DateTime.Parse(txtStartDate.Text),
                    trainingEndDate = DateTime.Parse(txtEndDate.Text),
                    academicSupName = txtSupName.Text.Trim(),
                    academicSupEmail = txtSupEmail.Text.Trim(),
                    CooperativeTraLet = GetFileBytes(fileUploadLetter),
                    CV = GetFileBytes(fileUploadCV)
                };

                if (!ValidateStudentData(student, currentLang)) return;

                SaveStudentToDatabase(student);

                // Display success message with reference number
                if (currentLang == "en")
                {
                    lblReferenceMessage.Text = $@"<div class='alert alert-success'>
          <strong>Success!</strong> Registration complete.<br/>
          <strong>Reference: {referenceNumber}</strong>
        </div>";
                }
                else
                {
                    lblReferenceMessage.Text = $@"<div class='alert alert-success' style='direction:rtl'>
          <strong>تم التسجيل!</strong> رقم المرجع: {referenceNumber}
        </div>";
                }
                lblReferenceMessage.Visible = true;

                // Clear form after successful registration
                ClearForm();
            }
            catch (Exception ex)
            {
                string currentLang = Session["language"]?.ToString() ?? "ar";
                if (currentLang == "en")
                {
                    Label1.Text = "<div style='color: red; padding: 10px;'>Error: " + ex.Message + "</div>";
                }
                else
                {
                    Label1.Text = "<div style='color: red; padding: 10px; direction: rtl;'>خطأ: " + ex.Message + "</div>";
                }
                LogError(ex);
            }
        }

        // Generate unique reference number starting with 11472 (5 digits total)
        private string GenerateReferenceNumber()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                    throw new Exception("Database connection string not configured");

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Get the highest existing reference number
                    string query = @"
                        SELECT ISNULL(MAX(CAST(referenceNumber AS INT)), 11471) 
                        FROM dbo.Student 
                        WHERE referenceNumber IS NOT NULL 
                        AND referenceNumber != '' 
                        AND ISNUMERIC(referenceNumber) = 1
                        AND LEN(referenceNumber) = 5";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    object result = cmd.ExecuteScalar();

                    int lastNumber = Convert.ToInt32(result);
                    int nextNumber = lastNumber + 1;

                    // Ensure we don't exceed 5 digits (99999 is the max)
                    if (nextNumber > 99999)
                    {
                        throw new Exception("Reference number limit exceeded. Maximum is 99999.");
                    }

                    return nextNumber.ToString();
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                throw new Exception("Error generating reference number: " + ex.Message);
            }
        }

        private bool IsReferenceNumberExists(string referenceNumber)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                    return false;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM dbo.Student WHERE referenceNumber = @referenceNumber";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@referenceNumber", referenceNumber);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                return false;
            }
        }

        private bool ValidateInputs(string lang)
        {
            List<string> errors = new List<string>();

            // Check required text fields
            if (string.IsNullOrWhiteSpace(txtId.Text))
                errors.Add(lang == "ar" ? "رقم الإقامة مطلوب" : "Residence ID is required");

            if (string.IsNullOrWhiteSpace(txtStudentId.Text))
                errors.Add(lang == "ar" ? "رقم الطالب الجامعي مطلوب" : "Student ID is required");

            if (string.IsNullOrWhiteSpace(txtArabicName.Text))
                errors.Add(lang == "ar" ? "اسم الطالب بالعربية مطلوب" : "Student name in Arabic is required");

            if (string.IsNullOrWhiteSpace(txtEnglishName.Text))
                errors.Add(lang == "ar" ? "اسم الطالب بالإنجليزية مطلوب" : "Student name in English is required");

            if (string.IsNullOrWhiteSpace(txtAge.Text))
                errors.Add(lang == "ar" ? "العمر مطلوب" : "Age is required");

            if (string.IsNullOrWhiteSpace(txtMobile.Text))
                errors.Add(lang == "ar" ? "رقم الجوال مطلوب" : "Mobile number is required");

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                errors.Add(lang == "ar" ? "البريد الإلكتروني مطلوب" : "Email is required");

            if (string.IsNullOrWhiteSpace(txtUniversity.Text))
                errors.Add(lang == "ar" ? "اسم الجامعة مطلوب" : "University name is required");

            if (string.IsNullOrWhiteSpace(txtMajor.Text))
                errors.Add(lang == "ar" ? "التخصص مطلوب" : "Major is required");

            if (string.IsNullOrWhiteSpace(txtSupName.Text))
                errors.Add(lang == "ar" ? "اسم المشرف الأكاديمي مطلوب" : "Academic supervisor name is required");

            if (string.IsNullOrWhiteSpace(txtSupEmail.Text))
                errors.Add(lang == "ar" ? "بريد المشرف الأكاديمي مطلوب" : "Academic supervisor email is required");

            // Check dropdown selections
            if (string.IsNullOrWhiteSpace(ddlGender.SelectedValue))
                errors.Add(lang == "ar" ? "الجنس مطلوب" : "Gender is required");

            if (string.IsNullOrWhiteSpace(ddlCountry.SelectedValue))
                errors.Add(lang == "ar" ? "الدولة مطلوبة" : "Country is required");

            if (string.IsNullOrWhiteSpace(ddlDegree.SelectedValue))
                errors.Add(lang == "ar" ? "الدرجة العلمية مطلوبة" : "Degree is required");

            // Check dates
            if (string.IsNullOrWhiteSpace(txtStartDate.Text))
                errors.Add(lang == "ar" ? "تاريخ بداية التدريب مطلوب" : "Training start date is required");

            if (string.IsNullOrWhiteSpace(txtEndDate.Text))
                errors.Add(lang == "ar" ? "تاريخ نهاية التدريب مطلوب" : "Training end date is required");

            // Check file uploads
            if (!fileUploadLetter.HasFile)
                errors.Add(lang == "ar" ? "خطاب التدريب التعاوني مطلوب" : "Cooperative training letter is required");

            if (!fileUploadCV.HasFile)
                errors.Add(lang == "ar" ? "السيرة الذاتية مطلوبة" : "CV is required");

            // Check numeric fields
            if (!string.IsNullOrWhiteSpace(txtId.Text) && (txtId.Text.Length != 10 || !txtId.Text.Trim().All(char.IsDigit)))
                errors.Add(lang == "ar" ? "رقم الإقامة يجب أن يكون 10 أرقام" : "Residence ID must be 10 digits");

            if (!string.IsNullOrWhiteSpace(txtStudentId.Text) && !int.TryParse(txtStudentId.Text, out int studentIdValue))
                errors.Add(lang == "ar" ? "رقم الطالب الجامعي غير صحيح" : "Invalid student ID");

            if (!string.IsNullOrWhiteSpace(txtAge.Text) && (!int.TryParse(txtAge.Text, out int ageValue) || ageValue < 18 || ageValue > 50))
                errors.Add(lang == "ar" ? "العمر يجب أن يكون بين 18 و 50 سنة" : "Age must be between 18 and 50");

            if (errors.Count > 0)
            {
                ShowErrorMessage(string.Join("\\n", errors));
                return false;
            }

            return true;
        }

        private byte[] GetFileBytes(System.Web.UI.WebControls.FileUpload fileUpload)
        {
            if (!fileUpload.HasFile)
                return null;

            try
            {
                string[] allowedExtensions = { ".pdf", ".doc", ".docx" };
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();

                if (Array.IndexOf(allowedExtensions, fileExtension) == -1)
                    throw new Exception("File type not supported. Only PDF and Word documents are allowed.");

                if (fileUpload.PostedFile.ContentLength > 5 * 1024 * 1024) // 5MB max
                    throw new Exception("Maximum file size is 5MB");

                using (var stream = fileUpload.PostedFile.InputStream)
                {
                    byte[] fileBytes = new byte[stream.Length];
                    stream.Read(fileBytes, 0, (int)stream.Length);
                    return fileBytes;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                throw new Exception("Error processing file: " + ex.Message);
            }
        }

        private bool ValidateStudentData(Student student, string lang)
        {
            List<string> errors = new List<string>();

            // Check for duplicate registration
            if (IsStudentAlreadyRegistered((int)student.id))
                errors.Add(lang == "ar" ? "رقم الإقامة مسجل مسبقاً" : "Residence ID already registered");

            if (IsStudentIdAlreadyRegistered(student.studentId))
                errors.Add(lang == "ar" ? "رقم الطالب الجامعي مسجل مسبقاً" : "Student ID already registered");

            // Validate email formats
            if (!IsValidEmail(student.email))
                errors.Add(lang == "ar" ? "البريد الإلكتروني غير صحيح" : "Invalid email address");

            if (!IsValidEmail(student.academicSupEmail))
                errors.Add(lang == "ar" ? "بريد المشرف الأكاديمي غير صحيح" : "Invalid academic supervisor email");

            // Validate dates
            if (student.trainingStartDate >= student.trainingEndDate)
                errors.Add(lang == "ar" ? "تاريخ نهاية التدريب يجب أن يكون بعد البداية" : "End date must be after start date");

            if (student.trainingStartDate < DateTime.Now.Date)
                errors.Add(lang == "ar" ? "تاريخ بداية التدريب يجب أن يكون في المستقبل" : "Training start date must be in the future");

            // Validate mobile number
            if (student.mobile.Length < 9 || !IsNumeric(student.mobile))
                errors.Add(lang == "ar" ? "رقم الجوال غير صحيح" : "Invalid mobile number");

            if (errors.Count > 0)
            {
                ShowErrorMessage(string.Join("\\n", errors));
                return false;
            }

            return true;
        }

        private void ShowErrorMessage(string message)
        {
            message = message.Replace("'", "\\'").Replace("\n", "\\n");
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private bool IsNumeric(string str)
        {
            return !string.IsNullOrEmpty(str) && str.All(char.IsDigit);
        }

        private bool IsStudentAlreadyRegistered(int residenceId)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                    return false;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM dbo.Student WHERE id = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", residenceId);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                return false;
            }
        }

        private bool IsStudentIdAlreadyRegistered(long studentId)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"]?.ConnectionString;
                if (string.IsNullOrEmpty(connectionString))
                    return false;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM dbo.Student WHERE studentId = @studentId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@studentId", studentId);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                return false;
            }
        }

        private void LogError(Exception ex)
        {
            try
            {
                string logFolder = Server.MapPath("~/App_Data");
                if (!Directory.Exists(logFolder))
                    Directory.CreateDirectory(logFolder);

                string logPath = Path.Combine(logFolder, "ErrorLog.txt");
                File.AppendAllText(logPath, $"[{DateTime.Now}] {ex}\n\n");
            }
            catch
            {
                // If logging fails, don't throw another exception
            }
        }

        private void SaveStudentToDatabase(Student student)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                throw new Exception("Database connection string not configured");
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    INSERT INTO dbo.Student
                    (id, studentId, referenceNumber, studentNameInArabic, studentNameInEng, age, gender, mobile, email, country,
                     universityName, degreeMajor, degree, trainingStartDate, trainingEndDate,
                     academicSupName, academicSupEmail, CooperativeTraLet, CV)
                    VALUES
                    (@id, @studentId, @referenceNumber, @studentNameInArabic, @studentNameInEng, @age, @gender, @mobile, @email, @country,
                     @universityName, @degreeMajor, @degree, @trainingStartDate, @trainingEndDate,
                     @academicSupName, @academicSupEmail, @CooperativeTraLet, @CV)";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@id", student.id);
                cmd.Parameters.AddWithValue("@studentId", student.studentId);
                cmd.Parameters.AddWithValue("@referenceNumber", student.referenceNumber ?? "");
                cmd.Parameters.AddWithValue("@studentNameInArabic", student.studentNameInArabic ?? "");
                cmd.Parameters.AddWithValue("@studentNameInEng", student.studentNameInEng ?? "");
                cmd.Parameters.AddWithValue("@age", student.age);
                cmd.Parameters.AddWithValue("@gender", student.gender ?? "");
                cmd.Parameters.AddWithValue("@mobile", student.mobile ?? "");
                cmd.Parameters.AddWithValue("@email", student.email ?? "");
                cmd.Parameters.AddWithValue("@country", student.country ?? "");
                cmd.Parameters.AddWithValue("@universityName", student.universityName ?? "");
                cmd.Parameters.AddWithValue("@degreeMajor", student.degreeMajor ?? "");
                cmd.Parameters.AddWithValue("@degree", student.degree ?? "");
                cmd.Parameters.AddWithValue("@trainingStartDate", student.trainingStartDate);
                cmd.Parameters.AddWithValue("@trainingEndDate", student.trainingEndDate);
                cmd.Parameters.AddWithValue("@academicSupName", student.academicSupName ?? "");
                cmd.Parameters.AddWithValue("@academicSupEmail", student.academicSupEmail ?? "");

                // Handle file uploads as binary data
                cmd.Parameters.Add("@CooperativeTraLet", SqlDbType.VarBinary, -1).Value =
                    student.CooperativeTraLet ?? (object)DBNull.Value;
                cmd.Parameters.Add("@CV", SqlDbType.VarBinary, -1).Value =
                    student.CV ?? (object)DBNull.Value;

                conn.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    throw new Exception("Database error: " + ex.Message);
                }
            }
        }

        private void ClearForm()
        {
            txtId.Text = "";
            txtStudentId.Text = "";
            txtArabicName.Text = "";
            txtEnglishName.Text = "";
            txtAge.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtUniversity.Text = "";
            txtMajor.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtSupName.Text = "";
            txtSupEmail.Text = "";

            ddlGender.SelectedIndex = 0;
            ddlCountry.SelectedIndex = 0;
            ddlDegree.SelectedIndex = 0;
            ddlCountryCode.SelectedIndex = 0;
        }

        public class Student
        {
            public long id { get; set; }
            public int studentId { get; set; }
            public string referenceNumber { get; set; } // Added reference number property
            public string studentNameInArabic { get; set; }
            public string studentNameInEng { get; set; }
            public int age { get; set; }
            public string gender { get; set; }
            public string mobile { get; set; }
            public string email { get; set; }
            public string country { get; set; }
            public string universityName { get; set; }
            public string degreeMajor { get; set; }
            public string degree { get; set; }
            public DateTime trainingStartDate { get; set; }
            public DateTime trainingEndDate { get; set; }
            public string academicSupName { get; set; }
            public string academicSupEmail { get; set; }
            public byte[] CooperativeTraLet { get; set; }
            public byte[] CV { get; set; }
        }
    }
}