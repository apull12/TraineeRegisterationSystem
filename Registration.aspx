<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HealthRegisterationSystem1.Registration" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    
    <title data-ar="تسجيل الطلاب - مدينة الملك فهد الطبية" ="Student Registration - KFMC">تسجيل الطلاب - مدينة الملك فهد الطبية</title>
    
   <style>
        .language-toggle button {
            padding: 8px 16px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
            transition: background 0.3s ease;
            margin-right: 14px;
            margin-left: 14px;
        }
        
        .language-toggle button:hover {
            background-color: #e6e6e6;
            color:white;
        }

        .language-toggle button.active {
            background-color: #3498db;
            color: white;
        }

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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-body);
            line-height: 1.6;
            color: var(--text-dark);
            background-color: #d9eaff;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        
        html[lang="ar"] body {
            direction: rtl;
            text-align: right;
        }
        
        html[lang="en"] body {
            direction: ltr;
            text-align: left;
        }

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

      .navbar {
    box-shadow: none;
    position: relative;
    z-index: 999;
    margin: 0;
    padding: 0;
    border: none;
    height: 63px;
    background: rgb(53, 125, 173);
    direction: ltr !important;
    width: 100%;
}
.nav-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 2rem; /* Added more padding */
    display: flex !important;
    align-items: center;
    height: 100%;
    position: relative;
    width: 100%;
    box-sizing: border-box;
}

.nav-links {
    position: absolute !important;
    left: 0.5rem !important;
    top: 50% !important;
    transform: translateY(-50%) !important;
    display: flex !important;
    align-items: center !important;
    gap: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    height: 100% !important;
    z-index: 10 !important;
}
/* Phone container - ABSOLUTELY positioned to the RIGHT */
.nav-phone {
    position: absolute !important;
    right: 2rem !important;
    top: 50% !important;
    transform: translateY(-50%) !important;
    display: flex !important;
    align-items: center !important;
    gap: 8px !important;
    color: var(--white) !important;
    font-family: var(--font-nav) !important;
    font-size: 0.95rem !important;
    white-space: nowrap !important;
    padding: 0 !important;
    margin: 0 !important;
    height: auto !important;
    z-index: 10 !important;
    background: transparent !important;
}

/* For RTL (Arabic) layout */
html[lang="ar"] .nav-links {
    margin-right: 0;
    margin-left: auto; /* Push links to the right */
}

html[lang="ar"] .nav-phone {
    margin-left: 0;
    margin-right: 40px; /* Fixed space for RTL */
}
     
.nav-link {
    font-family: var(--font-nav) !important;
    display: flex !important;
    align-items: center !important;
    padding: 0 1.5rem !important;
    color: var(--white) !important;
    text-decoration: none !important;
    font-weight: 400 !important;
    font-size: 0.95rem !important;
    transition: var(--transition) !important;
    text-transform: capitalize !important;
    border-bottom: 3px solid transparent !important;
    margin: 0 !important;
    height: 63px !important; /* Match navbar height */
    white-space: nowrap !important;
    background: transparent !important;
    line-height: 63px !important;
}


/* Force separation - create invisible spacer */
.nav-content::before {
    content: '';
    position: absolute;
    left: 50%;
    top: 0;
    width: 2px;
    height: 100%;
    background: transparent;
    z-index: 1;
}

.nav-link:hover,
.nav-link.active {
    background: rgba(255, 255, 255, 0.1);
    color: var(--white);
    border-bottom: none;
}

.nav-phone img {
    height: 16px;
    width: auto;
    filter: brightness(0) invert(1);
}
        
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .container .language-toggle {
            margin-top:1%;
            margin-bottom: 1%;
            gap: 5px;
        }

        .main-content {
            padding: 20px;
        }

        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 30px;
            color: var(--color3);
            font-weight: 600;
        }

        .form-section {
            margin-bottom: 40px;
            padding: 25px;
            background: #f8f9fa;
            border-radius: 10px;
            border: 1px solid #e9ecef;
            animation: slideIn 0.6s ease-out;
        }

        .form-row-paired {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .form-column {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 15px;
            align-items: center;
        }

        .form-label {
            font-weight: bold;
            font-size: 0.95rem;
            color: #333;
        }

        html[lang="ar"] .form-label {
            text-align: right;
        }

        html[lang="en"] .form-label {
            text-align: left;
        }

        .form-input input,
        .form-input select {
            width: 100%;
            padding: 12px 10px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: white;
            box-sizing: border-box;
        }

        .form-input input:focus,
        .form-input select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .phone-input-container {
            display: flex;
            width: 100%;
            gap: 10px;
            align-items: center;
        }

        .country-code-wrapper {
            width: 100px;
            flex-shrink: 0;
        }

        .country-code-wrapper select {
            width: 100%;
            padding: 12px 8px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 0.95em;
            background: white;
            box-sizing: border-box;
        }

        .phone-number-wrapper {
            flex-grow: 1;
        }

        .phone-number-wrapper input {
            width: 100%;
            padding: 12px 10px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1em;
            background: white;
            box-sizing: border-box;
        }

        input[type="file"] {
            padding: 10px;
            background: #f8f9fa;
            border: 2px dashed #3498db;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .form-actions {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        .btn-register,
        .btn-reset {
            padding: 15px 30px;
            font-size: 1.1em;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            min-width: 150px;
        }

        .btn-register {
            background: #1d5280;
            color: white;
        }

        .btn-register:hover {
            background: #568ab8;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(29, 82, 128, 0.3);
        }

        .btn-reset {
            background: #2E6DA4;
            color: white;
        }

        .btn-reset:hover {
            background: #265279;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 109, 164, 0.3);
        }
        
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
     

        .footer {
    background: rgb(53, 125, 173);
    color: var(--white);
    padding: 2rem 0 1rem;
    direction: ltr !important; /* Force LTR for footer */
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-wrap: wrap;
    padding: 0 2rem;
    /* Removed flex-direction: row-reverse */
}

.footer-contact {
    flex: 1;
    min-width: 280px;
    text-align: left; /* Contact on the left */
    order: 1; /* Ensure contact appears first (left) */
}

.footer-logo {
    flex: 1;
    min-width: 250px;
    display: flex;
    flex-direction: column;
    align-items: flex-end; /* Logo on the right */
    text-align: right;
    order: 2; /* Ensure logo appears second (right) */
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

        .lang-en { display: none; }
        .lang-ar { display: none; }

        html[lang="en"] .lang-en { display: block; }
        html[lang="ar"] .lang-ar { display: block; }

        .success-message {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
            padding: 15px;
            margin: 15px 0;
            font-size: 16px;
            font-weight: bold;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" method="post" enctype="multipart/form-data" onsubmit="return validateFormBeforeSubmit();">
        
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
                    <asp:HyperLink ID="ClearanceLink" runat="server" NavigateUrl="~/ClearancePage.aspx" CssClass="nav-link">Clearance</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" CssClass="nav-link">Internship</asp:HyperLink>
                    <asp:HyperLink ID="ApplicationStatusLink" runat="server" NavigateUrl="~/ApplicationStatusReg.aspx" CssClass="nav-link">Application Status</asp:HyperLink>
                </div>
                <div class="nav-phone">
                    <img src="Content1/Phone_Icon (3).png" alt="Phone Icon" />
                    <span>8001277000</span>
                </div>
            </div>
        </nav>
         
        <div class="container">
            <div class="language-toggle">
                <button type="button" onclick="switchLanguage('ar')" id="btn-ar">عربي</button>
                <button type="button" onclick="switchLanguage('en')" id="btn-en" class="active">English</button>
            </div>
            
            <main class="main-content">
                <div class="form-section">
                    <div class="form-row-paired">
                        <!-- Left Column -->
                        <div class="form-column">
                            <div class="form-row">
                                <div class="form-label" data-ar="المُعرف المدني" data-en="Residence Id">Residence Id</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-label" data-ar="إسم الطالب (بالعربية)" data-en="Student name In Arabic">Student name In Arabic</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtArabicName" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="رقم الجوال" data-en="Mobile Phone">Mobile Phone</div>
                                <div class="form-input">
                                    <div class="phone-input-container">
                                        <div class="country-code-wrapper">
                                            <asp:DropDownList ID="ddlCountryCode" runat="server">
                                                <asp:ListItem Value="+966">+966</asp:ListItem>
                                                <asp:ListItem Value="+965">+965</asp:ListItem>
                                                <asp:ListItem Value="+971">+971</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="phone-number-wrapper">
                                            <asp:TextBox ID="txtMobile" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="الدولة" data-en="Country">Country</div>
                                <div class="form-input">
                                    <asp:DropDownList ID="ddlCountry" runat="server">
                                        <asp:ListItem Value="" data-ar="اختر الدولة" data-en="Select Country">Select Country</asp:ListItem>
                                        <asp:ListItem Value="SA" data-ar="المملكة العربية السعودية" data-en="Saudi Arabia">Saudi Arabia</asp:ListItem>
                                        <asp:ListItem Value="AE" data-ar="الإمارات العربية المتحدة" data-en="UAE">UAE</asp:ListItem>
                                        <asp:ListItem Value="KW" data-ar="الكويت" data-en="Kuwait">Kuwait</asp:ListItem>
                                        <asp:ListItem Value="QA" data-ar="قطر" data-en="Qatar">Qatar</asp:ListItem>
                                        <asp:ListItem Value="other" data-ar="أخرى" data-en="Other">Other</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="اسم الجامعة" data-en="University name">University name</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtUniversity" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="التخصص" data-en="Degree Major">Degree Major</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtMajor" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="تاريخ بداية التدريب" data-en="Training start date">Training start date</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="اسم المشرف الأكاديمي" data-en="Academic Supervisor Name">Academic Supervisor Name</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtSupName" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="خطاب التدريب التعاوني" data-en="Cooperative Training Letter">Cooperative Training Letter</div>
                                <div class="form-input">
                                    <asp:FileUpload ID="fileUploadLetter" runat="server" />
                                    <small>(PDF or Word only)</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Right Column -->
                        <div class="form-column">
                            <div class="form-row">
                                <div class="form-label" data-ar="رقم الطالب الجامعي" data-en="Student ID">Student ID</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtStudentId" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="إسم الطالب (بالإنجليزية)" data-en="Student name In English">Student name In English</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtEnglishName" runat="server" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="العمر" data-en="Age">Age</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="البريد الإلكتروني" data-en="Email">Email</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="الجنس" data-en="Gender">Gender</div>
                                <div class="form-input">
                                    <asp:DropDownList ID="ddlGender" runat="server">
                                        <asp:ListItem Value="" data-ar="اختر الجنس" data-en="Choose Gender">Choose Gender</asp:ListItem>
                                        <asp:ListItem Value="male" data-ar="ذكر" data-en="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="female" data-ar="أنثى" data-en="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="الدرجة العلمية" data-en="Degree">Degree</div>
                                <div class="form-input">
                                    <asp:DropDownList ID="ddlDegree" runat="server">
                                        <asp:ListItem Value="" data-ar="اختر الدرجة العلمية" data-en="Choose Degree">Choose Degree</asp:ListItem>
                                        <asp:ListItem Value="bachelor" data-ar="بكالوريوس" data-en="Bachelor's">Bachelor's</asp:ListItem>
                                        <asp:ListItem Value="master" data-ar="ماجستير" data-en="Master's">Master's</asp:ListItem>
                                        <asp:ListItem Value="phd" data-ar="دكتوراه" data-en="PhD">PhD</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="تاريخ نهاية التدريب" data-en="Training end date">Training end date</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="بريد المشرف الأكاديمي" data-en="Academic Supervisor Email">Academic Supervisor Email</div>
                                <div class="form-input">
                                    <asp:TextBox ID="txtSupEmail" runat="server" TextMode="Email" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-label" data-ar="السيرة الذاتية" data-en="CV">CV</div>
                                <div class="form-input">
                                    <asp:FileUpload ID="fileUploadCV" runat="server" />
                                    <small>(PDF or Word only)</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <div class="form-actions">
    <asp:Label ID="Label1" runat="server" CssClass="result-message"></asp:Label>
<asp:Label ID="lblReferenceMessage" runat="server" Visible="false" CssClass="reference-message"></asp:Label>

    
    <button type="button" class="btn-reset" data-ar="إعادة تعيين" data-en="Reset" onclick="location.href='Registration.aspx'">
        إعادة تعيين
    </button>
    <asp:Button ID="Button1" runat="server" 
    CssClass="btn-register" 
    OnClick="btnRegister_Click" 
    OnClientClick="return validateFormBeforeSubmit();"
    data-ar="تسجيل" 
    data-en="Register" 
    Text="تسجيل" />
</div>
</main>
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

 <script>

let currentLanguage = 'ar';

// Language switching functionality
function switchLanguage(lang) {
    currentLanguage = lang;

    // Update button states
    const btnAr = document.getElementById('btn-ar');
    const btnEn = document.getElementById('btn-en');

    if (btnAr && btnEn) {
        btnAr.classList.toggle('active', lang === 'ar');
        btnEn.classList.toggle('active', lang === 'en');
    }

    // Update all translatable elements
    const elements = document.querySelectorAll('[data-ar][data-en]');
    elements.forEach(el => {
        const text = el.getAttribute('data-' + lang);
        if (text) {
            // For ASP.NET buttons, we need to update the value attribute
            if (el.tagName === 'INPUT' && el.type === 'submit') {
                el.value = text;
            } else {
                el.textContent = text;
            }
        }
    });

    // Update document direction and language
    document.body.dir = lang === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = lang;

    // Update select options
    updateSelectOptions();

    // Create or update hidden language input for form submission
    let langInput = document.querySelector('input[name="language"]');
    if (!langInput) {
        langInput = document.createElement('input');
        langInput.type = 'hidden';
        langInput.name = 'language';
        const form = document.getElementById('form1');
        if (form) form.appendChild(langInput);
    }
    langInput.value = lang;
}

function updateSelectOptions() {
    // Update Country dropdown - Fixed ID to match C#
    const countrySelect = document.getElementById('ddlCountry');
    if (countrySelect) {
        const options = countrySelect.querySelectorAll('option');
        options.forEach(option => {
            if (option.value === '') {
                option.textContent = currentLanguage === 'ar' ? 'اختر الدولة' : 'Select Country';
            } else if (option.value === 'SA') {
                option.textContent = currentLanguage === 'ar' ? 'المملكة العربية السعودية' : 'Saudi Arabia';
            } else if (option.value === 'AE') {
                option.textContent = currentLanguage === 'ar' ? 'الإمارات العربية المتحدة' : 'UAE';
            } else if (option.value === 'KW') {
                option.textContent = currentLanguage === 'ar' ? 'الكويت' : 'Kuwait';
            } else if (option.value === 'QA') {
                option.textContent = currentLanguage === 'ar' ? 'قطر' : 'Qatar';
            } else if (option.value === 'other') {
                option.textContent = currentLanguage === 'ar' ? 'أخرى' : 'Other';
            }
        });
    }

    // Update Gender dropdown - Fixed ID to match C#
    const genderSelect = document.getElementById('ddlGender');
    if (genderSelect) {
        const options = genderSelect.querySelectorAll('option');
        options.forEach(option => {
            if (option.value === '') {
                option.textContent = currentLanguage === 'ar' ? 'اختر الجنس' : 'Choose Gender';
            } else if (option.value === 'male') {
                option.textContent = currentLanguage === 'ar' ? 'ذكر' : 'Male';
            } else if (option.value === 'female') {
                option.textContent = currentLanguage === 'ar' ? 'أنثى' : 'Female';
            }
        });
    }

    // Update Degree dropdown - Fixed ID to match C#
    const degreeSelect = document.getElementById('ddlDegree');
    if (degreeSelect) {
        const options = degreeSelect.querySelectorAll('option');
        options.forEach(option => {
            if (option.value === '') {
                option.textContent = currentLanguage === 'ar' ? 'اختر الدرجة العلمية' : 'Choose Degree';
            } else if (option.value === 'bachelor') {
                option.textContent = currentLanguage === 'ar' ? 'بكالوريوس' : "Bachelor's";
            } else if (option.value === 'master') {
                option.textContent = currentLanguage === 'ar' ? 'ماجستير' : "Master's";
            } else if (option.value === 'phd') {
                option.textContent = currentLanguage === 'ar' ? 'دكتوراه' : 'PhD';
            }
        });
    }
}

// Input validation functions
function isNumber(evt) {
    const charCode = evt.which ? evt.which : evt.keyCode;
    return charCode >= 48 && charCode <= 57;
}

function isEnglish(evt) {
    const charCode = evt.which ? evt.which : evt.keyCode;
    // Allow letters, space, and common punctuation
    return (charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122) ||
        charCode === 32 || charCode === 8; // space and backspace
}

// Date validation - Fixed to match C# field IDs
function validateDates() {
    const startDateInput = document.getElementById('txtStartDate');
    const endDateInput = document.getElementById('txtEndDate');
    
    if (!startDateInput || !endDateInput) return true;
    
    const startDate = startDateInput.value;
    const endDate = endDateInput.value;

    if (startDate && endDate) {
        const start = new Date(startDate);
        const end = new Date(endDate);
        const today = new Date();
        today.setHours(0, 0, 0, 0);

        if (start < today) {
            alert(currentLanguage === 'ar' ?
                'تاريخ بداية التدريب يجب أن يكون في المستقبل' :
                'Training start date must be in the future');
            startDateInput.value = '';
            return false;
        }

        if (end <= start) {
            alert(currentLanguage === 'ar' ?
                'تاريخ نهاية التدريب يجب أن يكون بعد تاريخ البداية' :
                'Training end date must be after start date');
            endDateInput.value = '';
            return false;
        }
    }
    return true;
}

// File validation - Fixed for ASP.NET FileUpload controls
     function validateFile(fileUploadId, maxSizeMB = 5) {
         const fileUploadControl = document.getElementById(fileUploadId);
         if (!fileUploadControl) return true;

         const fileInput = fileUploadControl.querySelector('input[type="file"]') || fileUploadControl;

         if (!fileInput || !fileInput.files || fileInput.files.length === 0) {
             return true;
         }

         const file = fileInput.files[0];

         // Size validation
         const fileSizeMB = file.size / 1024 / 1024;
         if (fileSizeMB > maxSizeMB) {
             alert(currentLanguage === 'ar' ?
                 `حجم الملف يجب أن يكون أقل من ${maxSizeMB}MB` :
                 `File size must be less than ${maxSizeMB}MB`);
             fileInput.value = '';
             return false;
         }

         // Type validation
         const allowedTypes = [
             'application/pdf',
             'application/msword',
             'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
         ];

         if (!allowedTypes.includes(file.type)) {
             alert(currentLanguage === 'ar' ?
                 'نوع الملف غير مدعوم. يرجى اختيار PDF أو Word فقط.' :
                 'Unsupported file type. Please select PDF or Word files only.');
             fileInput.value = '';
             return false;
         }

         return true;
     }

// Form validation - Updated to match C# field IDs exactly
function validateForm() {
    // Check required fields - Updated IDs to match C# code exactly
    const requiredFields = [
        { id: 'txtId', nameAr: 'رقم الإقامة', nameEn: 'Residence ID' },
        { id: 'txtStudentId', nameAr: 'رقم الطالب الجامعي', nameEn: 'Student ID' },
        { id: 'txtArabicName', nameAr: 'اسم الطالب بالعربية', nameEn: 'Student name in Arabic' },
        { id: 'txtEnglishName', nameAr: 'اسم الطالب بالإنجليزية', nameEn: 'Student name in English' },
        { id: 'txtAge', nameAr: 'العمر', nameEn: 'Age' },
        { id: 'txtMobile', nameAr: 'رقم الجوال', nameEn: 'Mobile' },
        { id: 'txtEmail', nameAr: 'البريد الإلكتروني', nameEn: 'Email' },
        { id: 'ddlGender', nameAr: 'الجنس', nameEn: 'Gender' },
        { id: 'ddlCountry', nameAr: 'الدولة', nameEn: 'Country' },
        { id: 'txtUniversity', nameAr: 'اسم الجامعة', nameEn: 'University name' },
        { id: 'txtMajor', nameAr: 'التخصص', nameEn: 'Major' },
        { id: 'ddlDegree', nameAr: 'الدرجة العلمية', nameEn: 'Degree' },
        { id: 'txtStartDate', nameAr: 'تاريخ بداية التدريب', nameEn: 'Training start date' },
        { id: 'txtEndDate', nameAr: 'تاريخ نهاية التدريب', nameEn: 'Training end date' },
        { id: 'txtSupName', nameAr: 'اسم المشرف الأكاديمي', nameEn: 'Academic supervisor name' },
        { id: 'txtSupEmail', nameAr: 'بريد المشرف الأكاديمي', nameEn: 'Academic supervisor email' }
    ];

    let errors = [];

    // Validate required fields
    requiredFields.forEach(field => {
        const element = document.getElementById(field.id);
        if (!element) {
            console.error(`Element with ID '${field.id}' not found in the DOM`);
            return;
        }
        
        let value = '';
        if (element.tagName === 'SELECT') {
            value = element.selectedValue || element.value;
        } else {
            value = element.value;
        }
        
        if (!value || !value.trim()) {
            const fieldName = currentLanguage === 'ar' ? field.nameAr : field.nameEn;
            errors.push(fieldName + (currentLanguage === 'ar' ? ' مطلوب' : ' is required'));
        }
    });

    // Specific validations - matching C# validation logic
    const id = document.getElementById('txtId');
    if (id && id.value) {
        const cleanId = cleanInput(id.value);
        if (cleanId.length !== 10 || !isValidNumber(cleanId)) {
            errors.push(currentLanguage === 'ar' ?
                'رقم الإقامة يجب أن يكون 10 أرقام' :
                'Residence ID must be 10 digits');
        
        }
        if (!isValidNumber(cleanId)) {
            errors.push(currentLanguage === 'ar' ?
                'يجب أن يحتوي رقم الإقامة على أرقام فقط' :
                'Residence ID must contain only numbers');
        }
    }


    const studentId = document.getElementById('txtStudentId');
    if (studentId && studentId.value && !isValidNumber(studentId.value)) {
        errors.push(currentLanguage === 'ar' ?
            'رقم الطالب الجامعي غير صحيح' :
            'Invalid student ID');
    }

    const age = document.getElementById('txtAge');
    if (age && age.value) {
        const ageValue = parseInt(age.value);
        if (isNaN(ageValue) || ageValue < 18 || ageValue > 50) {
            errors.push(currentLanguage === 'ar' ?
                'العمر يجب أن يكون بين 18 و 50 سنة' :
                'Age must be between 18 and 50');
        }
    }

    const email = document.getElementById('txtEmail');
    if (email && email.value && !isValidEmail(email.value)) {
        errors.push(currentLanguage === 'ar' ?
            'البريد الإلكتروني غير صحيح' :
            'Invalid email address');
    }

    const supervisorEmail = document.getElementById('txtSupEmail');
    if (supervisorEmail && supervisorEmail.value && !isValidEmail(supervisorEmail.value)) {
        errors.push(currentLanguage === 'ar' ?
            'بريد المشرف الأكاديمي غير صحيح' :
            'Invalid supervisor email address');
    }

    const mobile = document.getElementById('txtMobile');
    if (mobile && mobile.value && (mobile.value.length < 9 || !isValidNumber(mobile.value))) {
        errors.push(currentLanguage === 'ar' ?
            'رقم الجوال غير صحيح' :
            'Invalid mobile number');
    }

    // Date validation
    if (!validateDates()) {
        return false;
    }

    // File validation - Updated to match C# FileUpload control IDs
    if (!validateFile('fileUploadLetter')) {
        return false;
    }

    if (!validateFile('fileUploadCV')) {
        return false;
    }

    // Check if files are selected - matching C# required file validation
    const letterInput = document.getElementById('fileUploadLetter');
    if (letterInput) {
        const letterFileInput = letterInput.querySelector('input[type="file"]') || letterInput;
        if (!letterFileInput.files || !letterFileInput.files.length) {
            errors.push(currentLanguage === 'ar' ?
                'خطاب التدريب التعاوني مطلوب' :
                'Cooperative training letter is required');
        }
    }

    const cvInput = document.getElementById('fileUploadCV');
    if (cvInput) {
        const cvFileInput = cvInput.querySelector('input[type="file"]') || cvInput;
        if (!cvFileInput.files || !cvFileInput.files.length) {
            errors.push(currentLanguage === 'ar' ?
                'السيرة الذاتية مطلوبة' :
                'CV is required');
        }
    }

    if (errors.length > 0) {
        alert(errors.join('\n'));
        return false;
    }

    return true;
}

// Helper validation functions
function isValidNumber(str) {
    return /^\d+$/.test(str);
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Initialize language on page load
document.addEventListener('DOMContentLoaded', function () {
    switchLanguage(currentLanguage);

    // Add event listeners for date validation
    const startDateInput = document.getElementById('txtStartDate');
    const endDateInput = document.getElementById('txtEndDate');

    if (startDateInput) {
        startDateInput.addEventListener('change', validateDates);
    }

    if (endDateInput) {
        endDateInput.addEventListener('change', validateDates);
    }

    // Add file validation listeners - Updated for C# FileUpload controls
    const coopLetterInput = document.getElementById('fileUploadLetter');
    const cvInput = document.getElementById('fileUploadCV');

    if (coopLetterInput) {
        const letterFileInput = coopLetterInput.querySelector('input[type="file"]') || coopLetterInput;
        if (letterFileInput) {
            letterFileInput.addEventListener('change', function () {
                validateFile('fileUploadLetter');
            });
        }
    }

    if (cvInput) {
        const cvFileInput = cvInput.querySelector('input[type="file"]') || cvInput;
        if (cvFileInput) {
            cvFileInput.addEventListener('change', function () {
                validateFile('fileUploadCV');
            });
        }
    }
});

// Function to be called before form submission (attach to your submit button)
function validateFormBeforeSubmit() {
    return validateForm();
     }
     function validateFileSize(fileInputId, maxSizeMB) {
         const fileInput = document.getElementById(fileInputId);
         if (fileInput.files.length > 0) {
             const fileSize = fileInput.files[0].size / 1024 / 1024; // in MB
             if (fileSize > maxSizeMB) {
                 alert(`File size exceeds ${maxSizeMB}MB limit`);
                 fileInput.value = '';
                 return false;
             }
         }
         return true;
     }
 </script>
        </form>
</body>
</html>