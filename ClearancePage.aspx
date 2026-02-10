<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClearancePage.aspx.cs" Inherits="HealthRegisterationSystem1.ClearancePage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clearance Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #333;
            margin: 0;
            padding: 20px;
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
            padding-bottom: 5%;
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


        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            border: 1px solid #ddd;
            max-width: 1100px;
            margin: 0 auto;
        }

        .form-row {
            display: flex;
            gap: 30px;
            margin-bottom: 20px;
        }

        .form-column {
            flex: 1;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: #4a90a4;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
            margin-bottom: 0;
        }

        .radio-group input[type="radio"] {
            margin-right: 8px;
            width: auto;
        }

        .mobile-input {
            display: flex;
            align-items: center;
        }

        .mobile-prefix {
            padding: 8px 12px;
            background-color: #f8f9fa;
            border: 1px solid #ccc;
            border-right: none;
            border-radius: 4px 0 0 4px;
            font-size: 14px;
        }

        .mobile-input input {
            border-radius: 0 4px 4px 0;
            border-left: none;
        }

        .file-upload {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .upload-button {
            padding: 8px 16px;
            background-color: #f8f9fa;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 5px;
            border: none;
            margin-right: 10px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-submit {
            background-color: #4a90a4;
            color: white;
        }

        .btn-cancel {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .section-title {
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }
        
        /* New styles for better alignment */
        .form-title {
            text-align: center;
            font-size: 35px;
            font-weight: bold;
            margin-bottom: 30px;
            color:#357DAD;
        }
        
        .form-section {
            margin-bottom: 25px;
        }
        
        .form-field {
            margin-bottom: 15px;
        }

        .administration-plain-list {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 0;
    margin-top: 8px;
    margin-bottom: 2%;
}

.administration-item {
    display: block;
    padding: 10px 15px;
    border-bottom: 1px solid #eee;
    margin: 0;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.administration-item:hover {
    background-color: #f9f9f9;
}

.administration-item:last-child {
    border-bottom: none;
}

.administration-item input[type="checkbox"] {
    margin-right: 12px;
    vertical-align: middle;
    cursor: pointer;
}

/* Remove default checkbox styling and create custom look */
.administration-item input[type="checkbox"] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    width: 16px;
    height: 16px;
    border: 1px solid #aaa;
    border-radius: 3px;
    outline: none;
    transition: all 0.2s;
    position: relative;
    cursor: pointer;
}

.administration-item input[type="checkbox"]:checked {
    background-color: #4a90a4;
    border-color: #4a90a4;
}

.administration-item input[type="checkbox"]:checked::after {
    content: "✓";
    position: absolute;
    color: white;
    font-size: 12px;
    left: 3px;
    top: 0;
}
    </style>
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
        <div class="form-container">
            <div class="form-title">King Fahad Medical City - Clearance Form</div>
            
            <div class="form-row">
                <div class="form-column">
                    <div class="form-field">
                        <asp:Label runat="server" Text="Date:" />
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-section">
    <asp:Label runat="server" Text="Administration Name:" CssClass="section-title" />
    <div class="administration-plain-list">
        <label class="administration-item">
          <input type="checkbox" name="administration" style="margin-right: 10px;">
            Management Training Administration
        </label>
        <label class="administration-item">
         <input type="checkbox" name="administration" style="margin-right: 10px;">
            Medical Training Administration
        </label>
        <label class="administration-item">
         <input type="checkbox" name="administration" style="margin-right: 10px;">
            Health Training Administration
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Nursing Education Administration
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Volunteer Administration
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Contracting/Outsourcing
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Family Medicine Academy
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Health Care Security
        </label>
        <label class="administration-item">
            <input type="checkbox" name="administration" style="margin-right: 10px;">
            Radiology AAML
        </label>
    </div>
</div>
                    
                    <div class="form-section">
                        <asp:Label runat="server" Text="Do you have housing?" CssClass="section-title" />
                        <div class="radio-group">
                            <asp:RadioButton ID="rbHousingYes" runat="server" GroupName="HousingGroup" Text="Yes" />
                            <asp:RadioButton ID="rbHousingNo" runat="server" GroupName="HousingGroup" Text="No" />
                        </div>
                    </div>
                    
                    <div class="form-section">
                        <asp:Label runat="server" Text="Nationality:" CssClass="section-title" />
                        <div class="radio-group">
                            <asp:RadioButton ID="rbSaudi" runat="server" GroupName="NationalityGroup" Text="Saudi" />
                            <asp:RadioButton ID="rbNonSaudi" runat="server" GroupName="NationalityGroup" Text="Non-Saudi" />
                        </div>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="Mobile No.:" />
                        <div class="mobile-input">
                            <span class="mobile-prefix">+966</span>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="form-column">
                    <div class="form-field">
                        <asp:Label runat="server" Text="Executive Administration:" />
                        <asp:TextBox ID="txtExecutive" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="Department:" />
                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="User Name Account:" />
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="Employee No.:" />
                        <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="ID Number / Iqama:" />
                        <asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="English Name:" />
                        <asp:TextBox ID="txtEnglishName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="Arabic Name:" />
                        <asp:TextBox ID="txtArabicName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="KFMC E-mail:" />
                        <asp:TextBox ID="txtKFMCEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <div class="form-field">
                        <asp:Label runat="server" Text="Job Title:" />
                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="form-section">
                <asp:Label runat="server" Text="ID Badge Upload:" CssClass="section-title" />
                <div class="file-upload">
                    <asp:FileUpload ID="fileUploadID" runat="server" CssClass="form-control" />
                    <span class="upload-button">📁</span>
                </div>
            </div>
            
            <div class="form-field">
                <asp:Label runat="server" Text="ID Badge Expiry Date:" />
                <asp:TextBox ID="txtIDExpiry" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            
            <div style="text-align: center; margin-top: 30px;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-cancel" OnClick="btnCancel_Click" />
            </div>
        </div>
    </form>
</body>
</html>