<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="LoginReport.aspx.cs"
    Inherits="LoginReport"
    MasterPageFile="~/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .container {
            width: 90%;
            margin: auto;
            margin-top: 40px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-control {
            padding: 8px;
            width: 200px;
            margin-right: 10px;
        }

        .btn {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .grid {
            margin-top: 20px;
        }

        .message {
            color: red;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>

    <div class="container">

        <h2>Login Report</h2>

        From Date :
        <asp:TextBox ID="txtFromDate" runat="server"
            CssClass="form-control"
            TextMode="Date"></asp:TextBox>

        To Date :
        <asp:TextBox ID="txtToDate" runat="server"
            CssClass="form-control"
            TextMode="Date"></asp:TextBox>

        <asp:Button ID="btnSearch"
            runat="server"
            Text="Search"
            CssClass="btn"
            OnClick="btnSearch_Click" />

        <br />

        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message"></asp:Label>

        <div class="grid">
            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="true"
                Width="100%"
                Visible="false"
                BorderWidth="1"
                CellPadding="5">
            </asp:GridView>
        </div>

    </div>

</asp:Content>