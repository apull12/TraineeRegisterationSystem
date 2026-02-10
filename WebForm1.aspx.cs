using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HealthRegisterationSystem1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected global::System.Web.UI.HtmlControls.HtmlForm form1;
        protected global::System.Web.UI.WebControls.HyperLink HomeLink;
        protected global::System.Web.UI.WebControls.HyperLink CentersLink;
        protected global::System.Web.UI.WebControls.HyperLink AdminLink;
        protected global::System.Web.UI.WebControls.HyperLink ClearanceLink;
        protected global::System.Web.UI.WebControls.HyperLink ApplicationStatusLink;
        protected global::System.Web.UI.WebControls.HyperLink ApplyNowLink;
        protected global::System.Web.UI.WebControls.HyperLink ApplyNowLink1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetActiveNavigation();
                CheckDatabaseStructure();
                LoadHospitals();
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(searchTerm))
            {
                ShowMessage("يرجى إدخال كلمة البحث", "alert-info");
                return;
            }

            LoadHospitals(searchTerm);
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            lblMessage.Visible = false;
            LoadHospitals();
        }

        private void CheckDatabaseStructure()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string tableQuery = @"SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'";
                    using (SqlCommand cmd = new SqlCommand(tableQuery, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            System.Diagnostics.Debug.WriteLine("=== AVAILABLE TABLES ===");
                            while (reader.Read())
                            {
                                System.Diagnostics.Debug.WriteLine($"Table: {reader["TABLE_NAME"]}");
                            }
                        }
                    }

                    try
                    {
                        string columnQuery = @"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'hospitals'";
                        using (SqlCommand cmd = new SqlCommand(columnQuery, conn))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                System.Diagnostics.Debug.WriteLine("=== HOSPITALS TABLE COLUMNS ===");
                                while (reader.Read())
                                {
                                    System.Diagnostics.Debug.WriteLine($"Column: {reader["COLUMN_NAME"]} ({reader["DATA_TYPE"]})");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error checking hospitals table: {ex.Message}");
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error checking database structure: {ex.Message}");
            }
        }

        private void LoadHospitals(string searchTerm = "")
        {
            try
            {
                if (!TestDatabaseConnection())
                {
                    ShowMessage("تعذر الاتصال بقاعدة البيانات. يرجى التحقق من إعدادات الاتصال.", "alert-danger");
                    GridViewHospitals.Visible = false;
                    return;
                }

                DataTable centers = GetCentersData(searchTerm);

                if (centers.Rows.Count == 0)
                {
                    ShowNoResultsMessage(searchTerm);
                    GridViewHospitals.Visible = false;
                }
                else
                {
                    lblMessage.Visible = false;
                    GridViewHospitals.DataSource = centers;
                    GridViewHospitals.DataBind();
                    GridViewHospitals.Visible = true;

                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        ShowMessage($"تم العثور على {centers.Rows.Count} نتيجة للبحث عن: '{searchTerm}'", "alert-info");
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                ShowMessage($"خطأ في قاعدة البيانات: {sqlEx.Message}", "alert-danger");
                GridViewHospitals.Visible = false;
                System.Diagnostics.Debug.WriteLine($"SQL Error: {sqlEx.Message}");
            }
            catch (Exception ex)
            {
                ShowMessage($"حدث خطأ أثناء تحميل المراكز: {ex.Message}", "alert-danger");
                GridViewHospitals.Visible = false;
                System.Diagnostics.Debug.WriteLine($"General Error: {ex.Message}");
            }
        }

        private bool TestDatabaseConnection()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("SELECT 1", conn))
                    {
                        cmd.ExecuteScalar();
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Database connection error: {ex.Message}");
                return false;
            }
        }

        private void SetActiveNavigation()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Path).ToLower();

            HomeLink.CssClass = "nav-link";
            AdminLink.CssClass = "nav-link";
            ApplyNowLink.CssClass = "nav-link";
            CentersLink.CssClass = "nav-link";
            ClearanceLink.CssClass = "nav-link";
            ApplicationStatusLink.CssClass = "nav-link";

            switch (currentPage)
            {
                case "webform1.aspx":
                    HomeLink.CssClass += " active";
                    break;
                case "adminlogin.aspx":
                    AdminLink.CssClass += " active";
                    break;
                case "registration.aspx":
                    ApplyNowLink.CssClass += " active";
                    break;
                case "clearancepage.aspx":
                    ClearanceLink.CssClass += " active";
                    break;
                case "centers.aspx":
                    CentersLink.CssClass += " active";
                    break;
                case "applicationstatusreg.aspx":
                    ApplicationStatusLink.CssClass += " active";
                    break;
            }
        }

        private DataTable GetCentersData(string searchTerm)
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Updated query with search functionality
                string query = "SELECT إسم_المستشفى, موقع_المستشفى FROM dbo.hospitals";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " WHERE إسم_المستشفى LIKE @searchTerm OR موقع_المستشفى LIKE @searchTerm";
                }

                query += " ORDER BY إسم_المستشفى";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@searchTerm", $"%{searchTerm}%");
                    }

                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);

                        System.Diagnostics.Debug.WriteLine("=== QUERY RESULTS ===");
                        System.Diagnostics.Debug.WriteLine($"Rows returned: {dt.Rows.Count}");
                        foreach (DataColumn column in dt.Columns)
                        {
                            System.Diagnostics.Debug.WriteLine($"Column: {column.ColumnName} ({column.DataType.Name})");
                        }
                    }
                }
            }

            return dt;
        }

        private void ShowNoResultsMessage(string searchTerm)
        {
            string message = string.IsNullOrEmpty(searchTerm)
                ? "لا توجد مراكز صحية مسجلة في قاعدة البيانات"
                : $"لا توجد نتائج للبحث عن: '{searchTerm}'";

            ShowMessage(message, "alert-info");
        }

        private void ShowMessage(string message, string cssClass)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"search-message {cssClass}";
            lblMessage.Visible = true;
        }

        // PUBLIC METHOD: Create Google Maps URL (needs to be public for ASPX binding)
        public string CreateGoogleMapsUrl(object locationObj)
        {
            if (locationObj == null || locationObj == DBNull.Value)
            {
                return "#"; // Return placeholder URL for null values
            }

            string location = locationObj.ToString().Trim();

            if (string.IsNullOrEmpty(location))
            {
                return "#"; // Return placeholder URL for empty values
            }

            // URL encode the location for Google Maps
            string encodedLocation = HttpUtility.UrlEncode(location);

            // Create Google Maps search URL
            return $"https://www.google.com/maps/search/?api=1&query={encodedLocation}";
        }

        // Enhanced RowDataBound event for additional functionality
        protected void GridViewHospitals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Add hover effects
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='#f8faff'";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''";

                // Get the HyperLink control in the template field
                HyperLink hlLocation = (HyperLink)e.Row.FindControl("hlLocation");
                if (hlLocation != null)
                {
                    DataRowView rowView = (DataRowView)e.Row.DataItem;
                    object locationValue = rowView["موقع_المستشفى"];

                    // Check if location is null or empty
                    if (locationValue == null || locationValue == DBNull.Value ||
                        string.IsNullOrEmpty(locationValue.ToString().Trim()))
                    {
                        hlLocation.Text = "غير متوفر";
                        hlLocation.NavigateUrl = "#";
                        hlLocation.CssClass += " disabled-link";
                        hlLocation.Enabled = false;
                    }
                    else
                    {
                        // URL is already set by the template, just ensure proper styling
                        hlLocation.CssClass += " hospital-link";
                    }
                }
            }
        }
    }
}