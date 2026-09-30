<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mini.aspx.cs" Inherits="mini" %>

<!DOCTYPE html>
<html>
<head>
    <title>Mini Maharashtra Caterers Profile</title>

    <!-- jQuery + UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body { font-family: Arial; background: #fff5f8; margin: 0; }

/* NAVBAR */
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

/* PROFILE */
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

/* SIDE CARD */
.side-card {
    background:#fff0f5;
    padding:26px;
    width:280px;
    border-radius:22px;
    text-align:center;
    margin-left:auto;
}

.select-btn {
    width:100%;
    padding:12px;
    background:#c2185b;
    color:white;
    border:none;
    border-radius:8px;
    font-weight:bold;
    cursor:pointer;
}

/* DATE BOOKED */
.ui-datepicker td.booked a{
    background:#e53935 !important;
    color:white !important;
    border-radius:6px;
}

/* ===== CALENDAR UI IMPROVEMENT (ONLY THIS ADDED) ===== */

/* reduce gap */
.ui-datepicker table {
    border-collapse: separate;
    border-spacing: 4px;
}

/* equal square boxes */
.ui-datepicker td a {
    display:flex;
    align-items:center;
    justify-content:center;

    width:36px;
    height:36px;

    margin:0 auto;
    padding:0;

    border-radius:8px;
    font-size:14px;
}

/* header days */
.ui-datepicker th {
    padding:5px 0;
    font-size:12px;
}

/* hover */
.ui-datepicker td a:hover {
    background:#f8bbd0;
    color:#c2185b !important;
}

/* selected */
.ui-datepicker .ui-state-active {
    background:#c2185b !important;
    color:white !important;
}

/* GALLERY */
.gallery { display:grid; grid-template-columns:repeat(4,1fr); gap:25px; margin-top:25px; }

.image-card img{
    width:100%;
    height:220px;
    object-fit:cover;
    border-radius:14px;
    box-shadow:0 4px 12px rgba(0,0,0,0.2);
    cursor:pointer;
}

/* VIDEO */
.video-row { display:grid; grid-template-columns:repeat(2, 1fr); gap:30px; margin-top:40px; }
video { width:100%; height:320px; border-radius:16px; background:#000; }

/* IMAGE POPUP */
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

<form id="form1" runat="server">

<div class="container">

<div class="profile-card">

    <img src="image/cat3.jpeg" />

    <div>
        <h2>Mini Maharashtra Caterers</h2>
        <p><strong>Caterers</strong></p>
        <p>📍 Kolhapur, India</p>
        <p>Bridal & party catering services.</p>
        <p>Charges: ₹60,000</p>
    </div>

    <div class="side-card">

        <h4>Select Date</h4>

        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

        <asp:Button ID="btnSelect"
            runat="server"
            Text="Add to Wishlist"
            CssClass="select-btn"
            OnClick="btnSelect_Click" />

    </div>

</div>

<!-- GALLERY -->
<div class="gallery">

    <div class="image-card">
        <img src="image/mini1.jpeg" class="popupImg"/>
    </div>

    <div class="image-card">
        <img src="image/mini2.jpeg" class="popupImg"/>
    </div>

    <div class="image-card">
        <img src="image/mini3.jpeg" class="popupImg"/>
    </div>

    <div class="image-card">
        <img src="image/mini4.jpeg" class="popupImg"/>
    </div>

</div>

<!-- VIDEOS -->
<div class="video-row">
    <video controls><source src="video/mini1.mp4" type="video/mp4"/></video>
    <video controls><source src="video/mini2.mp4" type="video/mp4"/></video>
</div>

</div>

<!-- IMAGE POPUP -->
<div class="img-popup" id="imgPopup">
    <span class="close" onclick="closePopup()">×</span>
    <img id="popupImg"/>
</div>

<script>

    $(function () {

        var bookedDates = ["04-12-2025", "12-12-2025"];

        $("#<%= txtDate.ClientID %>").datepicker({

            dateFormat: "dd-mm-yy",

            beforeShowDay: function (date) {

                var d = $.datepicker.formatDate('dd-mm-yy', date);

                return [true, bookedDates.includes(d) ? "booked" : ""];

            },

            onSelect: function (dateText) {

                Swal.fire({
                    icon: bookedDates.includes(dateText) ? 'error' : 'success',
                    title: bookedDates.includes(dateText) ? 'Caterer Busy' : 'Caterer Available',
                    text: bookedDates.includes(dateText)
                    ? 'Caterer is busy on selected date'
                    : 'Caterer is available on selected date'
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