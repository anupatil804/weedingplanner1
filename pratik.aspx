<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="pratik.aspx.cs"
    Inherits="pratik" %>

<!DOCTYPE html>
<html>
<head>
    <title>Makeup Artist Profile</title>

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <style>
        
        body { font-family: Arial; background: #fff5f8; margin: 0; }
        .navbar {
    background: black;
    height: 60px;
    display: flex;
    align-items: center;
    padding: 0 20px;
    gap: 30px;   /* space between logo and menu */
}

.logo {
    height: 45px;
    width: 45px;
}

.nav-menu {
    display: flex;
    gap: 28px;
}

.nav-menu a {
    color: white;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
}

.nav-menu a:hover {
    color: #ffcc00;
}
        .container { width: 92%; max-width: 1250px; margin: 40px auto; }
        .card { background: #fff; border-radius: 16px; box-shadow: 0 6px 18px rgba(0,0,0,0.14); padding: 30px; margin-bottom: 40px; }
        .profile-card { display: flex; justify-content: space-between; gap: 30px; }
        .profile-left { display: flex; gap: 25px; }
        .profile-left img { width: 180px; height: 180px; border-radius: 50%; object-fit: cover; }

        .insta { margin-top: 8px; display: inline-block; background: #fce4ec; padding: 6px 12px; border-radius: 8px; font-weight: bold; }
        .insta a { text-decoration: none; color: #c2185b; }

        .side-card { background: #fdecef; padding: 22px 18px; width: 280px; border-radius: 20px; text-align: center; }
        .side-card h4 { font-size: 18px; margin-bottom: 12px; }
        .side-card input, .side-card button { width: 100%; height: 36px; font-size: 14px; border-radius: 10px; box-sizing: border-box; }
        .side-card input { border: 1px solid #ccc; padding: 0 10px; margin-bottom: 10px; }
        .select-btn { background: #c2185b; color: #fff; border: none; font-weight: bold; cursor: pointer; }

        .ui-datepicker td.booked a {
            background: #e53935 !important;
            color: #fff !important;
            border-radius: 6px !important;
        }

        /* ===== GALLERY IMPROVED ===== */

        .gallery {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }

        .image-card {
            background: #fafafa;
            border-radius: 14px;
            padding: 10px;
            box-shadow: 0 4px 14px rgba(0,0,0,0.12);
            transition: 0.3s;
            cursor: pointer;
        }

        .image-card:hover {
            transform: scale(1.05);
        }

        .image-card img {
            width: 100%;
            height: auto;
            max-height: 320px;
            object-fit: contain;
            border-radius: 12px;
        }

        /* VIDEO */

        .video-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 35px;
            margin-top: 40px;
        }

        .video-card video {
            width: 100%;
            height: 340px;
            border-radius: 12px;
        }

        /* ===== IMAGE POPUP ===== */

        .img-popup {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.85);
            justify-content: center;
            align-items: center;
        }

        .img-popup img {
            max-width: 85%;
            max-height: 85%;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.5);
            animation: zoomIn 0.3s ease;
        }

        .close-btn {
            position: absolute;
            top: 30px;
            right: 40px;
            font-size: 40px;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        @keyframes zoomIn {
            from { transform: scale(0.7); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        @media (max-width: 900px) {
            .gallery { grid-template-columns: repeat(2, 1fr); }
            .video-row { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>

<div class="navbar">

    <img src="image/logo.png" class="logo" />

    <div class="nav-menu">
        <a href="home.aspx">Home</a>
        <a href="about.aspx">About</a>
        <a href="services.aspx">Services</a>
        <a href="weddingtype.aspx">WeedingType</a>
        <a href="venues.aspx">Venues</a>
        <a href="ceremony.aspx">Ceremony's</a>
        <a href="wishlist.aspx">View selected</a>
        <a href="feedback.aspx">Feedback</a>
    </div>

</div>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container">

    <!-- PROFILE -->
    <div class="card profile-card">
        <div class="profile-left">
            <img src="image/pratik.jpeg" />
            <div>
                <h2>Pratik Pawar</h2>
                <p><strong>Makeup Artist</strong></p>
                <p>📍 Satara, India</p>
                <p>Bridal & party makeup artist with 5+ years of experience.</p>
                <p>Charges=70,000</p>

                <div class="insta">
                    Instagram: <a href="https://www.instagram.com/pratik_makeup" target="_blank">@pratik_makeup</a>
                </div>
            </div>
        </div>

        <!-- Date Card -->
        <div class="side-card">
            <h4>Select Date</h4>
            <asp:TextBox ID="txtDate" runat="server" />
            <asp:Button ID="btnCheck" runat="server"
                Text="Select Artist"
                CssClass="select-btn"
                OnClick="btnCheck_Click" />
        </div>
    </div>

    <!-- GALLERY -->
    <div class="card">
        <h3>Work Gallery</h3>

        <div class="gallery">
            <div class="image-card"><img src="image/pra1.jpeg" /></div>
            <div class="image-card"><img src="image/pra2.jpeg" /></div>
            <div class="image-card"><img src="image/pra3.jpeg" /></div>
            <div class="image-card"><img src="image/pra4.jpeg" /></div>
        </div>

        <!-- VIDEOS -->
        <div class="video-row">
            <div class="video-card">
                <video controls>
                    <source src="video/pratik1.mp4" type="video/mp4" />
                </video>
            </div>

            <div class="video-card">
                <video controls>
                    <source src="video/pratik2.mp4" type="video/mp4" />
                </video>
            </div>
        </div>
    </div>

</div>

<!-- IMAGE POPUP -->
<div class="img-popup" id="imgPopup">
    <span class="close-btn" onclick="closePopup()">×</span>
    <img id="popupImg" src="" />
</div>

<script>
    $(function () {

        var bookedDates = ["08-12-2025", "10-12-2025", "15-12-2025", "20-12-2025"];

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "dd-mm-yy",
            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('dd-mm-yy', date);
                return [true, bookedDates.includes(d) ? "booked" : ""];
            },
            onSelect: function (dateText) {
                Swal.fire({
                    icon: bookedDates.includes(dateText) ? 'error' : 'success',
                    title: bookedDates.includes(dateText) ? 'Artist Busy' : 'Artist Available',
                    text: bookedDates.includes(dateText)
                        ? 'Artist is busy on selected date'
                        : 'Artist is available on selected date'
                });
            }
        });

        // IMAGE CLICK POPUP
        $(".image-card img").click(function () {
            var src = $(this).attr("src");
            $("#popupImg").attr("src", src);
            $("#imgPopup").css("display", "flex");
        });

    });

    function closePopup() {
        $("#imgPopup").hide();
    }

    $("#imgPopup").click(function (e) {
        if (e.target.id === "imgPopup") {
            closePopup();
        }
    });

</script>

</form>
</body>
</html>