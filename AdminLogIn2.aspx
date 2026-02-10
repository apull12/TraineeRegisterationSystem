<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogIn2.aspx.cs" Inherits="HealthRegisterationSystem1.AdminLogIn2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Open+Sans&family=Playfair+Display:wght@700&family=Roboto&display=swap" rel="stylesheet" />
    <title>Admin Dashboard - Student Training Requests</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
    * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .buttons {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-bottom: 5%;
        }

        .buttons button {
            background-color: #3399ff;
            color: white;
            border: none;
            padding: 12px 40px;
            width: 220px;
            font-size: 16px;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .buttons button:hover {
            background-color: #267acc;
            transform: scale(1.02);
        }

        .logo-header {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px 0;
            background: white;
        }

        .site-logo {
            height: 70px;
            width: auto;
        }

        .navbar {
            background: #1c5c86;
            box-shadow: none;
            position: relative;
            z-index: 999;
            margin: 0;
            padding: 0;
            border: none;
            height: 63px;
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
            color: white;
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
            margin-left: auto;
            padding: 0 1rem;
            color: white;
            font-family: var(--font-nav);
            font-size: 0.95rem;
            white-space: nowrap;
        }

        .nav-phone img {
            height: 16px;
            width: auto;
            filter: brightness(0) invert(1);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: #287db6;
            color: white;
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.7rem;
            margin-bottom: 10px;
            font-weight: 300;
        }

        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .search-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .search-controls {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            min-width: 250px;
        }

        .search-btn, .clear-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-btn {
            background: #287db6;
            color: white;
        }

        .search-btn:hover {
            background: #1e6694;
        }

        .clear-btn {
            background: #6c757d;
            color: white;
        }

        .clear-btn:hover {
            background: #545b62;
        }

        .alert {
            padding: 12px 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: 500;
        }

        .alert-success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .alert-info {
            background-color: #d1ecf1;
            border: 1px solid #bee5eb;
            color: #0c5460;
        }

        .alert-danger {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }

        .requests-section {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 7%;
        }

        .section-header {
            background: #287db6;
            color: white;
            padding: 20px 30px;
            border-bottom: 3px solid #3498db;
        }

        .section-header h2 {
            font-size: 1.5rem;
            font-weight: 400;
        }

        .table-container {
            overflow-x: auto;
        }

        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9rem;
        }

        .gridview-style th {
            background: #ecf0f1;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            color: #2c3e50;
            border-bottom: 2px solid #bdc3c7;
        }

        .gridview-style td {
            padding: 12px;
            border-bottom: 1px solid #ecf0f1;
            vertical-align: middle;
        }

        .gridview-style tr:hover {
            background: #f8f9fa;
        }

        .student-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .specialization {
            background: #3498db;
            color: white;
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }

        .status-badge {
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }

        .status-pending {
            background: #f39c12;
            color: white;
        }

        .status-approved {
            background: #27ae60;
            color: white;
        }

        .status-rejected {
            background: #e74c3c;
            color: white;
        }

        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-accept {
            background: #27ae60;
            color: white;
        }

        .btn-accept:hover {
            background: #219a52;
        }

        .btn-reject {
            background: #e74c3c;
            color: white;
        }

        .btn-reject:hover {
            background: #c0392b;
        }

        .btn-view {
            background: #3498db;
            color: white;
        }

        .btn-view:hover {
            background: #2980b9;
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background: white;
            margin: 2% auto;
            padding: 0;
            border-radius: 8px;
            width: 95%;
            max-width: 1000px;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            background: #2c3e50;
            color: white;
            padding: 20px 30px;
            border-bottom: 3px solid #3498db;
            position: relative;
        }

        .modal-header h3 {
            font-size: 1.5rem;
            font-weight: 400;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 25px;
            color: white;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover {
            color: #3498db;
        }

        .modal-body {
            padding: 30px;
        }

        .student-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .detail-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }

        .detail-section h4 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 1.1rem;
            font-weight: 600;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ecf0f1;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            font-weight: 600;
            color: #2c3e50;
            width: 40%;
        }

        .detail-value {
            color: #555;
            width: 55%;
            text-align: right;
        }

        .footer {
            background:#1c5c86;
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
            flex-direction: row-reverse;
        }

        .footer-logo {
            flex: 1;
            min-width: 250px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            text-align: right;
        }

        .footer-logo img {
            height: 160px;
            width: auto;
        }

        .footer-contact {
            flex: 1;
            min-width: 280px;
            text-align: left;
            direction: ltr;
        }

        .footer-contact h4 {
            font-family: var(--font-subheading);
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: white;
        }

        .footer-contact p {
            font-family: var(--font-body);
            font-size: 1.1rem;
            color: white;
            margin-bottom: 0.6rem;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 0.5rem;
            direction: ltr
        }

        .footer-contact i {
            color: white;
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

        
        </style>
</head>
<body>
<form id="form1" runat="server">
<div class="logo-header">
   <img src="Content/88ee05e9-2f92-468f-bf25-c9290ea42248.jpg" alt="Logo" class="site-logo" />
</div>
    
<nav class="navbar">
    <div class="nav-content">
        <div class="nav-links">
            <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/WebForm1.aspx" CssClass="nav-link">Home</asp:HyperLink>
            <asp:HyperLink ID="CentersLink" runat="server" NavigateUrl="~/Centers.aspx" CssClass="nav-link">Centers</asp:HyperLink>
            <asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/AdminLogIn.aspx" CssClass="nav-link">Admin</asp:HyperLink>
            <asp:HyperLink ID="ClearanceLink" runat="server" NavigateUrl="~/ClearancePage.aspx" CssClass="nav-link">Clearance </asp:HyperLink>
            <asp:HyperLink ID="ApplicationStatusRegLink" runat="server" NavigateUrl="~/ApplicationStatusReg.aspx" CssClass="nav-link">Application Status</asp:HyperLink>
        </div>
        <div class="nav-phone">
            <img src="Content1/Phone_Icon (3).png" alt="Phone Icon" />
            <span>8001277000</span>
        </div>
    </div>
</nav>

<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>Student Training Requests</h1>
        <p>Manage and review student training applications</p>
    </div>
    

    <!-- Message Label -->
    <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert"></asp:Label>

    <!-- Students Table -->
    <div class="requests-section">
        <div class="section-header">
            <h2>Training Requests</h2>
        </div>
        <div class="table-container">
            <asp:GridView ID="GridViewStudents" runat="server" 
                CssClass="gridview-style" 
                AutoGenerateColumns="false"
                OnRowCommand="GridViewStudents_RowCommand"
                OnRowDataBound="GridViewStudents_RowDataBound">

<Columns>
    <asp:BoundField DataField="referenceNumber" HeaderText="Request ID" />
    <asp:TemplateField HeaderText="Student Name">
        <ItemTemplate>
            <div class="student-name"><%# Eval("studentNameInEng") %></div>
            <small><%# Eval("studentNameInArabic") %></small>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="universityName" HeaderText="University" />
    <asp:TemplateField HeaderText="Major">
        <ItemTemplate>
            <span class="specialization"><%# Eval("degreeMajor") %></span>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="trainingStartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
    <asp:BoundField DataField="trainingEndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
    <asp:TemplateField HeaderText="Status">
        <ItemTemplate>
            <asp:Label ID="StatusLabel" runat="server" 
                Text='<%# Eval("status") ?? "Pending" %>' 
                CssClass="status-badge status-pending">
            </asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Actions">
        <ItemTemplate>
            <div class="actions">
                <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-accept" 
                    CommandName="Accept" CommandArgument='<%# Eval("id") %>' />
                <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-reject" 
                    CommandName="Reject" CommandArgument='<%# Eval("id") %>' />
                <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-view" 
                    CommandName="ViewDetails" CommandArgument='<%# Eval("id") %>' />
            </div>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
            </asp:GridView>
        </div>
    </div>
</div>

<!-- Student Details Modal -->
<div id="studentModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>Student Details</h3>
        </div>
        <div class="modal-body">
            <div class="student-details">
                <!-- Personal Information -->
                <div class="detail-section">
                    <h4>Personal Information</h4>
                    <div class="detail-row">
                        <span class="detail-label">Name (English):</span>
                        <span class="detail-value" id="nameEn">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Name (Arabic):</span>
                        <span class="detail-value" id="nameAr">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">ID:</span>
                        <span class="detail-value" id="studentId">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Age:</span>
                        <span class="detail-value" id="age">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Gender:</span>
                        <span class="detail-value" id="gender">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Country:</span>
                        <span class="detail-value" id="country">-</span>
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="detail-section">
                    <h4>Contact Information</h4>
                    <div class="detail-row">
                        <span class="detail-label">Email:</span>
                        <span class="detail-value" id="email">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Mobile:</span>
                        <span class="detail-value" id="mobile">-</span>
                    </div>
                </div>

                <!-- Academic Information -->
                <div class="detail-section">
                    <h4>Academic Information</h4>
                    <div class="detail-row">
                        <span class="detail-label">University:</span>
                        <span class="detail-value" id="university">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Student ID:</span>
                        <span class="detail-value" id="univStudentId">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Major:</span>
                        <span class="detail-value" id="major">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Degree:</span>
                        <span class="detail-value" id="degree">-</span>
                    </div>
                </div>

                <!-- Training Information -->
                <div class="detail-section">
                    <h4>Training Information</h4>
                    <div class="detail-row">
                        <span class="detail-label">Start Date:</span>
                        <span class="detail-value" id="startDate">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">End Date:</span>
                        <span class="detail-value" id="endDate">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Supervisor Name:</span>
                        <span class="detail-value" id="supervisorName">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Supervisor Email:</span>
                        <span class="detail-value" id="supervisorEmail">-</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="buttons">
    <button type="button" onclick="window.location.href='AdminLogIn2.aspx'">Refresh Page</button>
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
</form>

<script>
    // Modal functions
    function openModal() {
        document.getElementById('studentModal').style.display = 'block';
        document.body.style.overflow = 'hidden';
    }

    function closeModal() {
        document.getElementById('studentModal').style.display = 'none';
        document.body.style.overflow = 'auto';
    }

    // Close modal when clicking outside
    window.onclick = function (event) {
        const modal = document.getElementById('studentModal');
        if (event.target === modal) {
            closeModal();
        }
    }

    // Function to populate and show modal with student details
    function showStudentDetails(studentData) {
        document.getElementById('nameEn').textContent = studentData.nameEn || '-';
        document.getElementById('nameAr').textContent = studentData.nameAr || '-';
        document.getElementById('studentId').textContent = studentData.studentId || '-';
        document.getElementById('age').textContent = studentData.age || '-';
        document.getElementById('gender').textContent = studentData.gender || '-';
        document.getElementById('country').textContent = studentData.country || '-';
        document.getElementById('email').textContent = studentData.email || '-';
        document.getElementById('mobile').textContent = studentData.mobile || '-';
        document.getElementById('university').textContent = studentData.university || '-';
        document.getElementById('univStudentId').textContent = studentData.univStudentId || '-';
        document.getElementById('major').textContent = studentData.major || '-';
        document.getElementById('degree').textContent = studentData.degree || '-';
        document.getElementById('startDate').textContent = studentData.startDate || '-';
        document.getElementById('endDate').textContent = studentData.endDate || '-';
        document.getElementById('supervisorName').textContent = studentData.supervisorName || '-';
        document.getElementById('supervisorEmail').textContent = studentData.supervisorEmail || '-';

        openModal();
    }
</script>
</body>
</html>