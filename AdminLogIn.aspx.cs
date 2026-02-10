using System;
using System.Web.UI;

namespace HealthRegisterationSystem1
{
    public partial class AdminLogIn : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    string lang = Request.Form["language"] ??
                                 Request.QueryString["lang"] ??
                                 Session["language"]?.ToString() ??
                                 "en";

                    Session["language"] = lang;
                    ViewState["lang"] = lang;

                    SetLanguage();
                    SetToggleButtonText();

                    LoginLink.CssClass = "nav-link active";
                }
            }
        }
        private void SetToggleButtonText()
        {
            string lang = ViewState["lang"]?.ToString() ?? "en";
            btnToggleLanguage.Text = lang == "ar" ? "English" : "عربي";
        }

        protected void btnToggleLanguage_Click(object sender, EventArgs e)
        {
            string currentLang = ViewState["lang"]?.ToString() ?? "en";
            string newLang = currentLang == "ar" ? "en" : "ar";

            ViewState["lang"] = newLang;
            Session["language"] = newLang;

            SetLanguage();
            SetToggleButtonText();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            string correctUsername = "admin";
            string correctPassword = "1234";

            if (username == correctUsername && password == correctPassword)
            {
                Session["IsAdminLoggedIn"] = true;
                Response.Redirect("~/AdminLogIn2.aspx");
            }
            else
            {
                string lang = ViewState["lang"]?.ToString() ?? "en";
                lblMessage.Text = lang == "ar"
                    ? "اسم المستخدم أو كلمة المرور غير صحيحة."
                    : "Incorrect username or password.";
            }
        }

        private void SetLanguage()
        {
            string lang = ViewState["lang"]?.ToString();

            if (lang == "ar")
            {
                lblUser.Text = "اسم المستخدم:";
                lblPass.Text = "كلمة المرور:";
                btnLogin.Text = "تسجيل الدخول";
                lblHeader.Text = "تسجيل الدخول إلى لوحة الإدارة";
                lblWelcome.Text = "مرحباً"; // Arabic welcome
                lnkForgotPassword.Text = "هل نسيت كلمة المرور؟"; // Arabic forgot password
            }
            else
            {
                lblUser.Text = "Username:";
                lblPass.Text = "Password:";
                btnLogin.Text = "Login";
                lblHeader.Text = "Log in to Admin Dashboard";
                lblWelcome.Text = "Welcome"; // English welcome
                lnkForgotPassword.Text = "Forgot password?"; // English forgot password
            }
        }

        private void SetActiveNavigation()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Path).ToLower();

            // Reset all to base class
            HomeLink.CssClass = "nav-link";
            LoginLink.CssClass = "nav-link";
            ApplyNowLink.CssClass = "nav-link";
            CentersLink.CssClass = "nav-link";
            ClearanceLink.CssClass = "nav-link";
            ApplicationStatusRegLink.CssClass = "nav-link";

            // Add active based on current page
            if (currentPage == "webform1.aspx" || currentPage == "default.aspx")
                HomeLink.CssClass += " active";
            else if (currentPage == "adminlogin.aspx")
                LoginLink.CssClass += " active";
            else if (currentPage == "registration.aspx")
                ApplyNowLink.CssClass += " active";
            else if (currentPage == "clearancepage.aspx")
                ClearanceLink.CssClass += " active";
            else if (currentPage == "centers.aspx")
                CentersLink.CssClass += " active";
            else if (currentPage == "ApplicationStatusReg.aspx")
                ApplicationStatusRegLink.CssClass += " active";
        }
    }
}