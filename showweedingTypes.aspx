<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showweedingTypes.aspx.cs" Inherits="showweedingtypes" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Weeding Types</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>

        /* Soft Pink Background */
        body {
            background: #fff3f6;
            min-height: 100vh;
            font-family: "Segoe UI", sans-serif;
        }
       /* ===== UPDATED NAVBAR ===== */
        .navbar {
            background: #000 !important; /* Black background */
            height: 60px;                /* Reduced height */
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
        .container {
            background: white;
            padding: 35px 30px;
            border-radius: 22px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
            border: 1px solid #ffd6de;
        }

        h2 {
            color: #d81b60;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .card:hover {
            transform: scale(1.02);
            transition: 0.3s;
        }

        .card {
            border-radius: 18px;
            overflow: hidden;
            max-width: 280px;
            background-color: white;
            border: 1px solid #f3b7c6;
            box-shadow: 0 6px 18px rgba(216,27,96,0.15);
        }

        .card-img-top {
            height: 230px;
            object-fit: cover;
        }

        .card-title {
            color: #d81b60;
            font-weight: 600;
        }

        .btn-select {
            width: 100%;
            background: linear-gradient(135deg, #d81b60, #ec407a);
            border: none;
            color: white;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-select:hover {
            background: linear-gradient(135deg, #c2185b, #e91e63);
            box-shadow: 0 5px 14px rgba(216,27,96,0.4);
            color: white;
            transform: scale(1.02);
        }

        .row.custom-gap {
            margin-left: 0;
            margin-right: 0;
        }

        .row.custom-gap > .col-md-6 {
            padding-left: 18px;
            padding-right: 18px;
            margin-bottom: 22px;
        }

    </style>
</head>

<body>

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

        <h2 class="mb-4 text-center">Choose Your Weeding Type</h2>

        <div class="row justify-content-center custom-gap">

            <asp:Repeater ID="rptTypes" runat="server">

                <ItemTemplate>

                    <div class="col-md-6 d-flex justify-content-center">

                        <div class="card shadow-sm h-100">

                            <img src='<%# "Image/" + Eval("ImageName") %>' 
                                 class="card-img-top" />

                            <div class="card-body text-center">

                                <h5 class="card-title">
                                    <%# Eval("TypeName") %>
                                </h5>

                                <asp:Button 
                                    ID="btnSelect"
                                    runat="server"
                                    Text="Select This Type"
                                    CssClass="btn btn-select mt-2"
                                    CommandArgument='<%# Eval("TypeID") %>'
                                    OnClick="btnSelect_Click" />

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
