<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="FinalConfirmationReport.aspx.cs"
    Inherits="FinalConfirmationReport"
    MasterPageFile="~/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .box {
            width: 95%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        h2 {
            text-align: center;
        }

        .grid {
            margin-top: 20px;
        }
    </style>

    <div class="box">

        <h2>Final Booking Report</h2>

        From:
        <asp:TextBox ID="txtFrom" runat="server" TextMode="Date"></asp:TextBox>

        To:
        <asp:TextBox ID="txtTo" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Button ID="btnSearch"
            runat="server"
            Text="Search"
            OnClick="btnSearch_Click" />

        <br /><br />

        <asp:GridView ID="gvFinal"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="grid"
            DataKeyNames="final_id">

            <Columns>

                <asp:BoundField DataField="final_id" HeaderText="ID" />
                <asp:BoundField DataField="total_amount" HeaderText="Total" />
                <asp:BoundField DataField="paid_amount" HeaderText="Paid" />
                <asp:BoundField DataField="payment_method" HeaderText="Method" />
                <asp:BoundField DataField="payment_status" HeaderText="Status" />
                <asp:BoundField DataField="confirm_date" HeaderText="Date" />

            </Columns>

        </asp:GridView>

    </div>

</asp:Content>