<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jmd.aspx.cs" Inherits="jmd" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>JMD Light Decorator</title>

    <!-- jQuery + UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body { font-family: Arial, sans-serif; background:#fff5f8; margin:0; }

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

        /* ===== CONTAINER ===== */
        .container { width:92%; max-width:1300px; margin:40px auto; }

        /* ===== PROFILE CARD ===== */
        .profile-card { display:flex; justify-content:space-between; gap:30px; flex-wrap:wrap; }

        .profile-left { display:flex; gap:25px; align-items:center; flex:1; }
        .profile-left img { width:180px; height:180px; border-radius:50%; object-fit:cover; border:4px solid #eee; }

        .profile-info h2 { margin:0; font-size:24px; }
        .profile-info p { margin:6px 0; color:#555; font-size:15px; }

        .instagram-box {
            margin-top:10px;
            background:#f7f7f7;
            padding:8px 14px;
            border-radius:6px;
            display:inline-block;
            font-size:14px;
            color:#c2185b;
            font-weight:bold;
        }

        /* ===== CALENDAR CARD ===== */
        .side-card { background:#fff0f5; padding:24px; width:260px; border-radius:20px; text-align:center; }

        .side-card input, .side-card button { width:100%; height:38px; border-radius:10px; font-size:14px; }
        .side-card input { border:1px solid #ccc; padding:0 10px; margin-bottom:10px; }
        .select-btn { background:#c2185b; color:#fff; border:none; font-weight:bold; cursor:pointer; }

        .ui-datepicker td.booked-date a { background:#e53935 !important; color:#fff !important; border-radius:6px !important; }

        /* ===== GALLERY ===== */
        h3 { margin-bottom:20px; }
        .gallery { display:grid; grid-template-columns:repeat(4,1fr); gap:25px; margin-top:20px; }
        .image-card { background:#fff; border-radius:12px; padding:8px; cursor:pointer; }
        .image-card img { width:100%; height:220px; object-fit:contain; border-radius:10px; }

        /* ===== VIDEOS ===== */
        .video-row { display:grid; grid-template-columns:repeat(2,1fr); gap:30px; margin-top:35px; }
        .video-card video { width:100%; height:320px; border-radius:12px; }

        /* ===== IMAGE POPUP ===== */
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

        /* ===== RESPONSIVE ===== */
        @media(max-width:900px){
            .profile-card { flex-direction:column; }
            .side-card { width:100%; margin-top:20px; }
            .gallery { grid-template-columns:repeat(2,1fr); }
            .video-row { grid-template-columns:1fr; }
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

    <!-- PROFILE -->
    <div class="card profile-card">
        <div class="profile-left">
            <img src="image/l2.jpeg" alt="JMD Light Decorator" />
            <div class="profile-info">
                <h2>JMD Light Decorator</h2>
                <p>📍 Satara, India</p>
                <p>Bridal & party lighting services.</p>

                <div class="instagram-box">
                    Instagram:
                    <a href="https://www.instagram.com/jmd_lightdecor" target="_blank" style="color:#c2185b; text-decoration:none;">
                        @jmd_lightdecor
                    </a>
                </div>
            </div>
        </div>

        <!-- CALENDAR -->
        <div class="side-card">
            <h4>Select Date</h4>
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="true" />
            <asp:Button ID="btnSelect" runat="server"
                        Text="Select Artist"
                        CssClass="select-btn"
                        OnClick="btnSelect_Click" />
        </div>
    </div>

    <!-- GALLERY -->
    <div class="card">
        <h3>Work Gallery</h3>
        <div class="gallery">
            <div class="image-card"><img src="image/jmd1.jpeg" /></div>
            <div class="image-card"><img src="image/jmd2.jpeg" /></div>
            <div class="image-card"><img src="image/jmd3.jpeg" /></div>
            <div class="image-card"><img src="image/jmd4.jpeg" /></div>
        </div>

        <!-- VIDEOS -->
        <div class="video-row">
            <div class="video-card">
                <video controls>
                    <source src="video/jmdv1.mp4" type="video/mp4" />
                </video>
            </div>
            <div class="video-card">
                <video controls>
                    <source src="video/jmdv2.mp4" type="video/mp4" />
                </video>
            </div>
        </div>
    </div>

</div>

<!-- IMAGE POPUP -->
<div id="imgPreview">
    <span onclick="closePreview()">✖</span>
    <img id="previewImg" />
</div>

<script>
    $(function () {
        var bookedDates = [
        "2025-12-05", "2025-12-10", "2025-12-15", "2025-12-20", "2025-12-28",
        "2026-01-03", "2026-01-07", "2026-01-12", "2026-01-18", "2026-01-25"
    ];

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('yy-mm-dd', date);
                return [true, bookedDates.includes(d) ? "booked-date" : ""];
            },
            onSelect: function (dateText) {
                if (bookedDates.includes(dateText)) {
                    Swal.fire('Unavailable', 'Artist is unavailable on this date', 'error');
                } else {
                    Swal.fire('Available', 'Artist is available on this date', 'success');
                }
            }
        });

        // IMAGE POPUP
        $(".image-card img").click(function () {
            $("#previewImg").attr("src", $(this).attr("src"));
            $("#imgPreview").css("display", "flex");
        });
    });

    function closePreview() { $("#imgPreview").hide(); }
</script>

</form>
</body>
</html>