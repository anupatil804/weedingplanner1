<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Haldi Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #fff7e6, #fff3d6);
            font-family: 'Segoe UI', sans-serif;
        }

        .haldi-title {
            color: #c47a00;
            font-weight: 800;
        }

        .haldi-img {
            height: 260px;
            object-fit: cover;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .info-card {
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .highlight {
            color: #d48806;
            font-weight: 600;
        }
    </style>
</head>
<body>

<form id="Form1" runat="server">

<div class="container py-5">

    <!-- Title -->
    <div class="text-center mb-5">
        <h1 class="haldi-title">Haldi Ceremony</h1>
        <p class="text-muted fs-5">A sacred ritual filled with joy, turmeric & blessings</p>
    </div>

    <!-- Images -->
    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <img src="image/Haladi1.jpeg" class="img-fluid haldi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="image/Haladi2.jpeg" class="img-fluid haldi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="image/Haladi3.jpeg" class="img-fluid haldi-img w-100" />
        </div>
    </div>

    <!-- Description Card -->
    <div class="card info-card p-4 mb-5">
        <div class="card-body">
            <h4 class="mb-3 highlight">About Haldi Ceremony</h4>
            <p class="fs-6">
                The <strong>Haldi ceremony</strong> is one of the most joyful and colorful
                pre-wedding rituals in Indian weddings. Turmeric paste is applied to the
                bride and groom to bring <span class="highlight">glow, purity, and positivity</span>
                before the wedding.
            </p>

            <ul class="fs-6">
                <li>Held one day before the wedding</li>
                <li>Symbolizes purification & blessings</li>
                <li>Filled with laughter, music & yellow décor</li>
                <li>Brings good luck and prosperity</li>
            </ul>
        </div>
    </div>

    <!-- Back Button -->
    <div class="text-center">
        <a href="ceremony.aspx" class="btn btn-warning btn-lg px-5">
            ← Back to Ceremonies
        </a>
    </div>

</div>

</form>

</body>
</html>
