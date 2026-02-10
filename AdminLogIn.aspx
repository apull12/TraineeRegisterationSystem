<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="AdminLogIn.aspx.cs" Inherits="HealthRegisterationSystem1.AdminLogIn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
    <title>Employee Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body id="Body" runat="server">
        <form id="form1" runat="server">
        <!-- Header (Logo) -->
        <header class="header">F
            <div class="header-content">
                <div class="logo-header">
                    <img src="Content/88ee05e9-2f92-468f-bf25-c9290ea42248.jpg" alt="Logo" class="site-logo" />
                </div>
            </div>
        </header>
       <nav class="navbar">
    <div class="nav-content">
        <div class="nav-links">
            <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/WebForm1.aspx" CssClass="nav-link">Home</asp:HyperLink>
            <asp:HyperLink ID="CentersLink" runat="server" NavigateUrl="~/Centers.aspx" CssClass="nav-link">Centers</asp:HyperLink>
            <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/AdminLogIn.aspx" CssClass="nav-link">Admin</asp:HyperLink>
            <asp:HyperLink ID="ClearanceLink" runat="server" NavigateUrl="~/ClearancePage.aspx" CssClass="nav-link">Clearance </asp:HyperLink>
            <asp:HyperLink ID="ApplyNowLink" runat="server" NavigateUrl="~/Registration.aspx" CssClass="nav-link">Internship</asp:HyperLink>
            <asp:HyperLink ID="ApplicationStatusRegLink" runat="server" NavigateUrl="~/ApplicationStatusReg.aspx" CssClass="nav-link">Application Status</asp:HyperLink>
            </div>
        <div class="nav-phone">
            <img src="Content1/Phone_Icon (3).png" alt="Phone Icon" />
            <span>8001277000</span>
        </div>
    </div>
</nav>
           <div class="main-content" style="margin-top: 40px;">
           <div class="login-wrapper" style="width: 550px; max-width: 90%; border: 1px solid #357dad; border-radius: 20px; padding: 2rem 1.5rem 3rem; position: relative; background: url('login-image0.png') left top/75% repeat; margin: 20px auto;">
                <div class="language-toggle">
                  <div class="language-toggle-container">
                     <asp:Button ID="btnToggleLanguage" runat="server" CssClass="language-toggle-btn" OnClick="btnToggleLanguage_Click" />
                     </div>
                    </div>
                   <!-- Welcome text -->
                   <asp:Label ID="lblWelcome" runat="server" CssClass="welcome" Style="text-align: center; font-family: 'Yeseva One', serif; font-size: 2rem; margin-bottom: 0.75rem; font-weight: 700;"></asp:Label>

                   <asp:Label ID="lblHeader" runat="server" Text="Log in to Admin Dashboard" Style="text-align:center; font-size:1.6rem; display:block; margin-bottom:2.5rem;"></asp:Label>

                   <!-- Error message -->
                   <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="message" />

                   <!-- Username Field -->
                   <div class="form-field" style="margin-bottom: 1.0rem;">
                       <asp:Label ID="lblUser" runat="server" AssociatedControlID="txtUsername" Text="Username"
                           Style="display: block; font-size: 1.1rem; margin-bottom: 0.4rem; color: black;" />
                       <asp:TextBox ID="txtUsername" runat="server" CssClass="input" placeholder="Enter username"
                           Style="width: 100%; padding: 0.8rem 1rem; border: 1px solid #357dad; border-radius: 6px; font-size: 1rem;" />
                   </div>

                   <!-- Password Field -->
                   <div class="form-field" style="margin-bottom: 1.0rem;">
                       <asp:Label ID="lblPass" runat="server" AssociatedControlID="txtPassword" Text="Password"
                           Style="display: block; font-size: 1.1rem; margin-bottom: 0.4rem; color: black;" />
                       <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" placeholder="Enter password"
                           Style="width: 100%; padding: 0.8rem 1rem; border: 1px solid #357dad; border-radius: 6px; font-size: 1rem;" />
                   </div>

                   <!-- Login Button -->
                   <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login"
                       Style="width: 100%; background: #159eec; color: white; border: none; border-radius: 20px; padding: 1rem; font-size: 1.25rem; font-weight: 600; cursor: pointer; transition: filter .25s; margin-bottom: 1rem;"
                       OnClick="btnLogin_Click" />
                   

                   <!-- Additional Links -->
                   <div class="links" style="margin-top: 1.25rem; text-align: center; font-size: 1rem;">
                       <asp:HyperLink ID="lnkForgotPassword" runat="server" Style="color: #357dad; text-decoration: underline; font-weight: 600;"></asp:HyperLink>
                   </div>

                </div>
                 </div>
               
            <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-logo">
                    <img src="Content1/logowhite.png" alt="Riyadh Second Health Cluster" />
                </div>
                <div class="footer-contact">
                    <h4>Contact Us</h4>
                    <p>8001277000 <i class="fas fa-phone"></i></p>
                    <p>info@rc2.med.sa <i class="fas fa-envelope"></i></p>
                    <p>Ar Rawabi, 14214, Riyadh <i class="fas fa-map-marker-alt"></i></p>
                    <p>Saudi Arabia</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 RC2 All Rights Reserved</p>
                <div class="social-links">
                    <a href="#" class="social-link"><i class="fab fa-linkedin"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </footer>
    <style> 
  :root {
            --color1: #4A90E2;
            --color2: #357ABD;
            --color3: #2E6DA4;
            --white: #ffffff;
            --text-dark: #222222;
            --text-light: #555555;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
            --font-nav: 'Roboto', 'Segoe UI', Tahoma, sans-serif;
            --font-body: 'Open Sans', 'Segoe UI', Tahoma, sans-serif;
        }

        /* Global Styles */
        * { 
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

        body {
            font-family: var(--font-body);
            line-height: 1.6;
            color: var(--text-dark);
            background-color: white;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            overflow-y: auto;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .welcome {
    font-size: 1.8rem !important;
}
.login-wrapper {
    transform: scale(0.9);
    transform-origin: top center;
}

        /* Header Styles */
        .header {
            background: var(--white);
            box-shadow: var(--shadow);
            position: relative;
            z-index: 1000;
            margin: 0;
            padding: 0;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .logo-header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px 0;
        }

        .site-logo {
            height: 70px;
            width: auto;
            display: block;
        }

        /* Navigation Bar - Updated for proper alignment */
        .navbar {
            box-shadow: none;
            position: relative;
    z-index: 999;
    margin: 0;
    padding: 0;
    border: none;
    height: 63px;
    background: rgb(53, 125, 173);
}


        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
            display: flex;
            align-items: center;
            height: 100%;
            justify-content: space-between; 
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 0;
            margin-left: 0;
            padding-left: 0;
        }

        .nav-link {
            font-family: var(--font-nav);
            display: flex;
            align-items: center;
            padding: 0 1.5rem;
            color: var(--white);
            text-decoration: none;
            font-weight: 400;
            font-size: 0.95rem;
            transition: var(--transition);
            text-transform: capitalize;
            border-bottom: 3px solid transparent;
            margin: 0;
            height: 100%;
            white-space: nowrap;
            background: transparent;
        }

            .nav-link:hover,
            .nav-link.active {
                background: rgba(255, 255, 255, 0.1);
                color: var(--white);
                border-bottom: none;
            }

        .nav-phone {
    margin-left: auto; /* Pushes it to the far right */
    padding: 0 1rem;
    color: var(--white);
    font-family: var(--font-nav);
    font-size: 0.95rem;
    white-space: nowrap;
}

    .nav-phone img {
        height: 16px; /* Adjust icon size as needed */
        width: auto;
        filter: brightness(0) invert(1); /* Makes icon white */
    }

.contact-info {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--white);
    padding: 0.75rem 1.5rem;
    border-radius: 25px;
    box-shadow: var(--shadow);
    border: 2px solid var(--color1);
}

.phone-icon {
    font-size: 1.1rem;
    color: var(--color1);
}

.phone-number {
    font-family: var(--font-nav);
    font-size: 1.1rem;
    font-weight: 600;
    color: var(--color2);
    white-space: nowrap;
}

        /* Login Container Styles */
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
    min-height: auto;
    padding-bottom: 20px;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 350px;
        }

        .app-icon {
            max-width: 100px;
            height: auto;
            display: block;
            margin: 0 auto 20px;
        }
        h1 {
            color:black;
            text-align: center;
            margin-bottom: 30px;
        }

        h2 {
            color: black;
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            color: #5b9bd5;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            font-size: 14px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #a9c4f1;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"],
        button {
            background-color: #7eaaf1;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-bottom: 10px;
        }

            input[type="submit"]:hover,
            button:hover {
                background-color: #5b8de0;
            }

        select {
            background-color: #FFFFFF;
            color: #5b9bd5;
            border: 1px solid #5b9bd5;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
            margin-bottom: 10px;
        }

            select:hover {
                background-color: #f2f6fc;
                color: #3a7cc1;
            }

        .message {
            color: #d9534f;
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-content {
                padding: 0 10px;
            }

            .site-logo {
                height: 60px;
            }

            .navbar {
                height: auto;
            }

            .nav-content {
                flex-wrap: wrap;
                justify-content: center;
                padding: 5px 0;
            }

            .nav-link {
                padding: 10px 15px;
                font-size: 0.85rem;
            }

            .nav-phone {
                margin-left: 0;
                width: 100%;
                text-align: center;
                padding: 5px 0;
            }

            .phone-icon {
    font-size: 1.1rem;
    color: var(--color1);
}

.phone-number {
    font-family: var(--font-nav);
    font-size: 1.1rem;
    font-weight: 600;
    color: var(--color2);
    white-space: nowrap;
}
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
                width: 95%;
            }

            h2 {
                font-size: 20px;
            }

            label, input[type="text"], input[type="password"] {
                font-size: 13px;
            }

            input[type="submit"],
            button,
            select {
                font-size: 15px;
            }
        }

           
            .footer {
    background: rgb(53, 125, 173); /* blue background */
    color: var(--white);
    padding: 2rem 0 1rem;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-wrap: wrap;
    padding: 0 2rem;
    flex-direction: row-reverse; /* reverse for Arabic */
}

.footer-logo {
    flex: 1;
    min-width: 250px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    text-align: right;
}

.footer-logo img {
    height: 160px;
    width: auto;
}

.footer-logo .arabic-text {
    font-family: var(--font-arabic);
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--white);
    margin-bottom: 0.5rem;
    direction: rtl;
    text-align: right;
}

.footer-logo .english-text {
    font-family: var(--font-subheading);
    font-size: 1rem;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 1rem;
    text-align: right;
}

.footer-contact {
    flex: 1;
    min-width: 280px;
    direction: ltr;
    text-align: left;
}

.footer-contact h4 {
    font-family: var(--font-subheading);
    font-size: 1.8rem;
    font-weight: 600;
    margin-bottom: 1.5rem;
    color: var(--white);
}

.footer-contact p {
    font-family: var(--font-body);
    font-size: 1.1rem;
    color: var(--white);
    margin-bottom: 0.6rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.footer-contact i {
    color: var(--white);
    font-size: 1.2rem;
}

.footer-bottom {
    max-width: 1200px;
    margin: 3rem auto 0;
    padding: 1.5rem 2rem 0;
    border-top: 1px solid rgba(255, 255, 255, 0.2);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.footer-bottom p {
    font-family: var(--font-body);
    font-size: 0.9rem;
    color: rgba(255, 255, 255, 0.8);
}

.social-links {
    display: flex;
    gap: 1rem;
}

.social-link {
    width: 40px;
    height: 40px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--white);
    font-size: 1.1rem;
    transition: var(--transition);
    text-decoration: none;
}

.social-link:hover {
    background: rgba(255, 255, 255, 0.2);
    transform: translateY(-2px);
}
                
.social-links {
    display: flex;
    gap: 1rem;
}

.social-link {
    width: 40px;
    height: 40px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--white);
    font-size: 1.1rem;
    transition: var(--transition);
    text-decoration: none;
}

    .social-link:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateY(-2px);
    }

/* Responsive Design */
@media (max-width: 768px) {
    .header-content {
        flex-direction: column;
        gap: 2rem;
        text-align: center;
        padding: 1rem;
    }

    .nav-content {
        position: fixed;
        flex-direction: column;
        gap: 0;
        padding: 0;
    }

    .nav-link {
        padding: 0.75rem 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        width: 100%;
        text-align: center;
    }

    .navbar,
.nav-content,
.nav-links,
.nav-link,
.nav-phone {
    direction: ltr !important;
    text-align: left !important;
}

    .header,
.header-content,
.logo-header {
    direction: ltr !important;
}

/* Force footer to always be LTR */
.footer,
.footer-content,
.footer-logo,
.footer-contact,
.footer-bottom {
    direction: ltr !important;
}

/* Only allow RTL for the login wrapper content when Arabic is selected */
body[dir="rtl"] .login-wrapper {
    direction: rtl;
}

body[dir="rtl"] .login-wrapper .form-field label,
body[dir="rtl"] .login-wrapper .form-field input,
body[dir="rtl"] .login-wrapper .welcome,
body[dir="rtl"] .login-wrapper .links {
    text-align: right;
}

/* Keep language toggle button positioned correctly */
body[dir="rtl"] .language-toggle-container {
    text-align: left;
}

body[dir="rtl"] .language-toggle-btn {
    float: left;
}
      .logo-item {
        flex: 0 0 auto;
        min-width: 100px;
        max-width: 120px;
    }

        .logo-item img {
            height: 60px;
        }
    .footer-content {
        flex-direction: column;
        text-align: center;
        gap: 2rem;
    }

    .footer-logo {
        align-items: center;
        text-align: center;
    }

    .footer-logo .arabic-text,
    .footer-logo .english-text {
        text-align: center;
    }

    .footer-contact {
        text-align: center;
    }

    .footer-contact p {
        justify-content: center;
    }

    .footer-bottom {
        flex-direction: column;
        gap: 1rem;
        text-align: center;
    }

    .footer-contact h4 {
        font-size: 1.5rem;
        justify-content: center;
    }

}
        .language-toggle-container {
    text-align: right;
    margin-bottom: 10px;
    width: 100%;
}

.language-toggle-btn {
    background-color: #f0f0f0 !important; /* Light gray */
    color: #333 !important;
    border: 1px solid #ddd !important;
    border-radius: 4px !important;
    padding: 7px 12px !important; /* Smaller padding for narrower button */
    font-size: 15px !important; /* Smaller font size */
    cursor: pointer;
    transition: all 0.3s ease;
    margin: 0;
    float: right;
    width: auto !important; /* Let the button size according to content */
    min-width: 120px; /* Minimum width to prevent too narrow */
    height: 40px; /* Fixed height for consistency */
    line-height: 1; /* Better text alignment */
}

.language-toggle-btn:hover {
    background-color: #e0e0e0 !important;
}

body[dir="rtl"] .language-toggle-btn {
    float: left;
}

        .welcome {
    margin-top: 65px;
    display: block;
    text-align: center;
    font-family: 'Yeseva One', serif;
    font-size: 2rem;
    margin-bottom: 0.75rem;
    font-weight: 700;
    margin-right: 12px;
    width: 100%;
}
</style>

</form>
</body>
</html>