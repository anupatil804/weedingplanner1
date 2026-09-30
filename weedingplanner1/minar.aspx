<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="minar.aspx.cs"
    Inherits="minar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Photographer Profile</title>

    <!-- jQuery + UI -->
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
}

.navbar a {
    color:white;
    text-decoration:none;
    font-size:16px;
}

.navbar img {
    height:35px;
}

/* ===== CONTAINER ===== */

.container { width:92%; max-width:1250px; margin:40px auto; }

.card {
    background:#fff;
    border-radius:16px;
    box-shadow:0 6px 18px rgba(0,0,0,0.14);
    padding:30px;
    margin-bottom:40px;
}

.profile-card {
    display:flex;
    justify-content:space-between;
    gap:30px;
}

.profile-left {
    display:flex;
    gap:25px;
    align-items:center;
    flex:1;
}

.profile-left img {
    width:180px;
    height:180px;
    border-radius:50%;
    object-fit:cover;
    border:4px solid #eee;
}

.profile-info h2 { margin:0; }
.profile-info p { margin:6px 0; color:#555; }

.instagram-box {
    margin-top:10px;
    background:#f7f7f7;
    padding:8px 14px;
    border-radius:6px;
    display:inline-block;
    font-size:14px;
}

.side-card {
    background:#fff0f5;
    padding:24px;
    width:260px;
    border-radius:20px;
    text-align:center;
}

.side-card input, .side-card button {
    width:100%;
    height:38px;
    border-radius:10px;
    font-size:14px;
}

.side-card input {
    border:1px solid #ccc;
    padding:0 10px;
    margin-bottom:10px;
}

.select-btn {
    background:#c2185b;
    color:#fff;
    border:none;
    font-weight:bold;
    cursor:pointer;
}

.ui-datepicker td.booked a {
    background:#e53935 !important;
    color:#fff !important;
    border-radius:6px !important;
}

/* ===== GALLERY FIX ===== */

.gallery {
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:25px;
    margin-top:20px;
}

.image-card {
    width:100%;
    height:260px;
    border-radius:16px;
    overflow:hidden;
    background:#f2f2f2;
    cursor:pointer;
}

.image-card img {
    width:100%;
    height:100%;
    object-fit:cover;
    transition:0.3s;
}

.image-card img:hover {
    transform:scale(1.05);
}

/* ===== VIDEO ===== */

.video-row {
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:30px;
    margin-top:40px;
}

.video-card {
    width:100%;
    height:360px;
    border-radius:16px;
    overflow:hidden;
    background:black;
}

.video-card video {
    width:100%;
    height:100%;
    object-fit:cover;
}

/* ===== IMAGE POPUP ===== */

#imgPreview {
    display:none;
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.85);
    justify-content:center;
    align-items:center;
    z-index:9999;
}

#imgPreview img {
    max-width:90%;
    max-height:90%;
    border-radius:10px;
}

#imgPreview span {
    position:absolute;
    top:30px;
    right:40px;
    color:white;
    font-size:30px;
    cursor:pointer;
}

/* ===== RESPONSIVE ===== */

@media(max-width:900px) {

    .profile-card { flex-direction:column; }

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
            <img src="image/minar.jpeg" />

            <div class="profile-info">
                <h2>Minar Dev</h2>
                <p><strong>Photographer</strong></p>
                <p>📍 Kolhapur, India</p>
                <p>Bridal & party photographer with 5+ years of experience.</p>
                <p><strong>Charges:</strong> ₹1,00,000</p>

                <div class="instagram-box">
                    Instagram:
                    <a href="https://www.instagram.com/mindscapezz/" target="_blank"
                        style="color:#c2185b;font-weight:bold;">
                        @mindscapezz
                    </a>
                </div>
            </div>
        </div>

        <!-- DATE -->
        <div class="side-card">
            <h4>Select Date</h4>

            <asp:TextBox ID="txtDate" runat="server" />

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
            <div class="image-card"><img src="image/minar1.jpeg" /></div>
            <div class="image-card"><img src="image/minar2.jpeg" /></div>
            <div class="image-card"><img src="image/minar3.jpeg" /></div>
            <div class="image-card"><img src="image/minar4.jpeg" /></div>
        </div>

        <div class="video-row">
            <div class="video-card">
                <video controls>
                    <source src="video/minarv1.mp4" type="video/mp4" />
                </video>
            </div>

            <div class="video-card">
                <video controls>
                    <source src="video/minarv2.mp4" type="video/mp4" />
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
        "2025-12-05",
        "2025-12-10",
        "2025-12-18",
        "2025-12-25"
    ];

        function isBooked(date) {
            return bookedDates.includes($.datepicker.formatDate('yy-mm-dd', date));
        }

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: function (date) {
                return [true, isBooked(date) ? "booked" : ""];
            },
            onSelect: function (dateText) {

                if (bookedDates.includes(dateText)) {
                    Swal.fire("Photographer Busy",
                    "Photographer is busy on selected date",
                    "error");
                } else {
                    Swal.fire("Available",
                    "Photographer is available",
                    "success");
                }

            }
        });

    });

    /* ===== IMAGE CLICK PREVIEW ===== */

    $(".image-card img").click(function () {

        $("#previewImg").attr("src", $(this).attr("src"));
        $("#imgPreview").css("display", "flex");

    });

    function closePreview() {
        $("#imgPreview").hide();
    }

</script>

</form>
</body>
</html>