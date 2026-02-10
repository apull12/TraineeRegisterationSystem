<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HealthRegisterationSystem1.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="canonical" href="https://.com" />
    <title>Riyadh Second Health Cluster</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content1/WebForm1.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel ="preconnect" href="https://fonts.googleapis.com" /> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
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
            <asp:HyperLink ID="ClearanceLink" runat="server" NavigateUrl="~/ClearancePage.aspx" CssClass="nav-link">Clearance</asp:HyperLink>
            <asp:HyperLink ID="ApplyNowLink" runat="server" NavigateUrl="~/Registration.aspx" CssClass="nav-link">Internship</asp:HyperLink>
            <asp:HyperLink ID="ApplicationStatusLink" runat="server" NavigateUrl="~/ApplicationStatusReg.aspx" CssClass="nav-link">Application Status</asp:HyperLink>
        </div>
        <div class="nav-phone">
            <img src="Content1/Phone_Icon (3).png" alt="Phone Icon" />
            <span>8001277000</span>
        </div>
    </div>
</nav>

        <main class="main-content">
            <section class="hero-section">
                <div class="hero-text">
                    <h1>Leading the Way<br />in Medical Excellence</h1>
                </div>
            </section>

            <!-- Semi-circles -->
            <div class="semicircles-container">
                <div class="semicircle left-semicircle">
                    <div class="circle-label">Internship</div>
                    <div class="hover-content">
                        <p class="hover-text">Apply for our internship at King Fahad Medical City – Faculty of Medicine</p>
                        <asp:HyperLink ID="ApplyNowLink1" runat="server" NavigateUrl="~/Registration.aspx" CssClass="btn btn-white">Apply Now</asp:HyperLink>
                    </div>
                </div>


                <div class="semicircle right-semicircle">
                    <div class="circle-label">Admin</div>
                    <div class="hover-content">
                        <p class="hover-text">Admin Panel Access</p>
                         <asp:HyperLink ID="AdminLink_Semicircle" runat="server" NavigateUrl="~/AdminLogIn.aspx" CssClass="btn btn-white">Apply Now</asp:HyperLink>
                    </div>
                </div>
            </div>

            <!-- Accreditation Logos Section -->
           <section class="accreditation-section">
    <div class="accreditation-logos">
        <!-- First set of logos -->
        <div class="logo-item">
            <img src="Content1/ISO.png" alt="ISO Certification" />
        </div>
        <div class="logo-item">
            <img src="Content1/AARC.png" alt="JCI Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CHAP.png" alt="CHAP Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CAP.png" alt="CAP Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CARF.png" alt="CARF Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CBAHI.png" alt="CBAHI Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/FI.png" alt="Training Center" />
        </div>
        <!-- Duplicate set for seamless loop -->
        <div class="logo-item">
            <img src="Content1/ISO.png" alt="ISO Certification" />
        </div>
        <div class="logo-item">
            <img src="Content1/AARC.png" alt="JCI Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CHAP.png" alt="CHAP Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CAP.png" alt="CAP Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CARF.png" alt="CARF Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/CBAHI.png" alt="CBAHI Accreditation" />
        </div>
        <div class="logo-item">
            <img src="Content1/FI.png" alt="Training Center" />
        </div>
    </div>

<section class="search-section">
    <div class="search-container">
            <img src="Content1/Untitled1_20250730115527.png" alt="Saudi Arabia Map" class="map-image" />
        
        <!-- Right side - Updated Search and Results -->
        <div class="search-results-container">
            <!-- Search Header -->
            <div class="search-header">
                <h2>المستشفيات</h2>
                <p>إبحث عن المستشفيات التابعة للتجمع الصحي الثاني</p>
            </div>
            <!-- Updated Search Controls with AI styling -->
            <div class="search-controls">
                <div class="search-input-group">
                    <asp:TextBox ID="txtSearch" runat="server" 
                        CssClass="search-input" 
                        placeholder="ابحث باسم المركز أو المنطقة أو المحافظة..." />
                </div>
                <div class="search-buttons">
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" 
                        CssClass="btn btn-search" 
                        OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClearSearch" runat="server" Text="عرض الكل" 
                        CssClass="btn btn-show-all" 
                        OnClick="btnClearSearch_Click" />
                </div>
            </div>
            
            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="search-message" />

<div class="hospitals-table-container">
    <asp:GridView ID="GridViewHospitals" runat="server" CssClass="hospitals-table" 
        AutoGenerateColumns="false"
        EmptyDataText="لا توجد بيانات لعرضها"
        GridLines="None"
        ShowHeader="true"
        OnRowDataBound="GridViewHospitals_RowDataBound">
        <HeaderStyle CssClass="table-header" />
        <RowStyle CssClass="table-row" />
        <AlternatingRowStyle CssClass="table-row-alt" />
        <Columns>
            <asp:BoundField DataField="إسم_المستشفى" HeaderText="إسم المستشفى" 
                           ItemStyle-CssClass="hospital-name-cell" 
                           HeaderStyle-CssClass="hospital-name-header" />
            <asp:TemplateField HeaderText="موقع_المستشفى">
                <ItemTemplate>
                    <asp:HyperLink ID="hlLocation" runat="server" 
                                   NavigateUrl='<%# CreateGoogleMapsUrl(Eval("موقع_المستشفى")) %>'
                                   Text="الرابط" 
                                   Target="_blank"
                                   CssClass="hospital-link">
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle CssClass="location-cell" />
                <HeaderStyle CssClass="location-header" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</section>

<!-- Replace your existing search-section with this updated version -->
    <section class="kfmc-cards-section">
        <div class="kfmc-card-wrapper">
            
            <!-- Mission Card -->
            <div class="kfmc-card-group">
                <div class="kfmc-card">
                    <div class="kfmc-card-content">
                        <h3>Mission</h3>
                        <p>
                            To implement digital transformation strategies that enhance beneficiaries' satisfaction, empower employees,
                            ensure compliance, drive operational efficiency, increase technical continuity and enhance collaboration,
                            while fostering innovation.
                        </p>
                    </div>
                    <div class="kfmc-logo-circle">
                        <img src="Content1/Card-logo.png" alt="Mission Logo" />
                    </div>
                </div>
            </div>

            <!-- Vision Card -->
            <div class="kfmc-card-group">
                <div class="kfmc-card">
                    <div class="kfmc-card-content">
                        <h3>Vision</h3>
                        <p>
                            To lead the transformation of specialized healthcare services through innovative, sustainable, and person-centric
                            digital solutions that empower stakeholders and enhance accountability.
                        </p>
                    </div>
                    <div class="kfmc-logo-circle">
                        <img src="Content1/Card-logo2.png" alt="Vision Logo" /> 
                    </div>
                </div>
            </div>

            <!-- Who We Are Card -->
            <div class="kfmc-card-group">
                <div class="kfmc-card">
                    <div class="kfmc-card-content">
                        <h3>Who We Are</h3>
                        <p>
                            "Where Perception Becomes Reality and Dream Comes True" <br />
                            KFMC was envisioned by King Fahad and brought to life by King Salman in 1983. Located in the heart of Riyadh,
                            it's one of the largest medical complexes in the Middle East.
                        </p>
                    </div>
                    <div class="kfmc-logo-circle">
                        <img src="Content1/Card-logo3.png" alt="Who We Are Logo" /> 
                    </div>
                </div>
            </div>

        </div>
    </section>
</main>

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

 .btn-transparent {
    font-family: var(--font-nav);
    padding: 0.75rem 1.5rem;
    background: transparent;
    font-size: 1rem;
    font-weight: 600;
    color: var(--white); 
    border-radius: 25px;
    text-decoration: none;
    transition: var(--transition);
    display: inline-block;
    box-shadow: none;
        cursor: pointer;
        box-shadow: var(--shadow);
}

.btn-transparent:hover {
    background: rgba(255, 255, 255, 0.1);
    transform: translateY(-2px);
}

.hero-text h1 {
    font-family: var(--font-heading);
    font-size: 2.5rem;
    font-weight: 500;
    color: var(--white);
    line-height: 1.2;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    /* Remove or adjust the negative margin */
    margin-top: 15%;
}

.accreditation-section {
    background: var(--white);
    padding: 1rem 0;
    border-top: 3px solid #e0e0e0;
    margin-top: 2rem;
    overflow: hidden; /* Hide overflowing content */
}

.accreditation-logos {
    display: flex;
    align-items: center;
    gap: 4rem; /* Increased gap for better spacing */
    animation: scroll-logos 30s linear infinite;
    width: max-content; /* Allow width to expand based on content */
    padding: 1rem 0;
}

.logo-item {
    flex-shrink: 0; /* Prevent logos from shrinking */
    display: flex;
    align-items: center;
    justify-content: center;
    width: 150px; /* Fixed width for consistency */
    height: 120px; /* Fixed height for consistency */
}

.logo-item img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
    transition: filter 0.3s ease;
}

            .logo-item:hover img {
                filter: grayscale(0%);
            }

            @keyframes scroll-logos {
    0% {
        transform: translateX(0%);
    }
    100% {
        transform: translateX(-50%);
    }
}



            @keyframes expandFromCircle {
            0% {
                width: 100px;
                height: 100px;
                border-radius: 40%;
                padding: 0;
                transform: translateX(0);
            }
            100% {
                width: 100%;
                min-height: 110px;
                border-radius: 50px;
                padding: 35px 140px 35px 45px;
                height: auto;
                min-height: 140px;
                border-radius: 50px;
                transform: translateX(0);
            }
        }


        .kfmc-logo-circle img {
            width: 60%;
            height: auto;
            object-fit: contain;
        }

        .logo-placeholder {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #1976d2, #42a5f5);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 18px;
            padding-right: 20px;
        }

            .kfmc-card-group:nth-child(1).animate .kfmc-card {
                animation-delay: 0.05s;
            }

            .kfmc-card-group:nth-child(2).animate .kfmc-card {
                animation-delay: 0.1s;
            }

            .kfmc-card-group:nth-child(3).animate .kfmc-card {
                animation-delay: 0.15s;
            }

            .kfmc-card-group.animate .kfmc-card-content {
                transition: all 0.4s ease 0.5s;
            }

            .search-section {
                background: #3587bd;
                padding: 45px 25px;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: flex-start;
                min-height: 500px;
            }

            .search-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            pointer-events: none;
        }


            .search-container {
            display: flex;
            max-width: 1400px;
            width: 100%;
            align-items: center;
            gap: 50px;
            position: relative;
            z-index: 1;
        }

              .map-image {
            width: 600px;
            height: 400px;
            filter: brightness(1.1) contrast(1.1);
            margin-left: 8px;

        }

             .search-results-container {
            flex: 1;
            background: white;
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
           min-width: 720px;
           margin-left: 5px;
        }

        .search-header {
            text-align: center;
            margin-bottom: 30px;
            direction: rtl;
        }

        .search-header h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #234a78;
            margin-bottom: 8px;
            font-family: 'Cairo', 'Arial', sans-serif;
        }

        .search-header p {
            color: #0b1018;
            font-size: 1.1rem;
            margin: 0;
        }

        .search-controls {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
            background: #3587bd;
            padding: 20px;
            border-radius: 12px;
            width: 100%;
            direction: rtl;
        }

        .search-input-group {
            flex: 1;
            min-width: 0;
        }

        .search-input {
            width: 100%;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            direction: rtl;
            text-align: right;
            box-sizing: border-box;
        }

        .search-input:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(255,255,255,0.3);
        }

        .search-buttons {
            display: flex;
            gap: 10px;
            flex-shrink: 0;
        }

        .btn {
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Cairo', 'Arial', sans-serif;
            padding: 15px 25px;
            min-width: 100px;
            text-align: center;
        }


        .btn-search, .btn-show-all {
            background: white;
            color: black;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .btn-search:hover, .btn-show-all:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

.hospitals-table th, 
.hospitals-table td {
    padding: 15px 20px;
    text-align: right; /* Right align all text */
    border-bottom: 1px solid #e8e8e8;
}

.hospitals-table th {
    background: #3587bd;
    color: white;
    position: sticky;
    top: 0;
    text-align: center; /* Center align headers */
}
.hospital-link {
    color: #3587bd;
    text-decoration: none;
    font-weight: 500;
}

.hospital-link:hover {
    text-decoration: underline;
}


.hospitals-table td:nth-child(2) {
    text-align: center; /* Center align location links */
}

            .btn-clear {
                background: linear-gradient(135deg, #6b7280, #4b5563);
                color: white;
                box-shadow: 0 4px 15px rgba(107, 114, 128, 0.3);
            }

            .btn-clear:hover {
                background: linear-gradient(135deg, #5b6270, #374151);
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(107, 114, 128, 0.4);
            }

            .search-message {
                padding: 15px 20px;
                border-radius: 10px;
                margin-bottom: 20px;
                font-weight: 500;
                text-align: center;
                direction: rtl;
            }

             .search-message.alert-info {
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #1e40af;
            border: 1px solid #93c5fd;
        }

        .search-message.alert-danger {
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            color: #dc2626;
            border: 1px solid #fca5a5;
        }

        .hospitals-table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            overflow: hidden;
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid #e0e0e0;
            direction: rtl;
        }

        .hospitals-table {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
            font-family: 'Cairo', 'Arial', sans-serif;
        }

        .hospitals-table th {
            background: #3587bd;
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
            padding: 18px 15px;
            text-align: center;
            font-weight: 600;
            font-size: 1.1rem;
            border: none;
        }
        .hospitals-table td {
            padding: 15px 20px;
            border-bottom: 1px solid #e8e8e8;
            text-align: center;
        }

        .table-row {
            transition: background-color 0.3s ease;
        }

        .table-row:hover {
            background-color: #f8f9fa;
        }

        .table-row-alt {
            background-color: #fafafa;
        }

        .table-row-alt:hover {
            background-color: #f0f0f0;
        }
        .hospitals-table-container::-webkit-scrollbar {
            width: 8px;
        }

        .hospitals-table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .hospitals-table-container::-webkit-scrollbar-thumb {
            background: #3587bd;
            border-radius: 4px;
        }

        .hospitals-table-container::-webkit-scrollbar-thumb:hover {
            background: #2a6ba0;
        }

        .kfmc-cards-section {
    padding: 20px 10px;
    background-color: #f8fafb;
    font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    justify-content: center;
}

.kfmc-card-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center; /* Center all cards initially */
    gap: 30px;
    width: 100%;
    max-width: 1200px;
    position: relative;
}

.kfmc-card-group {
    position: relative;
    width: 100%;
    max-width: 800px;
    display: flex;
    justify-content: center; /* Center cards initially */
    transition: all 0.8s ease;
}

/* After animation, position each card */
.kfmc-card-group.animate:nth-child(1) { /* Mission - moves left */
    justify-content: flex-start;
    margin-left: 65%;
}

.kfmc-card-group.animate:nth-child(2) { /* Vision - stays center */
    justify-content: center;
}

.kfmc-card-group.animate:nth-child(3) { /* Who We Are - moves right */
    justify-content: flex-end;
    margin-right: 45%;
}


        .kfmc-card-group.animate {
            animation: expandFromCircle 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) forwards;
        }

        .kfmc-card {
            background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
            border-radius: 50px;
            padding: 20px 140px 20px 40px;
            box-shadow: 0 8px 32px rgba(25, 118, 210, 0.12);
            width: 100%;
            max-width: 750px;
            min-height: 110px;
            display: flex;
            align-items: center;
            position: relative;
             transform: translateX(0);
        }

        .kfmc-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(25, 118, 210, 0.18);
        }

        .kfmc-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.3) 0%, rgba(255, 255, 255, 0.1) 100%);
            border-radius: 50px;
            pointer-events: none;
        }

        .kfmc-card-content {
            flex: 1;
            padding-right: 50px;
            z-index: 2;
            position: relative;
            opacity: 0;
            transform: translateX(-30px);
            transition: all 0.6s ease 0.8s;
        }


        .kfmc-card-group.animate .kfmc-card-content {
            opacity: 1;
            transform: translateX(0);
        }

        .kfmc-card h3 {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 12px;
            color: #1565c0;
            letter-spacing: -0.5px;
        }

        .kfmc-card p {
            font-size: 1rem;
            font-weight: 400;
            color: #37474f;
            line-height: 1.6;
            text-align: justify;
            padding-right: 20px;
        }
        .kfmc-logo-circle {
            width: 90px;
            height: 100px;
            border-radius: 50%;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            transition: all 0.3s ease;
        }

        .kfmc-logo-circle:hover {
            transform: translateY(-50%) scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .kfmc-logo-circle img {
            width: 60%;
            height: auto;
            object-fit: contain;
        }

            .results-container {
                background: #ffffff;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
                border: 1px solid #e2e8f0;
            }



.table-header {
    background: #3587bd;
    color: white;
    position: sticky;
    top: 0;
    z-index: 10;
    padding: 20px;
    text-align: center;
    font-weight: 600;
    font-size: 16px;
    border-bottom: 2px solid #2a6ba0;
}


/* Loading Animation */
.loading {
    display: inline-block;
    width: 20px;
    height: 20px;
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    border-top-color: #ffffff;
    animation: spin 1s ease-in-out infinite;
}

@keyframes spin {
    to { transform: rotate(360deg); }
}

/* Custom Scrollbar for Results */
.results-container::-webkit-scrollbar {
    width: 8px;
}

.results-container::-webkit-scrollbar-track {
    background: #f1f5f9;
    border-radius: 4px;
}

.results-container::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #3b82f6, #1d4ed8);
    border-radius: 4px;
}

            .results-container::-webkit-scrollbar-thumb:hover {
                background: linear-gradient(135deg, #2563eb, #1e40af);
            }

</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // KFMC Cards Animation
        const observerOptions = {
            threshold: 0.3,
            rootMargin: '0px 0px -100px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        }, observerOptions);

        // Observe all card groups
        const cardGroups = document.querySelectorAll('.kfmc-card-group');
        cardGroups.forEach(card => {
            observer.observe(card);
        });

        // Add interactive hover effects
        const cards = document.querySelectorAll('.kfmc-card');
        cards.forEach(card => {
            card.addEventListener('mouseenter', function () {
                if (this.parentElement.classList.contains('animate')) {
                    this.style.transform = 'translateY(-5px) scale(1.02)';
                }
            });

            card.addEventListener('mouseleave', function () {
                if (this.parentElement.classList.contains('animate')) {
                    this.style.transform = 'translateY(0) scale(1)';
                }
            });
        });

        // Search functionality (demo)
        const searchBtn = document.querySelector('.btn-search');
        const showAllBtn = document.querySelector('.btn-show-all');
        const searchInput = document.querySelector('.search-input');
        const messageEl = document.querySelector('.search-message');

        searchBtn.addEventListener('click', function () {
            const searchTerm = searchInput.value.trim();
            if (searchTerm) {
                messageEl.textContent = `تم البحث عن: ${searchTerm}`;
                messageEl.style.display = 'block';
            } else {
                messageEl.textContent = 'يرجى إدخال كلمة البحث';
                messageEl.style.display = 'block';
            }
        });

        showAllBtn.addEventListener('click', function () {
            searchInput.value = '';
            messageEl.style.display = 'none';
        });
    });


</script>
        <script>

            function enhanceLinkInteraction() {
                const hospitalLinks = document.querySelectorAll('.hospital-link');

                hospitalLinks.forEach(link => {
                    // Add click tracking
                    link.addEventListener('click', function (e) {
                        // Add loading state
                        this.classList.add('loading');

                        // Optional: Track clicks for analytics
                        console.log('Hospital location clicked:', this.href);

                        // Remove loading state after a delay (since link opens in new tab)
                        setTimeout(() => {
                            this.classList.remove('loading');
                        }, 1000);
                    });

                    // Add keyboard accessibility
                    link.addEventListener('keydown', function (e) {
                        if (e.key === 'Enter' || e.key === ' ') {
                            e.preventDefault();
                            this.click();
                        }
                    });
                });
            }

            // Call the function after GridView updates
            function initializeGridViewEnhancements() {
                enhanceLinkInteraction();

                // Add hover effects to table rows
                const tableRows = document.querySelectorAll('.table-row, .table-row-alt');
                tableRows.forEach(row => {
                    row.addEventListener('mouseenter', function () {
                        this.style.boxShadow = '0 2px 8px rgba(0,0,0,0.1)';
                    });

                    row.addEventListener('mouseleave', function () {
                        this.style.boxShadow = 'none';
                    });
                });
            }

            // Initialize on page load
            initializeGridViewEnhancements();

            // Re-initialize after postback (for ASP.NET)
            if (typeof Sys !== 'undefined') {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                    initializeGridViewEnhancements();
                });
            }

            // KFMC Cards Animation (existing code)
            const observerOptions = {
                threshold: 0.3,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate');
                    }
                });
            }, observerOptions);

            const cardGroups = document.querySelectorAll('.kfmc-card-group');
            cardGroups.forEach(card => {
                observer.observe(card);
            });

            const cards = document.querySelectorAll('.kfmc-card');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function () {
                    if (this.parentElement.classList.contains('animate')) {
                        this.style.transform = 'translateY(-5px) scale(1.02)';
                    }
                });

                card.addEventListener('mouseleave', function () {
                    if (this.parentElement.classList.contains('animate')) {
                        this.style.transform = 'translateY(0) scale(1)';
                    }
                });
            });

            // Search functionality
            const searchBtn = document.querySelector('.btn-search');
            const showAllBtn = document.querySelector('.btn-show-all');
            const searchInput = document.querySelector('.search-input');
            const messageEl = document.querySelector('.search-message');

            if (searchBtn) {
                searchBtn.addEventListener('click', function (e) {
                    const searchTerm = searchInput.value.trim();
                    if (!searchTerm) {
                        e.preventDefault();
                        if (messageEl) {
                            messageEl.textContent = 'يرجى إدخال كلمة البحث';
                            messageEl.className = 'search-message alert-info';
                            messageEl.style.display = 'block';
                        }
                    }
                });
            }

            if (showAllBtn) {
                showAllBtn.addEventListener('click', function () {
                    if (searchInput) searchInput.value = '';
                    if (messageEl) messageEl.style.display = 'none';
                });
            }

            // Enter key support for search
            if (searchInput) {
                searchInput.addEventListener('keypress', function (e) {
                    if (e.key === 'Enter') {
                        searchBtn.click();
                    }
                });
            }
});
        </script>

        <script>
            function setupEnterKeySearch() {
                var txtSearch = document.getElementById('<%= txtSearch.ClientID %>');
        var btnSearch = document.getElementById('<%= btnSearch.ClientID %>');

                if (txtSearch && btnSearch) {
                    txtSearch.addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            btnSearch.click();
                        }
                    });
                }
            }

            // Setup when page is ready
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', setupEnterKeySearch);
            } else {
                setupEnterKeySearch(); // DOM already loaded
            }

            // Re-setup after AJAX postbacks (if using UpdatePanel)
            if (typeof Sys !== 'undefined') {
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                    setupEnterKeySearch();
                });
            }
        </script>
</form>
</body>
</html>
