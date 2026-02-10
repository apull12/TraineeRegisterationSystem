<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationStatusReg.aspx.cs" Inherits="HealthRegisterationSystem1.ApplicationStatusReg" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
    <title>Application Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
          <form id="form1" runat="server">
        <!-- Header (Logo) -->
        <header class="header">
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
            <asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/AdminLogIn.aspx" CssClass="nav-link">Admin</asp:HyperLink>
            <asp:HyperLink ID="ClearanceLink" runat="server" NavigateUrl="~/ClearancePage.aspx" CssClass="nav-link">Clearance </asp:HyperLink>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" CssClass="nav-link">Internship</asp:HyperLink>
            <asp:HyperLink ID="ApplicationStatusRegLink" runat="server" NavigateUrl="~/ApplicationStatusReg.aspx" CssClass="nav-link">Application Status</asp:HyperLink>
            </div>
        <div class="nav-phone">
            <img src="Content1/Phone_Icon (3).png" alt="Phone Icon" />
            <span>8001277000</span>
        </div>
    </div>
</nav>
   <div class="main-content" style="margin-top: 40px;">
   <div class="login-wrapper" style="width: 550px; margin-top: 60px; max-width: 90%; border: 1px solid #357dad; border-radius: 20px; padding: 2rem 1.5rem 3rem; position: relative; background: url('login-image0.png') left top/75% repeat; margin-bottom: 20px">
    <!-- Welcome text -->
    <asp:Label ID="lblHeader" runat="server" Text="Enter Application Reference No" Style="text-align: center; font-family: 'Yeseva One', serif; font-size: 2rem; margin-bottom: 0.75rem; font-weight: 700;"></asp:Label>
    
    <!-- Reference Number Input -->
    <asp:TextBox ID="txtRefNo" runat="server" 
        Style="width: 100%; padding: 0.8rem; margin-bottom: 1.5rem; border: 1px solid #ccc; border-radius: 4px; font-size: 1rem;"
        placeholder="Enter your reference number"></asp:TextBox>
    
    <!-- Message Label -->
    <asp:Label ID="lblMessage" runat="server" 
        Style="display:block; text-align:center; margin-bottom:1.5rem; color:red;"></asp:Label>
    
    <!-- Login Button -->
    <asp:Button ID="btnLogin" runat="server" Text="Go" CssClass="btn-login"
        Style="width: 100%; background: #159eec; color: white; border: none; border-radius: 20px; padding: 1rem; font-size: 1.25rem; font-weight: 600; cursor: pointer; transition: filter .25s;"
        OnClick="btnLogin_Click" />
</div>
                 </div>
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
        <div>
        </div>
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
            .welcome {
    font-size: 1.8rem !important;
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
</style>
    </form>
</body>
</html>
