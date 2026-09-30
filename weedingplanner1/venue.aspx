<%@ Page Language="C#" AutoEventWireup="true" CodeFile="venue.aspx.cs" Inherits="venue" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Select Venue</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<style>
        body {
            background: #fdf2f7;
            font-family: 'Segoe UI', sans-serif;
        }

        /* ===== UPDATED NAVBAR ===== */
        .navbar {
            background: #000 !important; /* Black background */
            height: 55px;                /* Reduced height */
            padding: 5px 15px;
        }

        .navbar-brand img {
            height: 40px; /* Smaller logo */
        }

        .nav-link {
            color: white !important;
            font-size: 15px;
            margin-left: 15px;
        }

        .nav-link:hover {
            color: #ffcc00 !important; /* Gold hover */
        }

        /* Cards */
        .service-card {
            border-radius: 18px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            transition: 0.4s ease-in-out;
            cursor: pointer;
        }

        .service-card:hover {
            transform: translateY(-12px) scale(1.03);
            box-shadow: 0 15px 30px rgba(255, 100, 160, 0.5);
        }

        .service-card img {
            height: 200px;
            width: 100%;
            object-fit: cover;
        }

        .service-title {
            color: #d81b60;
            font-weight: bold;
            font-size: 22px;
        }
    </style>
</head>


<form id="form1" runat="server">
<!-- LEFT ALIGNED NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="Home.aspx">
            <img src="image/logo.png" alt="Logo" />
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-3">

                <li class="nav-item">
                    <a class="nav-link" href="Home.aspx">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="AboutUs.aspx">About</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="Services.aspx">Services</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="showweedingTypes.aspx">WeedingType</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="venue.aspx">Venues</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ceremony.aspx">Ceremonye's</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="wishlist.aspx">View selected</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Feedback.aspx">Feedback</a>
                </li>

            </ul>
        </div>
    </nav>
<div class="container mt-5">
    <h1 class="text-center mb-4">Choose Venue</h1>

    <div class="row mb-4">
        <div class="col-md-4 mx-auto">
            <asp:DropDownList ID="ddlDistrict" runat="server"
                CssClass="form-select"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                <asp:ListItem Value="">-- Select District --</asp:ListItem>
                <asp:ListItem>Sangli</asp:ListItem>
                <asp:ListItem>Satara</asp:ListItem>
                <asp:ListItem>Kolhapur</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="row">
        <asp:Repeater ID="rptVenues" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card shadow h-100">
                        <img src='<%# "Image/" + Eval("VenueImage") %>' class="card-img-top" style="height:200px; object-fit:cover;" />
                        <div class="card-body">
                            <h5 class="card-title text-center"><%# Eval("VenueName") %></h5>
                            <p><strong>Address:</strong> <%# Eval("Address") %></p>
                            <p><strong>Contact:</strong> <%# Eval("ContactNo") %></p>

                            <asp:TextBox ID="txtBookingDate" runat="server"
                                CssClass="form-control mb-2"
                                TextMode="Date" />

                            <asp:Button ID="btnCheckAvailability" runat="server"
                                Text="Check Availability"
                                CssClass="btn btn-primary w-100 mb-2"
                                CommandArgument='<%# Eval("VenueID") %>'
                                OnCommand="btnCheckAvailability_Command" />

                            <asp:Button ID="btnSelectVenue" runat="server"
                                Text="Select Venue"
                                CssClass="btn btn-success btn-sm w-50 mx-auto d-block"
                                CommandArgument='<%# Eval("VenueID") %>'
                                OnCommand="btnSelectVenue_Command" />
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
