<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <title>Wedding Feedback</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background: linear-gradient(135deg,#fff0f5,#ffe4ec);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
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

        .feedback-box {
            max-width: 550px;
            margin: auto;
            margin-top: 120px;
            background: white;
            padding: 35px;
            border-radius: 22px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            border: 1px solid #ffc1d1;
        }

        h2 {
            color: #d81b60;
            font-weight: bold;
        }

        .btn-submit {
            background: linear-gradient(135deg,#d81b60,#ec407a);
            border: none;
            color: white;
            font-weight: 600;
        }

        .btn-submit:hover {
            background: linear-gradient(135deg,#c2185b,#e91e63);
        }

        .star {
            font-size: 30px;
            cursor: pointer;
            color: lightgray;
        }

        .star.selected {
            color: gold;
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


    <div class="feedback-box">

        <h2 class="text-center mb-4">💍 Wedding Feedback</h2>

        <!-- Name -->
        <div class="mb-3">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
        </div>

        <!-- Rating -->
        <div class="mb-3 text-center">

            <label class="fw-bold">Your Rating</label><br />

            <span class="star" onclick="setRating(1)">★</span>
            <span class="star" onclick="setRating(2)">★</span>
            <span class="star" onclick="setRating(3)">★</span>
            <span class="star" onclick="setRating(4)">★</span>
            <span class="star" onclick="setRating(5)">★</span>

            <input type="hidden" id="rating" runat="server" value="0" />

        </div>

        <!-- Message -->
        <div class="mb-3">
            <label>Message</label>
            <asp:TextBox ID="txtMessage" runat="server"
                CssClass="form-control"
                TextMode="MultiLine"
                Rows="4" />
        </div>

        <!-- Button -->
        <div class="text-center">

            <asp:Button ID="btnSubmit"
                runat="server"
                Text="Submit Feedback"
                CssClass="btn btn-submit px-5"
                OnClick="btnSubmit_Click" />

        </div>

    </div>

</form>


<script>

    function setRating(value) {

        document.getElementById('<%= rating.ClientID %>').value = value;

        let stars = document.querySelectorAll('.star');

        stars.forEach((star, index) => {

            if (index < value)
                star.classList.add('selected');
            else
                star.classList.remove('selected');
        });
    }

</script>

</body>
</html>
