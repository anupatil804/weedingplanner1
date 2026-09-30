<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="ceremony.aspx.cs" Inherits="ceremony" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Select Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>

        /* Page Background */
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

        /* Main Container */
        .container {
            background: white;
            padding: 35px 30px;
            border-radius: 22px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
            border: 1px solid #ffd6de;
        }

        /* Page Title */
        h2 {
            color: #d81b60;
            font-weight: 700;
            letter-spacing: 1px;
        }

        h4 {
            color: #6c757d;
            text-align: center;
            margin-bottom: 40px;
        }

        /* Ceremony Card */
        .ceremony-card {
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 380px;
            position: relative;
            border-radius: 18px;
            overflow: hidden;
            border: 1px solid #f3b7c6;
            box-shadow: 0 5px 15px rgba(216,27,96,0.15);
            background: white;
        }

        .ceremony-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(216,27,96,0.3);
        }

        /* Image */
        .ceremony-img {
            height: 260px;
            object-fit: cover;
        }

        /* Card Title */
        .card-title {
            color: #c2185b;
            font-weight: 600;
        }

        /* Checkbox */
        .checkbox-wrapper {
            position: absolute;
            bottom: 12px;
            right: 12px;
            z-index: 20;
            background: #ffffff;
            padding: 5px 7px;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(216,27,96,0.25);
            border: 1px solid #f3b7c6;
        }

        .big-checkbox input {
            width: 26px;
            height: 26px;
            cursor: pointer;
            accent-color: #d81b60;
        }

        /* Next Button */
        .btn-success {
            background: linear-gradient(135deg, #d81b60, #ec407a);
            border: none;
            font-weight: 600;
            border-radius: 25px;
            padding: 10px 35px;
            transition: 0.3s;
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #c2185b, #e91e63);
            box-shadow: 0 5px 15px rgba(216,27,96,0.4);
            transform: scale(1.05);
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

    <h2 class="text-center mb-4 fw-bold">Select Ceremony</h2>

    <h4>
        Click on each ceremony image to view beautiful decorations
        and select checkbox for your wedding ceremony.
    </h4>


    <div class="row">

        <asp:Repeater ID="rptCeremony" runat="server">

            <ItemTemplate>

                <div class="col-lg-4 col-md-6 mb-5">

                    <div class="card ceremony-card"
                         onclick="goNextPage(<%# Eval("CeremonyID") %>)">

                        <img src='<%# "Image/" + Eval("ImageName") %>'
                             class="card-img-top ceremony-img" />

                        <div class="card-body text-center">

                            <h4 class="card-title fw-bold">
                                <%# Eval("CeremonyName") %>
                            </h4>

                        </div>

                        <!-- Hidden Fields -->
                        <asp:HiddenField ID="hfCeremonyID" runat="server"
                            Value='<%# Eval("CeremonyID") %>' />

                        <asp:HiddenField ID="hfCeremonyName" runat="server"
                            Value='<%# Eval("CeremonyName") %>' />

                        <asp:HiddenField ID="hfImage" runat="server"
                            Value='<%# Eval("ImageName") %>' />

                        <!-- Checkbox -->
                        <div class="checkbox-wrapper big-checkbox"
                             onclick="event.stopPropagation();">

                            <asp:CheckBox ID="chkSelect" runat="server" />

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>


    <div class="text-center mt-4">

        <asp:Button ID="btnNext" runat="server"
            Text="Next →"
            CssClass="btn btn-success btn-lg px-5"
            OnClick="btnNext_Click" />

    </div>

</div>


<script type="text/javascript">

    function goNextPage(id) {

        switch (id) {

            case 1: window.location.href = "haldiDetail.aspx"; break;
            case 2: window.location.href = "MehendiDetail.aspx"; break;
            case 3: window.location.href = "sangeetDetails.aspx"; break;
            case 4: window.location.href = "varmalaDetails.aspx"; break;
            case 5: window.location.href = "SaptapadiDetails.aspx"; break;

            default: alert("Ceremony page not found");
        }
    }

</script>

</form>

</body>
</html>
