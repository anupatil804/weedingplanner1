<%@ Page Title="Artist Report"
    Language="C#"
    MasterPageFile="~/admin.master"
    AutoEventWireup="true"
    CodeFile="ArtistReport.aspx.cs"
    Inherits="ArtistReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .report-box {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        }

        .title {
            color: #c2185b;
            font-weight: bold;
            margin-bottom: 20px;
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

        .grid {
            margin-top: 20px;
        }
    </style>

    <div class="report-box">

        <h2 class="title">Artist Registration Report</h2>

        <table>
            <tr>
                <td>From Date :</td>
                <td>
                    <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date"></asp:TextBox>
                </td>

                <td style="padding-left:20px;">To Date :</td>
                <td>
                    <asp:TextBox ID="txtToDate" runat="server" TextMode="Date"></asp:TextBox>
                </td>

                <td style="padding-left:20px;">
                    <asp:Button ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="btnSearch"
                        OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

        <div class="grid">
            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="true"
                Width="100%"
                CssClass="table table-bordered">
            </asp:GridView>
        </div>

    </div>

</asp:Content>