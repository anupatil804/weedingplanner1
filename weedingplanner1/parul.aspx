<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="parul.aspx.cs"
    Inherits="parul" %>

<!DOCTYPE html>
<html>
<head>
    <title>Makeup Artist Profile</title>

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <style>
        body { font-family: Arial; background: #fff5f8; margin: 0; }
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
        .container { width: 92%; max-width: 1250px; margin: 40px auto; }
        .card { background: #fff; border-radius: 16px; box-shadow: 0 6px 18px rgba(0,0,0,0.14); padding: 30px; margin-bottom: 40px; }
        .profile-card { display: flex; justify-content: space-between; gap: 30px; }
        .profile-left { display: flex; gap: 25px; }
        .profile-left img { width: 180px; height: 180px; border-radius: 50%; object-fit: cover; }

        .side-card { background: #fdecef; padding: 26px 22px; width: 270px; border-radius: 26px; text-align: center; }
        .side-card h4 { font-size: 18px; font-weight: bold; margin-bottom: 18px; }
        .side-card input { width: 100%; height: 42px; padding: 8px 12px; border-radius: 14px; border: 1px solid #ccc; font-size: 14px; text-align: center; box-sizing: border-box; }
        .select-btn { margin-top: 16px; width: 100%; height: 46px; background: #c2185b; color: white; border: none; border-radius: 14px; font-size: 15px; font-weight: bold; cursor: pointer; }

        .ui-datepicker td.booked a { background: #e53935 !important; color: #fff !important; border-radius: 6px !important; }
        .ui-datepicker { border-radius: 16px; padding: 10px; }
        .ui-datepicker-header { background: #fdecef; border-radius: 12px; }

        .gallery { display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; }

        /* UPDATED IMAGE STYLE */
        .image-card img {
            width: 100%;
            height: 240px;
            object-fit: cover;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.3s;
        }

        .image-card img:hover {
            transform: scale(1.05);
        }

        .video-row { display: grid; grid-template-columns: repeat(2, 1fr); gap: 35px; margin-top: 40px; }
        .video-card video { width: 100%; height: 340px; border-radius:12px; }

        /* POPUP MODAL */
        .imgModal {
            display: none;
            position: fixed;
            z-index: 9999;
            padding-top: 60px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.85);
            text-align: center;
        }

        .imgModal img {
            max-width: 80%;
            max-height: 80%;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.5);
        }

        .closeModal {
            position: absolute;
            top: 25px;
            right: 40px;
            color: white;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
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

        <!-- PROFILE -->
        <div class="card profile-card">
            <div class="profile-left">
                <img src="image/parul.jpeg" />

                <div>
                    <h2>Parul Garg</h2>
                    <p><strong>Makeup Artist</strong></p>
                    <p>📍 Pune, India</p>
                    <p>Bridal & party makeup artist with 5+ years of experience.</p>
                    <p>Charges=80,000</p>

                    <p>
                        Instagram :
                        <a href="https://www.instagram.com/parulgargmakeup/"
                           target="_blank"
                           style="font-weight:bold;color:#c2185b;">
                            @parulgargmakeup
                        </a>
                    </p>
                </div>
            </div>

            <!-- DATE CARD -->
            <div class="side-card">
                <h4>Select Date</h4>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                <asp:Button ID="btnCheck" runat="server"
                    Text="Select Artist"
                    CssClass="select-btn"
                    OnClick="btnCheck_Click" />
            </div>
        </div>

        <!-- GALLERY -->
        <div class="card">
            <h3>Work Gallery</h3>
            <div class="gallery">
                <div class="image-card"><img src="image/paru1.jpeg" /></div>
                <div class="image-card"><img src="image/paru2.jpeg" /></div>
                <div class="image-card"><img src="image/paru3.jpeg" /></div>
                <div class="image-card"><img src="image/paru4.jpeg" /></div>
            </div>

            <div class="video-row">
                <div class="video-card"><video controls><source src="video/parul1.mp4" type="video/mp4" /></video></div>
                <div class="video-card"><video controls><source src="video/parul2.mp4" type="video/mp4" /></video></div>
            </div>
        </div>

    </div>

    <!-- IMAGE POPUP MODAL -->
    <div id="imgModal" class="imgModal">
        <span class="closeModal">&times;</span>
        <img id="modalImg" />
    </div>

<script>
    $(function () {

        var bookedDates = ["2025-12-08", "2025-12-10", "2025-12-15", "2025-12-20"];

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

        // IMAGE CLICK POPUP
        $(".image-card img").click(function () {
            $("#modalImg").attr("src", $(this).attr("src"));
            $("#imgModal").fadeIn();
        });

        $(".closeModal, #imgModal").click(function () {
            $("#imgModal").fadeOut();
        });

    });
</script>

</form>
</body>
</html>