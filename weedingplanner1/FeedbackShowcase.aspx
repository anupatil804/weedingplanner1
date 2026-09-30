<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="FeedbackShowcase.aspx.cs"
    Inherits="FeedbackShowcase" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Client Feedback</title>

    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg,#fff1f7,#ffe4f0);
            font-family: 'Poppins', sans-serif;
        }

        /* HEADER */
        .hero-section {
            height: 120px;
            background: linear-gradient(135deg,#c2185b,#ff80ab);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
        }

        .hero-section h1 {
            font-weight: 700;
            font-size: 38px;
        }

        /* SECTION TITLE */
        .section-title {
            text-align: center;
            margin: 60px 0 30px;
            color: #c2185b;
            font-weight: 700;
        }

        /* FEEDBACK CARD */
        .feedback-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            transition: 0.3s;
        }

        .feedback-card:hover {
            transform: translateY(-10px);
        }

        .user-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 4px solid #e91e63;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .user-name {
            font-weight: 600;
            color: #c2185b;
        }

        .stars {
            color: gold;
            font-size: 18px;
        }

        /* VIDEO */
        .video-card {
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 8px 22px rgba(0,0,0,0.15);
        }

        .video-card video {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        /* MARQUEE */
        marquee {
            padding: 20px 0;
        }

        .mini-card {
            display: inline-block;
            background: white;
            padding: 15px 25px;
            margin: 0 10px;
            border-radius: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            font-weight: 600;
            color: #c2185b;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- HERO -->
    <div class="hero-section">
        <h1>Happy Couples, Beautiful Stories</h1>
        <p>Real love • Real memories • Real happiness ❤️</p>
    </div>


    <!-- TEXT FEEDBACK -->
    <div class="container">

        <h2 class="section-title">Client Reviews</h2>

        <div class="row">

            <!-- CARD 1 -->
            <div class="col-md-4 mb-4">
                <div class="feedback-card">
                    <img src="image/minar.jpeg" class="user-img" />
                    <div class="user-name">yash joshi</div>
                    <div class="stars">★★★★★</div>
                    <p>
                        My wedding was perfect! Everything was well managed.
                    </p>
                </div>
            </div>

            <!-- CARD 2 -->
            <div class="col-md-4 mb-4">
                <div class="feedback-card">
                    <img src="image/pranali.jpeg" class="user-img" />
                    <div class="user-name">pranali Patil</div>
                    <div class="stars">★★★★★</div>
                    <p>
                        Best wedding planner ever. Highly recommended.
                    </p>
                </div>
            </div>

            <!-- CARD 3 -->
            <div class="col-md-4 mb-4">
                <div class="feedback-card">
                    <img src="image/trupti.jpeg" class="user-img" />
                    <div class="user-name">Neha Deshmukh</div>
                    <div class="stars">★★★★☆</div>
                    <p>
                        Very professional and creative team.
                    </p>
                </div>
            </div>

        </div>

    </div>


    <!-- VIDEO TESTIMONIALS -->
    <div class="container">

        <h2 class="section-title">Video Testimonials</h2>

        <div class="row">

            <div class="col-md-4 mb-4">
                <div class="video-card">
                    <video controls>
                        <source src="video/feedback1.mp4" type="video/mp4" />
                    </video>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="video-card">
                    <video controls>
                        <source src="video/v2.mp4" type="video/mp4" />
                    </video>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="video-card">
                    <video controls>
                        <source src="video/v3.mp4" type="video/mp4" />
                    </video>
                </div>
            </div>

        </div>

    </div>


    <!-- MARQUEE -->
    <h2 class="section-title">Our Happy Clients</h2>

    <marquee behavior="scroll" direction="left" scrollamount="7">

        <span class="mini-card">💍 Perfect Planning</span>
        <span class="mini-card">🎉 Beautiful Decoration</span>
        <span class="mini-card">📸 Amazing Photos</span>
        <span class="mini-card">🎵 Best DJ</span>
        <span class="mini-card">🍽️ Delicious Food</span>
        <span class="mini-card">❤️ 1000+ Happy Couples</span>

    </marquee>


</form>

</body>
</html>
