<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationStatus.aspx.cs" Inherits="HealthRegisterationSystem1.ApplicationStatus" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
    <title>Training Acceptance</title>
</head>
<body>
    <form id="form1" runat="server">
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
        <div id="loading" runat="server" style="text-align: center; padding: 20px;">
    <i class="fas fa-spinner fa-spin"></i> Loading application status...
</div>

     <!-- Dashboard Section -->
        <main class="dashboard">
            <section class="application-status">
                <h2>Application Status</h2>
                <table class="status-table">
                     <thead>
        <tr>
            <th>Reference No.</th>
            <th>Name of Application</th>
            <th>Status</th>
            <th>View Letter</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><asp:Label ID="lblRefNumber" runat="server" Text="#1127" /></td>
            <td><asp:Label ID="lblProgramName" runat="server" Text="KFMC Internship Program" /></td>
            <td>
                <span class="status-badge" runat="server" id="statusBadge">
                    <asp:Label ID="lblStatus" runat="server" Text="Accepted" />
                </span>
            </td>
            <td>
         <asp:LinkButton ID="btnViewLetter" runat="server" CssClass="view-letter-btn" OnClientClick="toggleLetterDetails(); return false;">
        Click Here
    </asp:LinkButton>
</td>
        </tr>
    </tbody>
</table>
            </section>
        </main>

        <!-- Letter Container - appears below dashboard -->
        <div id="letter-container" class="letter-container">
            <!-- Acceptance Letter -->
            <div id="acceptance-letter" class="letter-details">
                <div class="date-box">15 / 7 / 2025</div>
                <p>تحية طيبة وبعد،،</p>
                <p>
                    يسر إدارة التدريب الإداري والفني بالتجمع الصحي الثاني<br />
                    بـ (مدينة الملك فهد الطبية)<br />
                    بقبول التدريب الميداني الحضوري للطالب/ـة المذكور بياناته/ا أدناه:
                </p>
                <p><span class="info-label">رقم الملف التدريبي:</span> 9966</p>
                <p><span class="info-label">الرقم الجامعي:</span> 2019123456</p>
                <p><span class="info-label">الاسم:</span> <span id="acceptance-student-name">أحمد محمد</span></p>
                <p><span class="info-label">اسم الجامعة:</span> جامعة سعود</p>
                <p><span class="info-label">التخصص:</span> هندسة حاسب</p>
                <p><span class="info-label">البداية:</span> 22/6/2025</p>
                <p><span class="info-label">النهاية:</span> 22/8/2025</p>
                <p>
                    لمزيد من المعلومات الاتصال على:<br />
                    <span class="info-label">0112889999 تحويلة: 10873</span><br />
                    <span class="info-label">جوال:</span> 0555556319<br />
                    <span class="info-label">إيميل:</span> nalgahtani@kfmc.med.sa<br />
                    <span class="info-label">الأستاذ:</span> نايف القحطاني
                </p>
                <p>وشكرًا..</p>
                <button class="hide-letter-btn" onclick="hideLetterDetails()">Hide Letter</button>
            </div>

            <!-- Rejection Letter -->
            <div id="rejection-letter" class="letter-details rejection-letter">
                <div class="date-box"></div>
                <p>تحية طيبة وبعد،،</p>
                <p>
                    نعتذر من إدارة التدريب الإداري والفني بالتجمع الصحي الثاني<br />
                    بـ (مدينة الملك فهد الطبية)<br />
                    عن عدم قبول التدريب الميداني للطالب/ـة المذكور بياناته/ا أدناه:
                </p>
                <p><span class="info-label">رقم المرجع:</span> <span id="rejection-ref-no"></span></p>
                <p><span class="info-label">الاسم:</span> <span id="rejection-student-name"></span></p>
                <p><span class="info-label">تاريخ التقديم:</span> <span id="rejection-date"></span></p>
                <p>
                    نأسف لعدم تمكننا من قبولكم في هذا الوقت بسبب اكتمال العدد المطلوب.<br />
                    نشكركم على اهتمامكم ونتمنى لكم التوفيق في فرص أخرى.<br />
                    <br />
                    لمزيد من المعلومات الاتصال على:<br />
                    <span class="info-label">0112889999 تحويلة: 10873</span><br />
                    <span class="info-label">جوال:</span> 0555556319<br />
                    <span class="info-label">إيميل:</span> nalgahtani@kfmc.med.sa<br />
                    <span class="info-label">الأستاذ:</span> نايف القحطاني
                </p>
                <p>وشكرًا..</p>
                <button class="hide-letter-btn" onclick="hideLetterDetails()">Hide Letter</button>
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
    </form>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;600&display=swap');
    :root {
    --white: #ffffff;
    --text-dark: #222222;
    --color1: #4A90E2;
    --color2: #357ABD;
    --color3: #2E6DA4;
    --font-nav: 'Cairo', sans-serif;
    --font-body: 'Cairo', sans-serif;
    --font-subheading: 'Cairo', sans-serif;
    --font-arabic: 'Cairo', sans-serif;
    --transition: all 0.3s ease;
    --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
        body {
            font-family: 'Cairo', sans-serif;
            background-color: #f7fbff;
            margin: 0;
            padding: 0;
        }

        /* Header & Navigation */
        .header {
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .site-logo {
            height: 70px;
            width: auto;
        }

        .navbar {
            background: rgb(53, 125, 173);
            height: 63px;
        }

        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 0;
        }

        .nav-link {
            color: white;
            text-decoration: none;
            padding: 0 1.5rem;
            font-size: 0.95rem;
            height: 100%;
            display: flex;
            align-items: center;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .nav-phone {
            color: white;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-phone img {
            height: 16px;
            filter: brightness(0) invert(1);
        }
        /* Dashboard & Status */
        .dashboard {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
           
        }
        
        .application-status {
            background: white;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            margin-top: 30px;
            animation: fadeInUp 0.6s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .application-status h2 {
            font-size: 26px;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        
        .status-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .status-table thead {
            background: linear-gradient(135deg, #4a90e2, #357abd);
        }
        
        .status-table th {
            color: white;
            padding: 18px 20px;
            text-align: left;
            font-size: 18px;
        }
        
        .status-table td {
            padding: 18px 20px;
            border-bottom: 1px solid #e8ecf0;
            font-size: 17px;
        }
        
        .status-table tr:hover {
            background: #f8f9fb;
        }
        
        /* Letter Container */
        .letter-container {
            max-width: 1200px;
            margin: 0 auto 30px;
            padding: 0 28px;
            display: none;
        }
        
        .letter-details {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            direction: rtl;
            text-align: right;
            animation: fadeIn 0.3s ease-out;
            display: none;
        }

        .letter-details.show {
            display: block;
        }
        
        .view-letter-btn {
            background: none;
            border: none;
            color: #4a90e2;
            text-decoration: underline;
            cursor: pointer;
            font-size: 15px;
            padding: 0;
        }
        
        .view-letter-btn:hover {
            color: #357abd;
            text-decoration: none;
        }
        
        .hide-letter-btn {
            background: #4a90e2;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        .date-box {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }
        
        .info-label {
            font-weight: bold;
            color: #2c3e50;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Rejection Letter Specific Styles */
        .rejection-letter {
            padding: 20px !important;
            font-size: 0.9em;
        }

        .rejection-letter p {
            margin-bottom: 10px !important;
        }

        .rejection-letter .info-label {
            font-size: 0.95em;
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
        margin-bottom: 5%;
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
            color: white;
        }

.status-accepted {
    background-color: #e6f7ee;  /* Light green background */
    color: #00a65a;            /* Dark green text */
    border: 1px solid #a3e6cb; /* Light green border */
}

.status-rejected {
    background-color: #ffeaea;  /* Light red background */
    color: #d9534f;            /* Dark red text */
    border: 1px solid #f5c6cb; /* Light red border */
}
.status-badge::before {
    content: "";
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    margin-right: 6px;
}

.status-accepted::before {
    background-color: #00a65a; /* Green dot */
    box-shadow: 0 0 0 2px rgba(0, 166, 90, 0.2); /* Optional subtle glow */
}

.status-rejected::before {
    background-color: #d9534f; /* Red dot */
    box-shadow: 0 0 0 2px rgba(217, 83, 79, 0.2); /* Optional subtle glow */
}

.status-badge {
    padding: 5px 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: capitalize;
    border-radius: 15px;
}

.status-badge:hover {
    transform: translateY(-1px);
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

    @media (max-width: 768px) {
        .nav-content {
            flex-direction: column;
            height: auto;
            padding: 10px;
        }

        .nav-links {
            flex-direction: column;
            width: 100%;
        }

        .nav-link {
            padding: 10px;
            width: 100%;
            justify-content: center;
        }

        .nav-phone {
            margin-top: 10px;
            justify-content: center;
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
<script>
    // Global variables to store application data
    let currentRefNo = '';
    let currentStudentName = '';
    let currentStatus = '';

    // Enhanced script with better letter handling
    document.addEventListener('DOMContentLoaded', function () {
        // Initial animation for table row
        const tableRow = document.querySelector('.status-table tbody tr');
        if (tableRow) {
            tableRow.style.opacity = '0';
            tableRow.style.transform = 'translateX(-20px)';
            tableRow.style.transition = 'all 0.5s ease';

            setTimeout(() => {
                tableRow.style.opacity = '1';
                tableRow.style.transform = 'translateX(0)';
            }, 100);
        }
    });

    function toggleLetterDetails(event) {
        // Prevent default behavior (form submission)
        if (event) event.preventDefault();

        const container = document.getElementById('letter-container');
        const isHidden = container.style.display === 'none' || container.style.display === '';

        if (isHidden) {
            // Show the appropriate letter based on current status
            showCorrectLetter();
            container.style.display = 'block';
            setTimeout(() => {
                container.scrollIntoView({ behavior: 'smooth' });
            }, 50);
        } else {
            container.style.display = 'none';
        }
        return false; // Important for ASP.NET buttons
    }

    function hideLetterDetails() {
        document.getElementById('letter-container').style.display = 'none';
    }

    function showCorrectLetter() {
        const acceptanceLetter = document.getElementById('acceptance-letter');
        const rejectionLetter = document.getElementById('rejection-letter');

        // Hide both letters first
        acceptanceLetter.style.display = 'none';
        rejectionLetter.style.display = 'none';

        // Format today's date
        const today = new Date();
        const formattedDate = `${today.getDate()} / ${today.getMonth() + 1} / ${today.getFullYear()}`;

        if (currentStatus && currentStatus.toLowerCase() === 'rejected') {
            // Show rejection letter
            rejectionLetter.style.display = 'block';
            rejectionLetter.querySelector('.date-box').textContent = formattedDate;
            document.getElementById('rejection-ref-no').textContent = '#' + currentRefNo;
            document.getElementById('rejection-student-name').textContent = currentStudentName;
            document.getElementById('rejection-date').textContent = formattedDate;
        } else {
            // Show acceptance letter
            acceptanceLetter.style.display = 'block';
            acceptanceLetter.querySelector('.date-box').textContent = formattedDate;
            document.getElementById('acceptance-student-name').textContent = currentStudentName;
        }
    }

    // Enhanced letter update function
    function updateLetterForStatus(refNo, studentName, status) {
        // Store the data globally
        currentRefNo = refNo;
        currentStudentName = studentName;
        currentStatus = status;

        // Update the letter content immediately if the container is visible
        const container = document.getElementById('letter-container');
        if (container.style.display === 'block') {
            showCorrectLetter();
        }
    }
</script>
</body>
</html>