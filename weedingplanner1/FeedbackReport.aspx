<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="FeedbackReport.aspx.cs"
    Inherits="FeedbackReport"
    MasterPageFile="~/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .box {
            width: 95%;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            color: #c2185b;
        }

        .btnSearch {
            background: #e91e63;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
        }

        .btnSearch:hover {
            background: #ad1457;
        }

        .msg {
            color: red;
            font-weight: bold;
        }
    </style>

    <div class="box">

        <h2>Feedback Report</h2>

        From Date :
        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date"></asp:TextBox>

        To Date :
        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Button ID="btnSearch"
            runat="server"
            Text="Search"
            CssClass="btnSearch"
            OnClick="btnSearch_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        <asp:GridView ID="GridView1"
            runat="server"
            AutoGenerateColumns="true"
            Width="100%"
            Visible="false">
        </asp:GridView>

    </div>

</asp:Content>