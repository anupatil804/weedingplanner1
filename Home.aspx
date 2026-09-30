<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Wedding Planner - Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        html {
            scroll-behavior: smooth;
        }

        body, html {
            height: 100%;
            margin: 0;
        }

        /* Section Height */
        .section {
            min-height: 100vh;
            width: 100%;
        }

        /* ✅ Reduce space only for About & Feedback */
        #about.section,
        #feedback.section {
            min-height: auto;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        /* Each slide */
        .carousel-item {
            height: 100vh;
            min-height: 500px;
            background-size: cover;
            background-position: center;
        }

        .dark-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 1;
        }

        .hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            z-index: 2;
        }

        .hero-content h1 {
            font-size: 3.2rem;
            font-weight: bold;
        }

        .hero-content p {
            font-size: 1.4rem;
        }

        /* Navbar */
        .navbar {
            background: rgba(255,255,255,0.95) !important;
        }

        .navbar-brand img {
            height: 40px;
        }

        /* Iframes */
        iframe {
            width: 100%;
            border: none;
        }

        .iframe-about {
            height: 80vh;
        }

        .iframe-services {
            height: 80vh;
        }

        /* Section Titles */
        .section-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #c2185b;
            margin: 20px 0 10px;  /* reduced margin */
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <a class="navbar-brand" href="#home">
        <img src="image/logo.png" />
    </a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ml-auto">

            <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="AboutUs.aspx">AboutUs</a></li>
            <li class="nav-item"><a class="nav-link" href="services.aspx">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="showweedingTypes.aspx">WeedingType</a></li>
            <li class="nav-item"><a class="nav-link" href="venue.aspx">Venues</a></li>
            <li class="nav-item"><a class="nav-link" href="ceremony.aspx">Ceremony</a></li>
            <li class="nav-item"><a class="nav-link" href="wishlist.aspx">View selected</a></li>
            <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>
            <li class="nav-item"><a class="nav-link" href="remaining_payment.aspx">pay remaining</a></li>

        </ul>
    </div>
</nav>


<!-- ================= HOME SECTION ================= -->
<section id="home" class="section">

    <div id="weddingCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">

        <div class="carousel-inner">
            <div class="carousel-item active" style="background-image:url('image/dist.jpg')"></div>
            <div class="carousel-item" style="background-image:url('image/weds.jpg')"></div>
            <div class="carousel-item" style="background-image:url('image/music.jpg')"></div>
            <div class="carousel-item" style="background-image:url('image/sang.jpg')"></div>
            <div class="carousel-item" style="background-image:url('image/hall.jpg')"></div>
        </div>

        <div class="dark-overlay"></div>

        <div class="hero-content">
            <h1>Your Dream Wedding Awaits</h1>
            <p>We create magical unforgettable moments</p>
        </div>

    </div>

</section>


<!-- ================= ABOUT SECTION ================= -->
<section id="about" class="section">

    <iframe
        src="AboutUs.aspx"
        class="iframe-about"
        scrolling="no">
    </iframe>

</section>


<!-- ================= FEEDBACK SECTION ================= -->
<section id="feedback" class="section">

    <iframe
        src="FeedbackShowcase.aspx"
        class="iframe-about"
        scrolling="yes">
    </iframe>

</section>


</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>