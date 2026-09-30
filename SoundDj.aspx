<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SoundDJ.aspx.cs" Inherits="SoundDJ" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sound & DJ</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>

        body {
            background: #fff5f7;
            font-family: 'Poppins', sans-serif;
        }

         /* NAVBAR */
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

        /* HEADER */
        .page-header {
            text-align: center;
            padding: 50px 15px 20px;
        }

        .page-header h2 {
            color: #c2185b;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .page-header p {
            color: #666;
            max-width: 600px;
            margin: auto;
            font-size: 15px;
        }

        /* GRID */
        .artist-grid {
            padding-bottom: 60px;
        }

        /* CARD */
        .artist-card {
            position: relative;
            background: rgba(255,255,255,0.9);
            border-radius: 20px;
            backdrop-filter: blur(6px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.18);
            width: 260px;
            margin: auto;
            overflow: hidden;
            transition: all 0.4s ease;
            border: 2px solid transparent;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        /* Glow Border */
        .artist-card:before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 20px;
            padding: 2px;
            background: linear-gradient(45deg,#e91e63,#f48fb1,#e91e63);
            -webkit-mask:
              linear-gradient(#fff 0 0) content-box,
              linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            opacity: 0;
            transition: 0.4s;
        }

        .artist-card:hover:before {
            opacity: 1;
        }

        /* Hover */
        .artist-card:hover {
            transform: translateY(-12px) scale(1.03);
        }

        /* IMAGE */
        .artist-img {
            height: 240px;
            overflow: hidden;
            padding: 15px;
        }

        .artist-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
            transition: 0.5s;
            border: 4px solid #f8bbd0;
        }

        .artist-card:hover img {
            transform: scale(1.1);
        }

        /* OVERLAY */
        .artist-overlay {
            position: absolute;
            inset: 0;
            background: rgba(233,30,99,0.85);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: 0.4s;
        }

        .artist-card:hover .artist-overlay {
            opacity: 1;
        }

        .view-btn {
            background: #fff;
            color: #e91e63;
            padding: 8px 22px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 14px;
            text-decoration: none;
            transition: 0.3s;
        }

        .view-btn:hover {
            background: #e91e63;
            color: #fff;
        }

        /* BODY */
        .artist-body {
            text-align: center;
            padding: 15px;
            background: linear-gradient(to bottom,#fff,#fff5f7);
        }

        .artist-body h5 {
            font-size: 17px;
            color: #e91e63;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .artist-body p {
            font-size: 14px;
            color: #555;
            margin: 0;
        }

        /* LINK */
        a.card-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        /* MOBILE */
        @media(max-width:768px) {
            .artist-card {
                width: 100%;
            }
        }

    </style>
</head>

<body>
<form id="form1" runat="server">

     <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">
            <img src="image/logo.jpg" />
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-3">
                <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Aboutus.aspx">Aboutus</a></li>
                <li class="nav-item"><a class="nav-link" href="Services.aspx">services</a></li>
                <li class="nav-item"><a class="nav-link" href="showweedingTypes.aspx">weedingTypes</a></li>
                <li class="nav-item"><a class="nav-link" href="venue.aspx">venues</a></li>
                <li class="nav-item"><a class="nav-link" href="wishlist.aspx">view selected</a></li>
                <li class="nav-item"><a class="nav-link" href="Feedback.aspx">Feedback</a></li>

            </ul>
        </div>
    </nav>


    <!-- HEADER -->
    <div class="page-header">
        <h2>Professional Sound & DJ Services</h2>
        <p>
            Make your wedding celebration unforgettable with our premium DJ & sound systems
        </p>
    </div>


    <!-- CONTENT -->
    <div class="container artist-grid">

        <div class="row justify-content-center">

            <asp:DataList ID="DataList1" runat="server"
                RepeatColumns="3"
                RepeatDirection="Horizontal"
                CellPadding="30">

                <ItemTemplate>

                    <a href='<%# GetSoundLink(Container.ItemIndex) %>' 
                       class="artist-card">

                        <!-- IMAGE -->
                        <div class="artist-img">
                            <img src='ImageHandler.ashx?id=<%# Eval("Artist_id") %>' />
                        </div>

                        <!-- OVERLAY -->
                        <div class="artist-overlay">
                            <span class="view-btn">View Profile</span>
                        </div>

                        <!-- BODY -->
                        <div class="artist-body">
                            <h5><%# Eval("Artistname") %></h5>
                            <p><%# Eval("City") %></p>
                        </div>

                    </a>

                </ItemTemplate>

            </asp:DataList>

        </div>

    </div>

</form>
</body>
</html>
