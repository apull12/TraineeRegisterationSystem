using System;
using System.Web.UI;

namespace HealthRegisterationSystem1
{
    public partial class ClearancePage : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string message = "Form Submitted Successfully!\\n";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
            Response.Redirect("~/ClearancePage.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");

        }

    }
}
