<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="VenueMasterReport.aspx.cs"
    Inherits="VenueMasterReport" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Venue Master Report</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

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

        img {
            width: 100px;
            height: 70px;
            object-fit: cover;
            border-radius: 6px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="box">

    <h2>Venue Master Report</h2>

    District:
    <asp:DropDownList ID="ddlDistrict" runat="server">
        <asp:ListItem Value="">All</asp:ListItem>
        <asp:ListItem>Sangli</asp:ListItem>
        <asp:ListItem>Satara</asp:ListItem>
        <asp:ListItem>Kolhapur</asp:ListItem>
    </asp:DropDownList>

    <asp:Button ID="btnSearch"
        runat="server"
        Text="Search"
        OnClick="btnSearch_Click" />

    <br /><br />

    Total Venues:
    <asp:Label ID="lblTotal" runat="server"
        Font-Bold="true"
        ForeColor="Green"></asp:Label>

    <br /><br />

    <asp:GridView ID="gvVenue"
        runat="server"
        AutoGenerateColumns="False"
        Width="100%">

        <Columns>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src='<%# "Image/" + Eval("VenueImage") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="VenueName" HeaderText="Venue Name" />
            <asp:BoundField DataField="District" HeaderText="District" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="ContactNo" HeaderText="Contact" />
            <asp:BoundField DataField="charges" HeaderText="Charges" />

        </Columns>

    </asp:GridView>

</div>

</form>
</body>
</html>