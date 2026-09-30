<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="omkara.aspx.cs"
    Inherits="omkara" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>Omkara Caterers</title>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#fff5f8;
}

/* NAVBAR */

.navbar{
    background:black;
    height:60px;
    display:flex;
    align-items:center;
    padding:0 20px;
    gap:30px;
}

.logo{
    height:45px;
    width:45px;
}

.nav-menu{
    display:flex;
    gap:28px;
}

.nav-menu a{
    color:white;
    text-decoration:none;
}

/* CONTAINER */

.container{
    width:92%;
    max-width:1250px;
    margin:30px auto;
}

/* CARD */

.card{
    background:white;
    border-radius:16px;
    box-shadow:0 6px 18px rgba(0,0,0,0.14);
    padding:30px;
    margin-bottom:40px;
}

/* PROFILE */

.profile-card{
    display:flex;
    justify-content:space-between;
    gap:30px;
}

.profile-left{
    display:flex;
    gap:25px;
}

.profile-left img{
    width:180px;
    height:180px;
    border-radius:50%;
    object-fit:cover;
}

/* DATE CARD */

.side-card{
    background:#fdecef;
    padding:22px 18px;
    width:280px;
    border-radius:22px;
    text-align:center;
}

.side-card input,
.side-card button{
    width:100%;
    height:36px;
    font-size:14px;
    border-radius:10px;
}

.side-card input{
    border:1px solid #ccc;
    padding:0 10px;
    margin-bottom:10px;
}

.select-btn{
    background:#c2185b;
    color:white;
    border:none;
    font-weight:bold;
}

/* DATE BOOKED */

.ui-datepicker td.booked a{
    background:#e53935 !important;
    color:#fff !important;
    border-radius:6px !important;
}

/* GALLERY */

.gallery{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:30px;
}

.image-card{
    background:#fafafa;
    border-radius:14px;
    padding:10px;
    box-shadow:0 4px 14px rgba(0,0,0,0.12);
    cursor:pointer;
    transition:0.3s;
}

.image-card:hover{
    transform:scale(1.05);
}

.image-card img{
    width:100%;
    border-radius:12px;
}

/* VIDEO */

.video-row{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:35px;
    margin-top:40px;
}

.video-card video{
    width:100%;
    height:340px;
    border-radius:12px;
}

/* IMAGE POPUP */

.img-popup{
    display:none;
    position:fixed;
    z-index:9999;
    left:0;
    top:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.85);
    justify-content:center;
    align-items:center;
}

.img-popup img{
    max-width:85%;
    max-height:85%;
    border-radius:12px;
}

.close-btn{
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

<form id="form1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server" />

<!-- NAVBAR -->

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

<div class="container">

<!-- PROFILE -->

<div class="card profile-card">

<div class="profile-left">

<img src="image/cat5.jpeg" />

<div>
<h2>Omkara Caterers</h2>
<p><strong>Caterers</strong></p>
<p>📍 Pune, India</p>
<p>Professional wedding catering services.</p>
<p><b>Charges = ₹45,000</b></p>

<p>
Instagram :
<a href="#" style="font-weight:bold;color:#c2185b;">
@omkara_caterers
</a>
</p>

</div>

</div>

<div class="side-card">

<h4>Select Date</h4>

<asp:TextBox ID="txtDate" runat="server" />

<asp:Button ID="btnSelect"
runat="server"
Text="Add to Wishlist"
CssClass="select-btn"
OnClick="btnSelect_Click" />

</div>

</div>

<!-- GALLERY -->

<div class="card">

<h3>Work Gallery</h3>

<div class="gallery">
<div class="image-card"><img src="image/om1.jpeg" /></div>
<div class="image-card"><img src="image/om2.jpeg" /></div>
<div class="image-card"><img src="image/om3.jpeg" /></div>
<div class="image-card"><img src="image/om4.jpeg" /></div>
</div>

<div class="video-row">

<div class="video-card">
<video controls>
<source src="video/omv1.mp4" type="video/mp4" />
</video>
</div>

<div class="video-card">
<video controls>
<source src="video/omv2.mp4" type="video/mp4" />
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

        var bookedDates = [
"04-12-2025",
"10-12-2025",
"20-12-2025"
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


    $(".image-card img").click(function () {
        var src = $(this).attr("src");
        $("#popupImg").attr("src", src);
        $("#imgPopup").css("display", "flex");
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