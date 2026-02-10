using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthRegisterationSystem1
{
    public partial class Centers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!TestDatabaseConnection())
                {
                    ShowError("تعذر الاتصال بقاعدة البيانات. يرجى التحقق من إعدادات الاتصال.");
                    return;
                }

                // Set up GridView columns manually for better control
                SetupGridViewColumns();
                LoadCenters();
            }
        }

        private void SetupGridViewColumns()
        {
            GridViewCenters.AutoGenerateColumns = false;
            GridViewCenters.Columns.Clear();

            // Add bound fields for other columns
            BoundField clusterField = new BoundField();
            clusterField.DataField = "التجمع الصحي الثاني";
            clusterField.HeaderText = "التجمع الصحي الثاني";
            GridViewCenters.Columns.Add(clusterField);

            BoundField provinceField = new BoundField();
            provinceField.DataField = "المحافظة";
            provinceField.HeaderText = "المحافظة";
            GridViewCenters.Columns.Add(provinceField);

            BoundField centerNameField = new BoundField();
            centerNameField.DataField = "اسم المركز";
            centerNameField.HeaderText = "اسم المركز";
            GridViewCenters.Columns.Add(centerNameField);

            BoundField emailField = new BoundField();
            emailField.DataField = "ايميل المركز الصحي";
            emailField.HeaderText = "ايميل المركز الصحي";
            GridViewCenters.Columns.Add(emailField);

            // Add hyperlink field for location
            HyperLinkField locationField = new HyperLinkField();
            locationField.DataNavigateUrlFields = new string[] { "موقع المركز" };
            locationField.DataNavigateUrlFormatString = "{0}";
            locationField.Text = "الرابط";
            locationField.HeaderText = "موقع المركز";
            locationField.Target = "_blank"; // Open in new tab
            GridViewCenters.Columns.Add(locationField);
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadCenters(txtSearch.Text.Trim());
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadCenters();
        }

        private void LoadCenters(string searchTerm = "")
        {
            try
            {
                DataTable centers = GetCentersData(searchTerm);

                if (centers.Rows.Count == 0)
                {
                    ShowNoResultsMessage(searchTerm);
                    GridViewCenters.Visible = false;
                }
                else
                {
                    lblMessage.Visible = false; // Hide message when results are found
                    GridViewCenters.DataSource = centers;
                    GridViewCenters.DataBind();
                    GridViewCenters.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ShowError($"حدث خطأ أثناء تحميل المراكز: {ex.Message}");
            }
        }

        private DataTable GetCentersData(string searchTerm)
        {
            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["HealthCentersDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT [التجمع الصحي الثاني], [المحافظة], [اسم المركز], [ايميل المركز الصحي], [موقع المركز]
                         FROM dbo.healthCenters";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += @" WHERE [التجمع الصحي الثاني] LIKE @searchTerm
                        OR [اسم المركز] LIKE @searchTerm
                        OR [المحافظة] LIKE @searchTerm
                        OR [موقع المركز] LIKE @searchTerm
                        OR [ايميل المركز الصحي] LIKE @searchTerm";
                }

                query += " ORDER BY [اسم المركز]";

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
                    }
                }
            }

            return dt;
        }

        // Alternative Method: Using RowDataBound event for more control
        protected void GridViewCenters_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // If you want to customize the hyperlink further, you can do it here
                // For example, to validate URLs or add additional formatting

                // Find the hyperlink control (it will be in the last column - index 4)
                if (e.Row.Cells[4].Controls.Count > 0)
                {
                    HyperLink linkControl = e.Row.Cells[4].Controls[0] as HyperLink;
                    if (linkControl != null)
                    {
                        // You can add additional styling or validation here
                        linkControl.CssClass = "location-link";

                        // Validate if it's a proper URL
                        string url = linkControl.NavigateUrl;
                        if (string.IsNullOrEmpty(url) || (!url.StartsWith("http://") && !url.StartsWith("https://")))
                        {
                            linkControl.Text = "رابط غير صالح";
                            linkControl.Enabled = false;
                            linkControl.CssClass += " invalid-link";
                        }
                    }
                }

                // Add hover effects
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='#f8faff'";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''";
            }
        }

        private void ShowNoResultsMessage(string searchTerm)
        {
            string message = string.IsNullOrEmpty(searchTerm)
                ? "لا توجد مراكز صحية مسجلة في قاعدة البيانات"
                : $"لا توجد نتائج للبحث عن: '{searchTerm}'";

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
    }
}
