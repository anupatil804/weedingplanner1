<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="VenueReport.aspx.cs"
    Inherits="VenueReport"
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

        img {
            width: 120px;
            height: 90px;
            object-fit: cover;
            border-radius: 6px;
        }
    </style>

    <div class="box">

        <h2>Venue Report</h2>

        Select District:
        <asp:DropDownList ID="ddlDistrict"
            runat="server"
            AutoPostBack="true"
            OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">

            <asp:ListItem Value="">All</asp:ListItem>
            <asp:ListItem>Sangli</asp:ListItem>
            <asp:ListItem>Satara</asp:ListItem>
            <asp:ListItem>Kolhapur</asp:ListItem>

        </asp:DropDownList>

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

</asp:Content>