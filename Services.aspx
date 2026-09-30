<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <a href="Services.aspx">Services.aspx</a>
    <title>Our Services - Wedding Planner</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

    <style>
        body {
            background: #fdf2f7;
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

<body>

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

    <form id="form1" runat="server">

        <div class="container" style="margin-top:100px">

            <h2 class="text-center mb-5" style="color:#c2185b; font-weight:bold;">
                Our Premium Wedding Services
            </h2>

            <div class="row">

                <!-- Makeup Artist -->
                <div class="col-md-4 mb-4">
                    <a href="Makeup.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/mak.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Makeup Artist</h4>
                                <p>Professional bridal makeup for your perfect wedding look.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Photographer -->
                <div class="col-md-4 mb-4">
                    <a href="Photo.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/photo.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Photographers</h4>
                                <p>Capture your special moments with experienced photographers.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- DJ -->
                <div class="col-md-4 mb-4">
                    <a href="SoundDJ.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/djj.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Sound & DJ</h4>
                                <p>High-quality sound system and DJ for your celebrations.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Light Decorators -->
                <div class="col-md-4 mb-4">
                    <a href="LightDecor.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/lightt.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Light Decorators</h4>
                                <p>Stunning lighting arrangements to make your venue glow.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Heena Artist -->
                <div class="col-md-4 mb-4">
                    <a href="Mehndi.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/mehandii.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Heena Artist</h4>
                                <p>Beautiful bridal mehendi designs crafted with perfection.</p>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Caterers -->
                <div class="col-md-4 mb-4">
                    <a href="Caterer.aspx" style="text-decoration:none;">
                        <div class="service-card">
                            <img src="image/catt.jpg" />
                            <div class="p-3 text-center">
                                <h4 class="service-title">Caterers</h4>
                                <p>Delicious multi-cuisine catering services for your guests.</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>

    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
