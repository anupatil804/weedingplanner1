<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="VenueExplorerReport.aspx.cs"
    Inherits="VenueExplorerReport" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Venue Explorer Report</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI';
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card img {
            height: 200px;
            object-fit: cover;
            border-radius: 15px 15px 0 0;
        }

        .count-box {
            font-size: 20px;
            font-weight: bold;
            color: #d81b60;
            margin-bottom: 15px;
        }
    </style>

</head>

<body>
<form id="form1" runat="server">

<div class="container mt-4">

    <h2 class="text-center mb-4">Venue Explorer Report</h2>

    <!-- FILTERS -->
    <div class="row mb-3">

        <div class="col-md-4">
            <asp:DropDownList ID="ddlDistrict"
                runat="server"
                CssClass="form-select">
                <asp:ListItem Value="">All District</asp:ListItem>
                <asp:ListItem>Sangli</asp:ListItem>
                <asp:ListItem>Satara</asp:ListItem>
                <asp:ListItem>Kolhapur</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-4">
            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="form-control"
                placeholder="Search Venue Name"></asp:TextBox>
        </div>

        <div class="col-md-4">
            <asp:Button ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="btn btn-primary w-100"
                OnClick="btnSearch_Click" />
        </div>

    </div>

    <!-- TOTAL COUNT -->
    <div class="count-box text-center">
        Total Venues :
        <asp:Label ID="lblCount" runat="server" Text="0"></asp:Label>
    </div>

    <!-- VENUE LIST -->
    <div class="row">
        <asp:Repeater ID="rptVenue" runat="server">
            <ItemTemplate>

                <div class="col-md-4 mb-4">

                    <div class="card">

                        <img src='<%# "Image/" + Eval("VenueImage") %>' />

                        <div class="card-body">

                            <h5 class="text-center">
                                <%# Eval("VenueName") %>
                            </h5>

                            <p><b>District:</b> <%# Eval("District") %></p>
                            <p><b>Address:</b> <%# Eval("Address") %></p>
                            <p><b>Contact:</b> <%# Eval("ContactNo") %></p>
                            <p><b>Charges:</b> ₹ <%# Eval("charges") %></p>

                        </div>

                    </div>

                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

</div>

</form>
</body>
</html>