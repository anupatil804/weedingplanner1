<%@ Page Language="C#" AutoEventWireup="true" CodeFile="elite.aspx.cs" Inherits="elite" %>

<!DOCTYPE html>
<html>
<head>
    <title>Caterers Profile</title>

    <!-- jQuery + jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body { font-family: Arial; background: #fff5f8; margin:0; }
.navbar { width:100%; background:black; padding:12px 30px; display:flex; align-items:center; gap:30px; }
.navbar a { color:white; text-decoration:none; font-size:16px; }
.navbar img { height:35px; }

.container { width:92%; max-width:1250px; margin:40px auto; }

.profile-card {
    display:flex; gap:30px;
    background:#fff; padding:25px;
    border-radius:20px;
    box-shadow:0 6px 20px rgba(0,0,0,0.15);
}

.profile-card img {
    width:180px; height:180px;
    border-radius:50%; object-fit:cover;
}

.side-card {
    background:#fff0f5;
    padding:26px;
    width:280px;
    border-radius:22px;
    text-align:center;
    margin-left:auto;
}

.side-card input,
.select-btn {
    width:100%;
    height:42px;
    border-radius:12px;
}

.select-btn {
    background:#c2185b;
    color:#fff;
    font-weight:bold;
    border:none;
    cursor:pointer;
}

/* BOOKED COLOR */
.ui-datepicker td.booked a {
    background:#e53935 !important;
    color:#fff !important;
    border-radius:6px !important;
}

.gallery { display:grid; grid-template-columns:repeat(4,1fr); gap:25px; margin-top:25px; }
.image-card img { width:100%; height:220px; object-fit:cover; border-radius:14px; }

.video-row { display:grid; grid-template-columns:repeat(2,1fr); gap:30px; margin-top:40px; }
video { width:100%; height:320px; border-radius:16px; }

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

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<div class="container">

<div class="profile-card">

    <img src="image/cat1.jpeg" />

    <div>
        <h2>Elite Stuff Catering</h2>
        <p><strong>Caterers</strong></p>
        <p>📍 Sangli, India</p>
        <p>Bridal & party catering services.</p>
        <p><b>Charges = ₹40,000</b></p>
    </div>

    <div class="side-card">
        <h4>Select Date</h4>

        <asp:TextBox ID="txtDate" runat="server" />

        <asp:Button ID="btnSelect"
            runat="server"
            Text="Select Artist"
            CssClass="select-btn"
            OnClick="btnSelect_Click" />
    </div>

</div>

<!-- GALLERY -->
<div class="gallery">
    <div class="image-card"><img src="image/elite1.jpeg" /></div>
    <div class="image-card"><img src="image/elite2.jpeg" /></div>
    <div class="image-card"><img src="image/elite3.jpeg" /></div>
    <div class="image-card"><img src="image/elite4.jpeg" /></div>
</div>

<!-- VIDEOS -->
<div class="video-row">
    <video controls><source src="video/elitev1.mp4" type="video/mp4" /></video>
    <video controls><source src="video/elitev2.mp4" type="video/mp4" /></video>
</div>

</div>

<script>

    $(function () {

        var bookedDates = [
        "05-12-2025", "12-12-2025", "18-12-2025"
    ];

        $("#<%= txtDate.ClientID %>").datepicker({

            dateFormat: "dd-mm-yy",

            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('dd-mm-yy', date);
                return [true, bookedDates.includes(d) ? "booked" : ""];
            },

            onSelect: function (dateText) {

                if (bookedDates.includes(dateText)) {

                    Swal.fire({
                        icon: 'error',
                        title: 'Caterer Busy',
                        text: 'Caterer is busy on selected date'
                    });

                } else {

                    Swal.fire({
                        icon: 'success',
                        title: 'Available',
                        text: 'Caterer is available on selected date'
                    });

                }
            }

        });

    });

</script>

</form>
</body>
</html>