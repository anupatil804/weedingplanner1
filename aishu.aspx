<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="aishu.aspx.cs"
    Inherits="aishu" %>

<!DOCTYPE html>
<html>
<head>
    <title>Aishu Mehandi Artist Profile</title>

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
    gap:30px;
}
.navbar a { color:white; text-decoration:none; }
.navbar img { height:35px; }

.container { width:92%; max-width:1250px; margin:40px auto; }

/* PROFILE */
.profile-card {
    display:flex;
    gap:30px;
    background:#fff;
    padding:25px;
    border-radius:20px;
    box-shadow:0 6px 20px rgba(0,0,0,0.15);
    flex-wrap:wrap;
}
.profile-card img {
    width:180px;
    height:180px;
    border-radius:50%;
}

/* SIDE CARD */
.side-card {
    background:#fff0f5;
    padding:26px;
    width:280px;
    border-radius:22px;
    margin-left:auto;
    text-align:center;
}

/* INPUT + BUTTON SAME SIZE */
.side-card input,
.side-card .select-btn {
    width:100%;
    height:45px;
    border-radius:10px;
}

.side-card input {
    padding:0 12px;
    margin-bottom:12px;
    border:1px solid #ccc;
    cursor:pointer;
}

.select-btn {
    background:#c2185b;
    color:white;
    border:none;
    font-weight:bold;
    cursor:pointer;
}

/* ===== UPDATED CALENDAR UI ===== */
.ui-datepicker {
    width:260px !important;
    padding:10px;
    background:#ffffff;
    border-radius:14px;
    border:none;
    box-shadow:0 8px 25px rgba(0,0,0,0.2);
    font-size:13px;
}

/* HEADER */
.ui-datepicker-header {
    background:none;
    border:none;
    text-align:center;
    font-weight:bold;
    margin-bottom:5px;
}

/* TABLE */
.ui-datepicker table {
    width:100%;
    border-collapse:separate;
    border-spacing:3px;
}

/* DAY NAMES */
.ui-datepicker th {
    font-size:12px;
    color:#777;
}

/* DATE BOX */
.ui-datepicker td {
    width:32px;
    height:32px;
    padding:0 !important;
}

.ui-datepicker td a {
    display:flex !important;
    align-items:center;
    justify-content:center;
    width:32px;
    height:32px;
    border-radius:8px;
}

/* HOVER */
.ui-datepicker td a:hover {
    background:#c2185b;
    color:white !important;
}

/* SELECTED */
.ui-datepicker .ui-state-active {
    background:#c2185b !important;
    color:white !important;
}

/* TODAY */
.ui-datepicker .ui-state-highlight {
    background:#ffe4ec !important;
}

/* BOOKED */
.ui-datepicker td.booked a {
    background:#e53935 !important;
    color:white !important;
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
}

/* VIDEO */
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
}

/* POPUP */
#imgPreview {
    display:none;
    position:fixed;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.85);
    justify-content:center;
    align-items:center;
}
#imgPreview img { max-width:90%; }
#imgPreview span {
    position:absolute;
    top:30px;
    right:40px;
    color:white;
    font-size:30px;
    cursor:pointer;
}
</style>
</head>

<body>

<div class="navbar">
    <img src="image/logo.png" />
    <a href="home.aspx">Home</a>
    <a href="about.aspx">About</a>
    <a href="services.aspx">Services</a>
    <a href="wishlist.aspx">View Selected</a>
</div>

<form id="form1" runat="server">

<div class="container">

<div class="profile-card">

    <img src="image/m4.jpeg" />

    <div>
        <h2>Aishu Patil</h2>
        <p>Mehandi Artist</p>
        <p>📍 Satara</p>
        <p>Charges ₹15,500</p>
    </div>

    <div class="side-card">
        <h4>Select Date</h4>

        <asp:TextBox ID="txtDate" runat="server" ReadOnly="true"></asp:TextBox>

        <asp:Button ID="btnSelect"
            runat="server"
            Text="Add to Wishlist"
            CssClass="select-btn"
            OnClick="btnSelect_Click" />
    </div>

</div>

<div class="gallery">
    <div class="image-card"><img src="image/aishu1.jpeg" /></div>
    <div class="image-card"><img src="image/aishu2.jpeg" /></div>
    <div class="image-card"><img src="image/aishu3.jpeg" /></div>
    <div class="image-card"><img src="image/aishu4.jpeg" /></div>
</div>

<div class="video-row">
    <video controls><source src="video/aishuv1.mp4" /></video>
    <video controls><source src="video/aishuv2.mp4" /></video>
</div>

</div>

<div id="imgPreview">
    <span onclick="closePreview()">✖</span>
    <img id="previewImg" />
</div>

<script>
    $(function () {

        var bookedDates = ["2026-01-04", "2026-01-10", "2026-01-18", "2026-01-25"];

        $("#<%= txtDate.ClientID %>").datepicker({

            dateFormat: "yy-mm-dd",

            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('yy-mm-dd', date);
                return [true, bookedDates.includes(d) ? "booked" : ""];
            },

            onSelect: function (dateText) {

                if (bookedDates.includes(dateText)) {
                    Swal.fire('Artist Busy', 'Date not available', 'error');
                } else {
                    Swal.fire('Added', 'Date added to wishlist', 'success');

                    // AUTO CLICK
                    document.getElementById("<%= btnSelect.ClientID %>").click();
                }
            }
        });

        $(".gallery img").click(function () {
            $("#previewImg").attr("src", $(this).attr("src"));
            $("#imgPreview").css("display", "flex");
        });

    });

    function closePreview() {
        $("#imgPreview").hide();
    }
</script>

</form>
</body>
</html>