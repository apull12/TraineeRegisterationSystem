<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Centers.cs" Inherits="HealthRegisterationSystem1.Centers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>Our Health Centers Directory</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" /> 
    <link href="Content1/Centers.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

        .search-panel {
            background-color: #e9f7fe;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .table th {
            background-color: #166fab;
            color: white;
        }

        .table-responsive {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            padding: 20px;
        }

        .header {
            box-shadow: var(--shadow);
            position: relative;
            z-index: 1000;
            margin: 0;
            padding: 0;
        }

        .header-h1 {
            color: #357DAD;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 0rem 0rem;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .logo-header {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .site-logo {
            height: 90px;
            width: auto;
            display: block;
        }

        .text-custom-primary {
            color: #166fab;
        }

        .btn-custom-primary {
            color: #fff;
            background: #166fab;
        }

        /* NEW: Hyperlink styling for location links */
        .location-link {
            color: #3587bd !important;
            text-decoration: none;
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .location-link:hover {
            background-color: #3587bd;
            color: white !important;
            text-decoration: none;
            transform: translateY(-1px);
        }

        .invalid-link {
            color: #dc3545 !important;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .invalid-link:hover {
            background-color: transparent !important;
            color: #dc3545 !important;
            transform: none;
        }

        /* Enhanced table styling */
        .table td {
            vertical-align: middle;
            padding: 12px 15px;
        }

        .table tbody tr:hover {
            background-color: #f8faff !important;
        }

        /* Responsive improvements */
        @media (max-width: 768px) {
            .table-responsive {
                font-size: 14px;
            }
            
            .location-link {
                padding: 3px 6px;
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="header-content">
                <div class="logo-header">
                    <img src="Content1/rc2vlogo.png" alt="Logo" class="site-logo" />
                </div>
            </div>
        </header>
        
        <div class="container py-5">
            <h1 class="text-center text-custom-primary">
                دليل المراكز الصحية للتجمع الصحي الثاني في الرياض
            </h1>

            <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="d-block text-center mb-4" />
            
            <div class="search-panel">
                <div class="row">
                    <div class="col-md-8">
                        <asp:TextBox ID="txtSearch" runat="server" 
                            CssClass="form-control" 
                            placeholder="ابحث باسم المركز أو المنطقة أو المحافظة..." />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="بحث" 
                            CssClass="btn btn-custom-primary w-100" 
                            OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnClearSearch" runat="server" Text="عرض الكل" 
                            CssClass="btn btn-secondary w-100" 
                            OnClick="btnClearSearch_Click" />
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="GridViewCenters" runat="server" 
                    CssClass="table table-bordered table-hover" 
                    AutoGenerateColumns="false"
                    OnRowDataBound="GridViewCenters_RowDataBound"
                    EmptyDataText="لا توجد بيانات لعرضها"
                    GridLines="None"
                    ShowHeader="true">
                    <HeaderStyle CssClass="table-header" />
                    <RowStyle CssClass="table-row" />
                    <AlternatingRowStyle CssClass="table-row-alt" />
                </asp:GridView>
            </div>
     
            <div class="buttons">
                <button type="button" onclick="window.location.href='WebForm1.aspx'">Go Back</button>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>