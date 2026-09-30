<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sumit.aspx.cs" Inherits="sumit" %>

<!DOCTYPE html>
<html>
<head>
    <title>Photographer Profile</title>

    <!-- jQuery + DatePicker -->
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

/* PROFILE + CALENDAR */

.profile-card {
    display:flex;
    justify-content:space-between;
    gap:30px;
}

.profile-left {
    display:flex;
    gap:30px;
    flex:1;
    align-items:center;
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

.profile-id {
    background:#f7f7f7;
    padding:8px 14px;
    border-radius:6px;
    display:inline-block;
    margin-top:10px;
}

/* DATE CARD */

.side-card {
    background:#fff0f5;
    padding:24px;
    width:260px;
    border-radius:20px;
    text-align:center;
}

.side-card input,
.side-card button {
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

/* BOOKED DATE */

.ui-datepicker td.booked a {
    background:#e53935 !important;
    color:white !important;
    border-radius:6px;
}

/* ===== GALLERY ===== */

.gallery {
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:25px;
    margin-top:25px;
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
    margin-top:45px;
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

/* RESPONSIVE */

@media(max-width:900px){
    .profile-card { flex-direction: column; }
    .gallery { grid-template-columns: repeat(2,1fr); }
    .video-row { grid-template-columns: 1fr; }
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

<form id="Form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container">

    <!-- PROFILE -->
    <div class="card profile-card">

        <div class="profile-left">
            <img src="image/sumit.jpeg" />

            <div class="profile-info">
                <h2>Sumit Chavan</h2>
                <p><strong>Photographer</strong></p>
                <p>📍 Pune, India</p>
                <p>Bridal & party photographer with 5+ years of experience.</p>
                <p><strong>Charges:</strong> ₹80,000</p>

                <div class="profile-id">
                    Instagram:
                    <a href="https://www.instagram.com/pratiksha_thorat/"
                       target="_blank"
                       style="color:#c2185b;font-weight:bold;text-decoration:none;">
                        @sumit_chavan_photography
                    </a>
                </div>
            </div>
        </div>

        <!-- CALENDAR -->
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
            <div class="image-card"><img src="image/sumit1.jpeg" /></div>
            <div class="image-card"><img src="image/sumit2.jpeg" /></div>
            <div class="image-card"><img src="image/sumit3.jpeg" /></div>
            <div class="image-card"><img src="image/sumit4.jpeg" /></div>
        </div>

        <div class="video-row">
            <div class="video-card">
                <video controls>
                    <source src="video/sumit1.mp4" type="video/mp4" />
                </video>
            </div>

            <div class="video-card">
                <video controls>
                    <source src="video/sumit2.mp4" type="video/mp4" />
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
        "2025-12-07",
        "2025-12-14",
        "2025-12-21",
        "2025-12-28"
    ];

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('yy-mm-dd', date);
                return [true, bookedDates.includes(d) ? "booked" : ""];
            },
            onSelect: function (dateText) {

                Swal.fire({
                    icon: bookedDates.includes(dateText) ? 'error' : 'success',
                    title: bookedDates.includes(dateText)
                    ? 'Photographer Busy'
                    : 'Photographer Available',
                    text: bookedDates.includes(dateText)
                    ? 'Artist is busy on selected date'
                    : 'Artist is available on selected date'
                });

            }
        });

    });

    /* IMAGE PREVIEW */

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