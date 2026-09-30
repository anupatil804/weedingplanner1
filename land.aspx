<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Land.aspx.cs" Inherits="Land" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Wedding Planner</title>

    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        html { scroll-behavior: smooth; }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        /* NAVBAR */
        .navbar {
            background: rgba(0,0,0,0.85);
            position: fixed;
            width: 100%;
            z-index: 999;
        }

        .navbar-brand img {
            height: 55px;
        }

        .btn-login {
            background: linear-gradient(90deg, #ff7ab8, #ff559d);
            border-radius: 25px;
            color: white;
            font-weight: bold;
        }

        .btn-register {
            background: linear-gradient(90deg, #ffe08a, #ffca4b);
            border-radius: 25px;
            font-weight: bold;
            color: #6b4800;
        }

        /* ================= HERO ================= */
        .hero {
            height: 100vh;
            background: url('image/land 1.jpg') center/cover fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }

        .hero::after {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.6);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero h1 {
            font-size: 72px;
            font-family: Georgia;
            text-shadow: 0 0 25px gold;
        }

        .hero p {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .hero .btn {
            padding: 14px 35px;
            font-size: 18px;
            margin: 10px;
        }

        /* ============== ABOUT VIDEO SECTION ============== */
        .about-video-section {
            position: relative;
            min-height: 100vh;
            overflow: hidden;
        }

        .about-video-section video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .about-overlay {
            background: rgba(0,0,0,0.45);
            min-height: 100vh;
            padding: 120px 0 80px;
        }

        .about-title {
            text-align: center;
            font-size: 44px;
            font-weight: bold;
            color: white;
            margin-bottom: 20px;
        }

        .about-desc {
            text-align: center;
            color: #fff;
            font-size: 18px;
            max-width: 900px;
            margin: 0 auto 60px;
        }

        /* ABOUT CARDS */
        .info-card {
            background: linear-gradient(135deg, rgba(255,255,255,0.95), rgba(255,240,249,0.95));
            border-radius: 20px;
            padding: 25px;
            transition: 0.4s ease;
            box-shadow: 0px 8px 22px rgba(255, 110, 169, 0.5);
            text-align: center;
            border: 2px solid rgba(255, 200, 230, 0.7);
            height: 100%;
        }

        .info-card:hover {
            transform: translateY(-15px) scale(1.03);
            box-shadow: 0px 18px 32px rgba(255, 80, 150, 0.8);
        }

        .info-card h4 {
            color: #e91e63;
            font-weight: bold;
            margin-bottom: 12px;
        }

        /* CTA */
        .cta {
            background: linear-gradient(90deg, #ff7ab8, #ff559d);
            color: white;
            text-align: center;
            padding: 80px 0;
        }

        .cta h2 {
            font-size: 40px;
            margin-bottom: 20px;
        }

        /* FOOTER */
        footer {
            background: #111;
            color: #aaa;
            padding: 30px 0;
            text-align: center;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">
            <img src="image/logo.png" />
        </a>

        <div class="ml-auto">
            <a href="Login.aspx" class="btn btn-login mr-2">Login</a>
            <a href="Registration.aspx" class="btn btn-register">Register</a>
        </div>
    </nav>

    <!-- HERO -->
    <section class="hero">
        <div class="hero-content">
            <h1>Your Dream Wedding</h1>
            <p>Plan • Customize • Celebrate</p>
            <a href="#about" class="btn btn-register">About Us</a>
            <a href="Registration.aspx" class="btn btn-login">Get Started</a>
        </div>
    </section>

    <!-- ABOUT US WITH VIDEO -->
    <section id="about" class="about-video-section">

        <!-- Video Background -->
        <video autoplay loop muted playsinline>
            <source src="video/vide.mp4" type="video/mp4" />
        </video>

        <div class="about-overlay">
            <div class="container">

                <h2 class="about-title">About Us</h2>

                <p class="about-desc">
                    We turn your dream weddings into reality with elegance, creativity, and unforgettable moments.
                    Our passionate team works with love and precision to make your big day truly magical.
                </p>

                <div class="row justify-content-center">

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4>Our Mission</h4>
                            <p>Creating magical and unforgettable wedding experiences tailored for every couple.</p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4>Creative Team</h4>
                            <p>A passionate team of planners, designers, and specialists bringing dreams to life.</p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4>Our Services</h4>
                            <p>Decoration, music, venues, catering, photography & more — all in one place.</p>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="info-card">
                            <h4>Why Choose Us?</h4>
                            <p>Luxury planning, creative execution, and stress-free weddings.</p>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="info-card">
                            <h4>Client Happiness</h4>
                            <p>Thousands of happy couples trust us to make their wedding unforgettable.</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta">
        <h2>Start Planning Your Wedding Today</h2>
        <a href="Registration.aspx" class="btn btn-light btn-lg">Register Now</a>
    </section>

    <!-- FOOTER -->
    <footer>
        © 2026 Wedding Planner | Made with ❤️
    </footer>

</form>
</body>
</html>
