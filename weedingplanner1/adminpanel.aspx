<%@ Page Title="Admin Dashboard" Language="C#"
    MasterPageFile="~/admin.master"
    AutoEventWireup="true"
    CodeFile="adminpanel.aspx.cs"
    Inherits="adminpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="margin-bottom:20px; color:#cc0066;">Dashboard Overview</h2>

    <div class="card-container">

        <div class="dashboard-card">
            <h3>Total Vendors</h3>
            <asp:Label ID="lblVendors" runat="server" Text="0"></asp:Label>
        </div>

        <div class="dashboard-card">
            <h3>Total Bookings</h3>
            <asp:Label ID="lblBookings" runat="server" Text="0"></asp:Label>
        </div>

        <div class="dashboard-card">
            <h3>Packages</h3>
            <asp:Label ID="lblPackages" runat="server" Text="0"></asp:Label>
        </div>

    </div>

    <style>
        .card-container {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .dashboard-card {
            background: white;
            padding: 25px;
            width: 230px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(255, 105, 180, 0.2);
            transition: 0.3s;
            text-align: center;
            border-top: 5px solid #ff4d88;
        }

        .dashboard-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 25px rgba(255, 105, 180, 0.4);
        }

        .dashboard-card h3 {
            margin-bottom: 10px;
            color: #cc0066;
            font-weight: 600;
        }

        .dashboard-card span {
            font-size: 30px;
            font-weight: bold;
            color: #ff3385;
        }
    </style>

</asp:Content>