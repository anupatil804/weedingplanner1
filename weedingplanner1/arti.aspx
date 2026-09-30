<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="arti.aspx.cs"
    Inherits="arti" %>

<!DOCTYPE html>
<html>
<head>
    <title>Makeup Artist Profile</title>

    <!-- jQuery & DatePicker -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body { font-family: Arial; background:#fff5f8; margin:0; }
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
        .container { width:92%; max-width:1250px; margin:40px auto; }

        .card { background:#fff; border-radius:16px; box-shadow:0 6px 18px rgba(0,0,0,0.14); padding:30px; margin-bottom:40px; }
        .profile-card { display:flex; justify-content:space-between; gap:30px; }
        .profile-left { display:flex; gap:25px; align-items:center; }
        .profile-left img { width:160px; height:160px; border-radius:50%; object-fit:cover; border:4px solid #eee; }
        .profile-info h2 { margin:0; }
        .profile-info p { margin:6px 0; }
        .profile-id { background:#f7f7f7; display:inline-block; padding:6px 12px; border-radius:6px; font-size:14px; margin-top:8px; }

        /* Calendar UI */
        .side-card { background:#fdecef; padding:26px 22px; width:270px; border-radius:26px; text-align:center; }
        .side-card h4 { font-size:18px; font-weight:bold; margin-bottom:18px; }
        .side-card input { width:100%; height:42px; padding:8px 12px; border-radius:14px; border:1px solid #ccc; font-size:14px; text-align:center; box-sizing:border-box; }
        .select-btn { margin-top:16px; width:100%; height:46px; background:#c2185b; color:#fff; border:none; border-radius:14px; font-size:15px; font-weight:bold; cursor:pointer; }

        /* Booked date style */
        .ui-datepicker td.booked a { background:#e53935 !important; color:#fff !important; border-radius:6px !important; }
        .ui-datepicker { border-radius:16px; padding:10px; }
        .ui-datepicker-header { background:#fdecef; border-radius:12px; }

        /* ===== FIXED GALLERY ===== */
        .gallery { display:grid; grid-template-columns:repeat(4,1fr); gap:25px; margin-top:20px; }

        .image-card {
            width:100%;
            height:230px;
            border-radius:14px;
            overflow:hidden;
            background:#f3f3f3;
            display:flex;
            align-items:center;
            justify-content:center;
        }

        .image-card img {
            width:100%;
            height:100%;
            object-fit:cover;
            border-radius:14px;
            cursor:pointer;
            transition:0.3s;
        }

        .image-card img:hover {
            transform:scale(1.05);
        }

        /* Video */
        .video-row { display:grid; grid-template-columns:repeat(2,1fr); gap:30px; margin-top:35px; }

        .video-card video {
            width:100%;
            height:300px;
            object-fit:cover;
            border-radius:14px;
        }

        /* ===== POPUP MODAL ===== */
        .imgModal {
            display:none;
            position:fixed;
            z-index:9999;
            padding-top:60px;
            left:0;
            top:0;
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.85);
        }

        .imgModal img {
            margin:auto;
            display:block;
            max-width:80%;
            max-height:80%;
            border-radius:10px;
            animation:zoom 0.3s;
        }

        @keyframes zoom {
            from {transform:scale(0.7);}
            to {transform:scale(1);}
        }

        .closeBtn {
            position:absolute;
            top:20px;
            right:35px;
            color:#fff;
            font-size:40px;
            cursor:pointer;
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

    <!-- PROFILE + DATE CARD -->
    <div class="card profile-card">

        <div class="profile-left">
            <img src="image/arti.jpeg" />
            <div class="profile-info">
                <h2>Arti Nayar</h2>
                <p><strong>Makeup Artist</strong></p>
                <p>📍 Mumbai, India</p>
                <p>Bridal & party makeup artist with 5+ years of experience.</p>
                <p>Charges=55,000</p>

                <div class="profile-id">
                    Instagram:
                    <a href="https://www.instagram.com/arti_nayar_makeup/"
                       target="_blank"
                       style="font-weight:bold;color:#c2185b;text-decoration:none;">
                        @arti_nayar_makeup
                    </a>
                </div>
            </div>
        </div>

        <!-- CALENDAR -->
        <div class="side-card">
            <h4>Select Date</h4>
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            <asp:Button ID="btnSelect" runat="server"
                Text="Select Artist"
                CssClass="select-btn"
                OnClick="btnSelect_Click" />
        </div>
    </div>

    <!-- GALLERY + VIDEOS -->
    <div class="card">
        <h3>Work Gallery</h3>

        <div class="gallery">
            <div class="image-card"><img src="image/nayer1.jpeg" class="popupImg" /></div>
            <div class="image-card"><img src="image/nayer2.jpeg" class="popupImg" /></div>
            <div class="image-card"><img src="image/nayer3.jpeg" class="popupImg" /></div>
            <div class="image-card"><img src="image/nayer4.jpeg" class="popupImg" /></div>
        </div>

        <div class="video-row">
            <div class="video-card">
                <video controls>
                    <source src="video/nayer1.mp4" type="video/mp4" />
                </video>
            </div>

            <div class="video-card">
                <video controls>
                    <source src="video/nayer2.mp4" type="video/mp4" />
                </video>
            </div>
        </div>
    </div>

</div>

<!-- IMAGE POPUP MODAL -->
<div id="imgModal" class="imgModal">
    <span class="closeBtn">&times;</span>
    <img id="modalImg" />
</div>

<script>
    $(function () {

        var bookedDates = ["2025-12-05", "2025-12-10", "2025-12-18", "2025-12-25"];

        $("#<%= txtDate.ClientID %>").datepicker({
            dateFormat: "yy-mm-dd",
            beforeShowDay: function (date) {
                var d = $.datepicker.formatDate('yy-mm-dd', date);
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

        // ===== IMAGE POPUP =====
        $(".popupImg").click(function () {
            $("#imgModal").fadeIn();
            $("#modalImg").attr("src", $(this).attr("src"));
        });

        $(".closeBtn, #imgModal").click(function () {
            $("#imgModal").fadeOut();
        });

    });
</script>

</form>
</body>
</html>