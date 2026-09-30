<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %> 

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>About Us - Wedding Planner</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow-x: hidden;
            font-family: 'Segoe UI', sans-serif;
        }

        .video-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.45);
            min-height: 100vh;
            padding-top: 120px;
            padding-bottom: 40px;
        }

        h1 {
            color: #fff;
            text-align: center;
            font-weight: bold;
            font-size: 42px;
            margin-bottom: 20px;
        }

        .info-card {
            background: linear-gradient(135deg, rgba(255,255,255,0.90), rgba(255,240,249,0.90));
            border-radius: 20px;
            padding: 25px;
            transition: 0.4s ease;
            box-shadow: 0px 5px 20px rgba(255, 110, 169, 0.5);
            text-align: center;
            backdrop-filter: blur(5px);
            border: 2px solid rgba(255, 200, 230, 0.7);
        }

        .info-card:hover {
            transform: translateY(-15px) scale(1.03);
            box-shadow: 0px 15px 28px rgba(255, 80, 150, 0.7);
        }

        .card-title {
            color: #e91e63;
            font-weight: bold;
            font-size: 22px;
            margin-bottom: 10px;
        }

        /* Back Button */
        .back-btn {
            position: fixed;
            top: 20px;
            right: 25px;
            z-index: 999;
            background: rgba(255, 182, 193, 0.9);
            border: none;
            padding: 10px 22px;
            border-radius: 30px;
            color: white;
            font-weight: bold;
            font-size: 15px;
            box-shadow: 0px 4px 15px rgba(255, 105, 180, 0.6);
            transition: 0.3s;
        }

        .back-btn:hover {
            background: #ff4da6;
            transform: scale(1.08);
        }

        nav.navbar {
            height: 65px;
            padding-top: 5px;
            padding-bottom: 5px;
            z-index: 20;
        }

        .navbar-brand img {
            height: 45px;
        }
    </style>

</head>

<body>

    <!-- Background Video -->
    <video autoplay loop muted playsinline class="video-bg">
        <source src="video/vide.mp4" type="video/mp4" />
    </video>

    <form id="form1" runat="server">

        <!-- Back Button (Redirect to Home Page) -->
        <button type="button" class="back-btn" onclick="window.location.href='Home.aspx';">
            ← Back
        </button>

        <div class="overlay">

            <h1>About Us</h1>

            <p class="text-center text-white mb-5"
               style="font-size: 18px; max-width: 850px; margin: 0 auto;">
                We turn your dream weddings into reality with elegance, creativity, and
                unforgettable moments. Our team works with passion and love to make your
                big day truly magical.
            </p>

            <div class="container mt-5">
                <div class="row justify-content-center">

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4 class="card-title">Our Mission</h4>
                            <p>
                                Creating magical and unforgettable wedding experiences tailored perfectly for each couple.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4 class="card-title">Creative Team</h4>
                            <p>
                                A passionate team of planners, designers, and event specialists bringing dreams to life.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4 class="card-title">Our Services</h4>
                            <p>
                                From decoration to music, venue, catering & photography — we handle everything beautifully.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4 class="card-title">Why Choose Us?</h4>
                            <p>
                                We combine creativity, luxury, and perfect execution to deliver stress-free wedding moments.
                            </p>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="info-card">
                            <h4 class="card-title">Client Happiness</h4>
                            <p>
                                Thousands of satisfied couples trust us to make their big day truly unforgettable.
                            </p>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </form>

</body>
</html>
