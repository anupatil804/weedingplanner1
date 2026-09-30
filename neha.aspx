<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="neha.aspx.cs"
    Inherits="neha" %>

<!DOCTYPE html>
<html>
<head>
    <title>Neha Mehandi Artist Profile</title>

    <!-- jQuery + jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body { font-family: Arial; background:#fff5f8; margin:0; }

        /* ===== NAVBAR ===== */
        .navbar {
            width:100%;
            background:black;
            padding:12px 30px;
            display:flex;
            align-items:center;
            gap:30px;
            overflow-x:auto;
            white-space:nowrap;
        }
        .navbar a { color:white; text-decoration:none; font-size:16px; flex-shrink:0; }
        .navbar img { height:35px; flex-shrink:0; }

        .container { width:92%; max-width:1250px; margin:40px auto; }

        /* PROFILE CARD */
        .profile-card {
            display:flex;
            align-items:flex-start;
            gap:30px;
            background:#fff;
            padding:25px;
            border-radius:20px;
            box-shadow:0 6px 20px rgba(0,0,0,0.15);
            margin-bottom:40px;
            flex-wrap:wrap;
        }

        .profile-card img {
            width:180px;
            height:180px;
            border-radius:50%;
            object-fit:cover;
            border:4px solid #eee;
        }

        .profile-info h2 { margin:0; font-size:26px; color:#333; }
        .profile-info p { margin:6px 0; color:#555; font-size:16px; }
        .profile-id {
            background:#f7f7f7;
            display:inline-block;
            padding:8px 14px;
            border-radius:6px;
            margin-top:10px;
        }
        .profile-id a { color:#c2185b; font-weight:bold; text-decoration:none; }

        /* CALENDAR CARD */
        .calendar-card {
            background:#fff0f5;
            padding:26px;
            width:280px; /* consistent width */
            border-radius:22px;
            text-align:center;
            margin-left:auto;
        }

        .calendar-card h4 {
            margin-bottom:14px;
            font-size:18px;
            font-weight:600;
        }

        .calendar-card input,
        .calendar-card .select-btn {
            width:100%;
            height:42px;
            border-radius:12px;
            font-size:14px;
            box-sizing:border-box;
        }

        .calendar-card input {
            border:1px solid #ccc;
            padding:0 12px;
            margin-bottom:12px;
        }

        .calendar-card input:focus {
            border-color:#c2185b;
            outline:none;
            box-shadow:0 0 5px rgba(194,24,91,.4);
        }

        .select-btn {
            background:#c2185b;
            color:#fff;
            font-weight:bold;
            border:none;
            cursor:pointer;
        }

        .ui-datepicker td.booked a {
            background:#e53935 !important;
            color:#fff !important;
            border-radius:6px !important;
        }

        /* GALLERY */
        .gallery {
            display:grid;
            grid-template-columns:repeat(4,1fr);
            gap:25px;
            margin-top:25px;
        }
        .image-card img {
            width:100%;
            height:220px;
            object-fit:cover;
            border-radius:14px;
            box-shadow:0 4px 12px rgba(0,0,0,0.2);
            cursor:pointer;
        }

        /* VIDEO ROW */
        .video-row {
            display:grid;
            grid-template-columns:repeat(2,1fr);
            gap:30px;
            margin-top:40px;
        }
        video {
            width:100%;
            height:320px;
            border-radius:16px;
            background:#000;
            box-shadow:0 6px 18px rgba(0,0,0,0.3);
        }

        /* IMAGE POPUP */
        #imgPreview {
            display:none;
            position:fixed;
            top:0; left:0;
            width:100%; height:100%;
            background:rgba(0,0,0,0.85);
            justify-content:center; align-items:center;
            z-index:9999;
        }
        #imgPreview img { max-width:90%; max-height:90%; border-radius:10px; }
        #imgPreview span { position:absolute; top:30px; right:40px; color:white; font-size:30px; cursor:pointer; }

        @media(max-width:900px){
            .profile-card { flex-direction:column; text-align:center; }
            .gallery { grid-template-columns:repeat(2,1fr); }
            .video-row { grid-template-columns:1fr; }
            .calendar-card { width:100%; margin-top:15px; }
        }

        .ui-datepicker {
            width:280px !important;
            padding:12px;
            background:#fff0f5;
            border-radius:14px;
            box-shadow:0 6px 20px rgba(0,0,0,0.15);
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
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

<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container">

    <div class="profile-card">
        <img src="image/m5.jpeg" alt="Neha Thorat" />
        <div class="profile-info">
            <h2>Neha Thorat</h2>
            <p><strong>Mehandi Artist</strong></p>
            <p>📍 Kolhapur, India</p>
            <p>Bridal & party mehandi artist with 4+ years of experience.</p>
            <p>Charges: ₹10,500</p>
            <div class="profile-id">
                Instagram: <a href="https://www.instagram.com/neha_mehandiartist/" target="_blank">@neha_mehandiartist</a>
            </div>
        </div>

        <div class="calendar-card">
            <h4>Select Date</h4>
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="btnSelect" runat="server" Text="Select Artist" CssClass="select-btn" OnClick="btnSelect_Click" />
        </div>
    </div>

    <!-- GALLERY -->
    <div class="gallery">
        <div class="image-card"><img src="image/neha1.jpeg" /></div>
        <div class="image-card"><img src="image/neha2.jpeg" /></div>
        <div class="image-card"><img src="image/neha3.jpeg" /></div>
        <div class="image-card"><img src="image/neha4.jpeg" /></div>
    </div>

    <!-- VIDEOS -->
    <div class="video-row">
        <video controls><source src="video/nehav1.mp4" type="video/mp4" /></video>
        <video controls><source src="video/nehav2.mp4" type="video/mp4" /></video>
    </div>

</div>

<!-- IMAGE POPUP -->
<div id="imgPreview">
    <span onclick="closePreview()">✖</span>
    <img id="previewImg" />
</div>

<script>
    $(function () {
        var bookedDates = ["2025-12-12", "2025-12-18", "2025-12-23"];

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('yy-mm-dd', date);
                return [true, bookedDates.includes(d) ? "booked" : ""];
            },
            onSelect: function (dateText) {
                if (bookedDates.includes(dateText)) {
                    Swal.fire({ icon: 'error', title: 'Artist Busy', text: 'Artist is busy on selected date' });
                } else {
                    Swal.fire({ icon: 'success', title: 'Artist Available', text: 'Artist is available on selected date' });
                }
            }
        });

        // IMAGE POPUP
        $(".gallery img").click(function () {
            $("#previewImg").attr("src", $(this).attr("src"));
            $("#imgPreview").css("display", "flex");
        });
    });

    function closePreview() { $("#imgPreview").hide(); }
</script>

</form>
</body>
</html>