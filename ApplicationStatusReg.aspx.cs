using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HealthRegisterationSystem1
{
    public partial class ApplicationStatusReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear any previous messages
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string refNo = txtRefNo.Text.Trim();

            if (string.IsNullOrEmpty(refNo))
            {
                lblMessage.Text = "Please enter a reference number";
                return;
            }

            // Check if reference exists in database
            if (CheckIfReferenceExists(refNo))
            {
                // Redirect to status page with the reference number
                Response.Redirect($"ApplicationStatus.aspx?ref={Server.UrlEncode(refNo)}");
            }
            else
            {
                lblMessage.Text = "Reference number not found. Please check and try again.";
            }
        }

        private bool CheckIfReferenceExists(string refNo)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

                if (string.IsNullOrEmpty(connectionString))
                {
                    lblMessage.Text = "System error: Unable to connect to database.";
                    return false;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM dbo.Student WHERE referenceNumber = @refNo";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@refNo", refNo);
                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error for debugging
                System.Diagnostics.Debug.WriteLine("Database error: " + ex.Message);
                lblMessage.Text = "System error: Unable to check reference number. Please try again later.";
                return false;
            }
        }
    }
}