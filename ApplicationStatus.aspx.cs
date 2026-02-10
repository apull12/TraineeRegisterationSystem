using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthRegisterationSystem1
{
    public partial class ApplicationStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string refNo = Request.QueryString["ref"];
                    System.Diagnostics.Debug.WriteLine($"Attempting to load with ref: {refNo}");

                    if (string.IsNullOrEmpty(refNo))
                    {
                        System.Diagnostics.Debug.WriteLine("No reference number provided - redirecting");
                        Response.Redirect("ApplicationStatusReg.aspx");
                        return;
                    }

                    LoadApplicationStatus(refNo);
                }
                // Set the client-side click handler
                btnViewLetter.OnClientClick = "toggleLetterDetails(event); return false;";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Page_Load error: {ex.ToString()}");
                throw; // Re-throw to see the error in the browser
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            loading.Visible = false;
        }

        private void LoadApplicationStatus(string referenceNumber)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

                if (string.IsNullOrEmpty(connectionString))
                {
                    // Log error and redirect back to login
                    System.Diagnostics.Debug.WriteLine("Connection string is null or empty");
                    Response.Redirect("ApplicationStatusReg.aspx");
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Query to get student information
                    string query = @"SELECT referenceNumber, studentNameInEng, status 
                                   FROM dbo.Student 
                                   WHERE referenceNumber = @refNo";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@refNo", referenceNumber);
                        conn.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Update the HTML elements with database values
                                UpdateApplicationTable(reader);
                            }
                            else
                            {
                                // Handle case where reference number not found
                                System.Diagnostics.Debug.WriteLine($"No record found for reference: {referenceNumber}");
                                Response.Redirect("ApplicationStatusReg.aspx");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error and redirect back to login
                System.Diagnostics.Debug.WriteLine("Database error: " + ex.Message);
                Response.Redirect("ApplicationStatusReg.aspx");
            }
        }

        private void UpdateApplicationTable(SqlDataReader reader)
        {
            // Get the table row elements and update them
            string refNumber = reader["referenceNumber"].ToString();
            string studentName = reader["studentNameInEng"].ToString();
            string status = reader["status"].ToString().ToLower();

            // Update server-side controls
            lblRefNumber.Text = "#" + refNumber;
            lblProgramName.Text = "KFMC Internship Program";
            lblStatus.Text = char.ToUpper(status[0]) + status.Substring(1);

            // Set the appropriate CSS class based on status
            statusBadge.Attributes["class"] = $"status-badge status-{status}";

            // JavaScript to update the letter with proper data handling
            string script = $@"
        <script type='text/javascript'>
            function updateLetter() {{
                // Store the application data globally for letter switching
                currentRefNo = '{System.Web.HttpUtility.JavaScriptStringEncode(refNumber)}';
                currentStudentName = '{System.Web.HttpUtility.JavaScriptStringEncode(studentName)}';
                currentStatus = '{System.Web.HttpUtility.JavaScriptStringEncode(status)}';
                
                // Call the original function for backward compatibility
                updateLetterForStatus(currentRefNo, currentStudentName, currentStatus);
            }}
            
            // Run immediately and also when DOM is ready
            if (document.readyState === 'loading') {{
                document.addEventListener('DOMContentLoaded', updateLetter);
            }} else {{
                updateLetter();
            }}
        </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "UpdateLetter", script, false);
        }
    }
}