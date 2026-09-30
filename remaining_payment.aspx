<%@ Page Language="C#" AutoEventWireup="true" CodeFile="remaining_payment.aspx.cs" Inherits="remaining_payment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Remaining Payment | Wedding Planner</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #fff5f8, #fff);
            font-family: 'Poppins', sans-serif;
            padding-top: 80px;
        }

        .navbar {
            background: #000 !important;
            height: 60px;
            padding: 5px 15px;
        }

        .navbar-brand img {
            height: 40px;
        }

        .nav-link {
            color: white !important;
            font-size: 15px;
            margin-left: 15px;
        }

        .nav-link:hover {
            color: #ffcc00 !important;
        }

        .ml-3 {
            margin-left: 1rem !important;
        }

        .payment-card {
            max-width: 520px;
            margin: auto;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }

        .upi-box {
            border: 2px dashed #d63384;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            background: #fff;
        }

        /* ===== PROFESSIONAL LOADING SPINNER ===== */
        .loader-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.85);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
        }

        .spinner {
            width: 70px;
            height: 70px;
            border: 6px solid #ffd6eb;
            border-top: 6px solid #d63384;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading-text {
            margin-top: 15px;
            font-weight: 600;
            color: #d63384;
            font-size: 18px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<!-- ===== LOADER ===== -->
<div id="loader" class="loader-overlay">
    <div class="spinner"></div>
    <div class="loading-text">Processing Payment...</div>
</div>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">

    <a class="navbar-brand" href="Home.aspx">
        <img src="image/logo.png" alt="Logo" />
    </a>

    <button class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation">

        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-3">

            <li class="nav-item">
                <a class="nav-link" href="Home.aspx">Home</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="AboutUs.aspx">About</a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="Services.aspx">Services</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="showweedingTypes.aspx">WeedingType</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="venue.aspx">Venues</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="ceremony.aspx">Ceremonye's</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="wishlist.aspx">View selected</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="Feedback.aspx">Feedback</a>
            </li>

        </ul>
    </div>
</nav>

<div class="container mt-5">
    <div class="card payment-card p-4">

        <h3 class="text-center text-danger mb-4">Remaining Payment</h3>

        <p><b>Total Amount:</b> ₹ <asp:Label ID="lblTotal" runat="server" /></p>

        <p class="text-success">
            <b>Advance Paid:</b> ₹ <asp:Label ID="lblPaid" runat="server" />
        </p>

        <p class="fs-5 text-danger">
            <b>Remaining Amount:</b> ₹ <asp:Label ID="lblRemaining" runat="server" />
        </p>

        <hr />

        <h5 class="text-center mb-3">Pay Remaining via UPI</h5>

        <div class="upi-box mb-4">
            <img src="image/upi.jpg" width="200" /><br /><br />
            <b>UPI ID:</b> weddingplanner@upi
        </div>

        <div class="text-center">
            <asp:Button ID="btnPayRemaining"
                runat="server"
                Text="I Have Paid Remaining Amount"
                CssClass="btn btn-success btn-lg px-4"
                OnClick="btnPayRemaining_Click"
                OnClientClick="return showLoader();" />
        </div>

    </div>
</div>

<!-- SUCCESS MODAL -->
<div class="modal fade" id="successModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content text-center p-4">
            <div class="modal-body">
                <h4 class="text-success mb-3">Payment Successful 🎉</h4>
                <p>Your wedding is <b>fully confirmed</b>.</p>
                <button class="btn btn-success mt-3" onclick="goHome()">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

    function showLoader() {

        document.getElementById("loader").style.display = "flex";

        setTimeout(function () {
            __doPostBack('<%= btnPayRemaining.UniqueID %>', '');
        }, 3000);

        return false;
    }

    function showSuccess() {
        var modal = new bootstrap.Modal(document.getElementById('successModal'));
        modal.show();
    }

    function goHome() {
        window.location = "Home.aspx";
    }

</script>

</form>
</body>
</html>