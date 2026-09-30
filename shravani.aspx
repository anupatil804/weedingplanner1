<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="shravani.aspx.cs"
    Inherits="shravani" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shravani Mehandi Artist Profile</title>

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body { font-family: Arial; background:#fff5f8; margin:0; }

        .navbar {
            width:100%;
            background:black;
            padding:12px 30px;
            display:flex;
            gap:30px;
        }
        .navbar a { color:white; text-decoration:none; }

        .container { width:92%; margin:40px auto; }

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

        .calendar-card {
            background:#fff0f5;
            padding:26px;
            width:280px;
            border-radius:22px;
            margin-left:auto;
        }

        /* UPDATED DATE INPUT */
        .calendar-card input,
        .select-btn {
            width:100%;
            height:45px;
            border-radius:10px;
        }

        .calendar-card input {
            border:1px solid #ccc;
            padding:0 12px;
            margin-bottom:15px;
        }

        .select-btn {
            background:#c2185b;
            color:white;
            border:none;
            font-weight:bold;
            cursor:pointer;
        }

    </style>
</head>

<body>

<div class="navbar">
    <a href="home.aspx">Home</a>
    <a href="wishlist.aspx">View Selected</a>
</div>

<form id="form1" runat="server">

<div class="container">

<div class="profile-card">

    <img src="image/m3.jpeg" />

    <div>
        <h2>Shravani Chavan</h2>
        <p>Mehandi Artist</p>
        <p>📍 Mumbai</p>
    </div>

    <div class="calendar-card">
        <h4>Select Date</h4>

        <!-- ✅ CHANGED HERE -->
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Button ID="btnSelect"
            runat="server"
            Text="Select Artist"
            CssClass="select-btn"
            OnClick="btnSelect_Click" />
    </div>

</div>

</div>

<script>
document.getElementById("<%= txtDate.ClientID %>").addEventListener("change", function () {

    let selectedDate = this.value;

    if (!selectedDate) return;

    Swal.fire({
        icon: 'success',
        title: 'Date Selected',
        text: selectedDate
    });

});
</script>

</form>
</body>
</html>