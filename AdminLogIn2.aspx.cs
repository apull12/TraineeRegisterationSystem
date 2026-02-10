using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace HealthRegisterationSystem1
{
    public partial class AdminLogIn2 : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!TestDatabaseConnection())
                {
                    ShowError("Unable to connect to database. Please check connection settings.");
                    return;
                }
                LoadStudents();
                DebugColumnNames();
            }
        }

        private bool TestDatabaseConnection()
        {
            try
            {
                using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString))
                {
                    conn.Open();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        private void LoadStudents()
        {
            try
            {
                lblMessage.Visible = false;
                DataTable students = GetStudentData();

                if (students.Rows.Count == 0)
                {
                    ShowNoResultsMessage("");
                    GridViewStudents.Visible = false;
                }
                else
                {
                    GridViewStudents.DataSource = students;
                    GridViewStudents.DataBind();
                    GridViewStudents.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ShowError($"Error loading student information: {ex.Message}");
            }
        }

        private DataTable GetStudentData()
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Updated query to include status column with default value if it doesn't exist
                string query = @"SELECT [id], [referenceNumber], [studentNameInEng], [studentNameInArabic], 
                        [universityName], [degreeMajor], [degree], [studentId], [age], [gender], 
                        [country], [email], [mobile], [trainingStartDate], [trainingEndDate], 
                        [academicSupName], [academicSupEmail], [CooperativeTraLet], [CV],
                        ISNULL([status], 'Pending') as [status]
                        FROM dbo.Student
                        ORDER BY [referenceNumber]";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }

        protected void GridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int studentId = Convert.ToInt32(e.CommandArgument);

            try
            {
                switch (e.CommandName)
                {
                    case "Accept":
                        UpdateStudentStatus(studentId, "Approved");
                        ShowSuccess("Student application has been approved successfully.");
                        LoadStudents(); // Reload the grid
                        break;

                    case "Reject":
                        UpdateStudentStatus(studentId, "Rejected");
                        ShowSuccess("Student application has been rejected.");
                        LoadStudents(); // Reload the grid
                        break;

                    case "ViewDetails":
                        ShowStudentDetailsModal(studentId);
                        break;
                }
            }
            catch (Exception ex)
            {
                ShowError($"Error processing request: {ex.Message}");
            }
        }

        protected void GridViewStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                string status = rowView["status"]?.ToString() ?? "Pending";

                // Update status display in the grid
                Label statusLabel = (Label)e.Row.FindControl("StatusLabel");
                if (statusLabel != null)
                {
                    statusLabel.Text = status;
                    statusLabel.CssClass = GetStatusCssClass(status);
                }

                // Disable buttons if already processed
                if (status == "Approved" || status == "Rejected")
                {
                    Button btnAccept = (Button)e.Row.FindControl("btnAccept");
                    Button btnReject = (Button)e.Row.FindControl("btnReject");
                    if (btnAccept != null) btnAccept.Enabled = false;
                    if (btnReject != null) btnReject.Enabled = false;
                }
            }
        }

        private string GetStatusCssClass(string status)
        {
            switch (status?.ToLower())
            {
                case "approved":
                    return "status-badge status-approved";
                case "rejected":
                    return "status-badge status-rejected";
                default:
                    return "status-badge status-pending";
            }
        }

        private void UpdateStudentStatus(int studentId, string status)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // First, check if status column exists, if not, add it
                string checkColumnQuery = @"
                    IF NOT EXISTS (
                        SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                        WHERE TABLE_NAME = 'Student' AND COLUMN_NAME = 'status'
                    )
                    BEGIN
                        ALTER TABLE dbo.Student ADD [status] NVARCHAR(50) DEFAULT 'Pending'
                    END";

                using (SqlCommand checkCmd = new SqlCommand(checkColumnQuery, conn))
                {
                    conn.Open();
                    checkCmd.ExecuteNonQuery();
                }

                // Also add updatedDate column if it doesn't exist
                string checkUpdatedDateQuery = @"
                    IF NOT EXISTS (
                        SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
                        WHERE TABLE_NAME = 'Student' AND COLUMN_NAME = 'updatedDate'
                    )
                    BEGIN
                        ALTER TABLE dbo.Student ADD [updatedDate] DATETIME DEFAULT GETDATE()
                    END";

                using (SqlCommand checkUpdatedCmd = new SqlCommand(checkUpdatedDateQuery, conn))
                {
                    checkUpdatedCmd.ExecuteNonQuery();
                }

                // Now update the student status
                string updateQuery = @"UPDATE dbo.Student 
                                     SET [status] = @status, [updatedDate] = GETDATE()
                                     WHERE [id] = @studentId";

                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@studentId", studentId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void ShowStudentDetailsModal(int studentId)
        {
            DataTable studentDetails = GetStudentDetails(studentId);

            if (studentDetails.Rows.Count > 0)
            {
                DataRow row = studentDetails.Rows[0];

                // Build JavaScript to populate and show modal
                StringBuilder script = new StringBuilder();
                script.Append("<script type='text/javascript'>");
                script.Append("showStudentDetails({");
                script.AppendFormat("nameEn: '{0}',", EscapeJavaScript(GetSafeValue(row, "studentNameInEng")));
                script.AppendFormat("nameAr: '{0}',", EscapeJavaScript(GetSafeValue(row, "studentNameInArabic")));
                script.AppendFormat("studentId: '{0}',", EscapeJavaScript(GetSafeValue(row, "studentId")));
                script.AppendFormat("age: '{0}',", GetSafeValue(row, "age"));
                script.AppendFormat("gender: '{0}',", EscapeJavaScript(GetSafeValue(row, "gender")));
                script.AppendFormat("country: '{0}',", EscapeJavaScript(GetSafeValue(row, "country")));
                script.AppendFormat("email: '{0}',", EscapeJavaScript(GetSafeValue(row, "email")));
                script.AppendFormat("mobile: '{0}',", EscapeJavaScript(GetSafeValue(row, "mobile")));
                script.AppendFormat("university: '{0}',", EscapeJavaScript(GetSafeValue(row, "universityName")));
                script.AppendFormat("univStudentId: '{0}',", EscapeJavaScript(GetSafeValue(row, "studentId")));
                script.AppendFormat("major: '{0}',", EscapeJavaScript(GetSafeValue(row, "degreeMajor")));
                script.AppendFormat("degree: '{0}',", EscapeJavaScript(GetSafeValue(row, "degree")));
                script.AppendFormat("startDate: '{0}',", FormatDate(row["trainingStartDate"]));
                script.AppendFormat("endDate: '{0}',", FormatDate(row["trainingEndDate"]));
                script.AppendFormat("supervisorName: '{0}',", EscapeJavaScript(GetSafeValue(row, "academicSupName")));
                script.AppendFormat("supervisorEmail: '{0}'", EscapeJavaScript(GetSafeValue(row, "academicSupEmail")));
                script.Append("});");
                script.Append("</script>");

                ClientScript.RegisterStartupScript(this.GetType(), "ShowModal", script.ToString());
            }
        }

        private string GetSafeValue(DataRow row, string columnName)
        {
            return row[columnName]?.ToString() ?? "";
        }

        private DataTable GetStudentDetails(int studentId)
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT * FROM dbo.Student WHERE [id] = @studentId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@studentId", studentId);

                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        private string FormatDate(object dateValue)
        {
            if (dateValue == null || dateValue == DBNull.Value)
                return "-";

            DateTime date = Convert.ToDateTime(dateValue);
            return date.ToString("yyyy-MM-dd");
        }

        private string EscapeJavaScript(string text)
        {
            if (string.IsNullOrEmpty(text))
                return "";

            return text.Replace("'", "\\'").Replace("\"", "\\\"").Replace("\r\n", "\\n").Replace("\n", "\\n");
        }

        private void ShowNoResultsMessage(string searchTerm)
        {
            string message = string.IsNullOrEmpty(searchTerm)
                ? "No students registered in the database"
                : $"No results found for: '{searchTerm}'";

            lblMessage.Text = message;
            lblMessage.CssClass = "alert alert-info";
            lblMessage.Visible = true;
        }

        private void ShowError(string message)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "alert alert-danger";
            lblMessage.Visible = true;
        }

        private void ShowSuccess(string message)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "alert alert-success";
            lblMessage.Visible = true;
        }

        private void DebugColumnNames()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT TOP 1 * FROM dbo.Student";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // This will show you all the actual column names
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    string columnName = reader.GetName(i);
                                    string columnValue = reader[i]?.ToString() ?? "NULL";
                                    System.Diagnostics.Debug.WriteLine($"Column {i}: {columnName} = {columnValue}");
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Debug error: {ex.Message}");
            }
        }
    }
}