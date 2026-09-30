<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="sonali.aspx.cs"
    Inherits="sonali" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sonali Mehandi Artist Profile</title>

    <!-- jQuery + UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body { font-family: Arial; background:#fff5f8; margin:0; }

        /* NAVBAR */
        .navbar {
            width:100%;
            background:black;
            padding:12px 30px;
            display:flex;
            align-items:center;
            gap:30px;
        }
        .navbar a { color:white; text-decoration:none; font-size:16px; }
        .navbar img { height:35px; }

        .container { width:92%; max-width:1250px; margin:40px auto; }

        /* MAIN CARD */
        .main-card {
            background:#fff;
            border-radius:28px;
            box-shadow:0 12px 35px rgba(0,0,0,0.15);
            padding:40px;
            display:flex;
            justify-content:space-between;
            gap:40px;
            flex-wrap:wrap;
        }

        .left-box { display:flex; gap:30px; }
        .left-box img {
            width:180px;
            height:180px;
            border-radius:50%;
            object-fit:cover;
        }

        .info h2 { margin:0; }

        /* ✅ UPDATED RIGHT BOX LIKE MINI */
        .right-box {
            background:#fff0f5;
            padding:30px;
            width:280px;
            border-radius:22px;
            text-align:center;
        }

        .right-box input,
        .right-box .select-btn {
            width:100%;
            height:45px;
            border-radius:10px;
            box-sizing:border-box;
        }

        .right-box input {
            padding:0 12px;
            margin-bottom:15px;
            border:1px solid #ccc;
            outline:none;
        }

        .right-box input:focus {
            border-color:#c2185b;
            box-shadow:0 0 5px rgba(194,24,91,0.3);
        }

        .select-btn {
            background:#c2185b;
            color:white;
            border:none;
            font-weight:bold;
            cursor:pointer;
        }

        /* BOOKED */
        .ui-datepicker td.booked a {
            background:#e53935 !important;
            color:#fff !important;
            border-radius:6px;
        }

        /* GALLERY */
        .gallery {
            display:grid;
            grid-template-columns:repeat(4,1fr);
            gap:25px;
            margin-top:40px;
        }
        .gallery img {
            width:100%;
            height:220px;
            object-fit:cover;
            border-radius:16px;
            cursor:pointer;
        }

        /* VIDEO */
        .video-row {
            display:grid;
            grid-template-columns:repeat(2,1fr);
            gap:30px;
            margin-top:45px;
        }
        video { width:100%; height:330px; border-radius:18px; }

        /* ✅ UPDATED POPUP LIKE MINI */
        .img-popup{
            display:none;
            position:fixed;
            left:0;
            top:0;
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.85);
            justify-content:center;
            align-items:center;
            z-index:9999;
        }
        .img-popup img{
            max-width:80%;
            max-height:80%;
            border-radius:10px;
        }
        .close{
            position:absolute;
            top:30px;
            right:40px;
            font-size:40px;
            color:white;
            cursor:pointer;
        }

        @media(max-width:900px){
            .main-card { flex-direction:column; }
            .right-box { width:100%; }
            .gallery { grid-template-columns:repeat(2,1fr); }
            .video-row { grid-template-columns:1fr; }
        }
    </style>
</head>

<body>

<div class="navbar">
    <img src="image/logo.png" />
    <a href="home.aspx">Home</a>
    <a href="about.aspx">About</a>
    <a href="services.aspx">Services</a>
    <a href="weedingtype.aspx">WeedingType</a>
    <a href="venues.aspx">Venues</a>
    <a href="ceremony.aspx">Ceremonies</a>
    <a href="wishlist.aspx">View Selected</a>
    <a href="feedback.aspx">Feedback</a>
</div>

<form id="Form1" runat="server">

<div class="container">

<div class="main-card">

    <div class="left-box">
        <img src="image/m1.jpeg" />

        <div class="info">
            <h2>Sonali Yadav</h2>
            <p><strong>Mehandi Artist</strong></p>
            <p>📍 Sangli, India</p>
            <p>Bridal & party mehandi artist with professional experience.</p>
            <p><strong>Charges: ₹10,000</strong></p>
        </div>
    </div>

    <div class="right-box">

        <h4>Select Date</h4>

        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

        <asp:Button ID="btnSelectArtist"
            runat="server"
            Text="Add to Wishlist"
            CssClass="select-btn"
            OnClick="btnSelectArtist_Click" />

    </div>

</div>

<!-- GALLERY -->
<div class="gallery">
    <img src="image/sonali1.jpeg" class="popupImg"/>
    <img src="image/sonali2.jpeg" class="popupImg"/>
    <img src="image/sonali3.jpeg" class="popupImg"/>
    <img src="image/sonali4.jpeg" class="popupImg"/>
</div>

<!-- VIDEOS -->
<div class="video-row">
    <video controls><source src="video/sonaliv1.mp4" type="video/mp4"/></video>
    <video controls><source src="video/sonaliv2.mp4" type="video/mp4"/></video>
</div>

</div>

<!-- POPUP -->
<div class="img-popup" id="imgPopup">
    <span class="close" onclick="closePopup()">×</span>
    <img id="popupImg"/>
</div>

<script>

    $(function () {

        var bookedDates = ["05-01-2026", "12-01-2026", "20-01-2026"];

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

        $(".popupImg").click(function () {
            $("#popupImg").attr("src", $(this).attr("src"));
            $("#imgPopup").css("display", "flex");
        });

    });

    function closePopup() {
        $("#imgPopup").hide();
    }

</script>

</form>
</body>
</html>