<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Mehendi Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #f1fff3, #e9ffe6);
            font-family: 'Segoe UI', sans-serif;
        }

        .mehendi-title {
            color: #2f8f46;
            font-weight: 800;
        }

        .mehendi-img {
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
            color: #3aa35d;
            font-weight: 600;
        }
    </style>
</head>
<body>

<form id="Form1" runat="server">

<div class="container py-5">

    <!-- Title -->
    <div class="text-center mb-5">
        <h1 class="mehendi-title">Mehendi Ceremony</h1>
        <p class="text-muted fs-5">Celebration of love, art & vibrant traditions</p>
    </div>

    <!-- Images -->
    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <img src="Image/mehendi1.jpeg" class="img-fluid mehendi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/mehendi2.jpeg" class="img-fluid mehendi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/mehendi3.jpeg" class="img-fluid mehendi-img w-100" />
        </div>
    </div>

    <!-- Description -->
    <div class="card info-card p-4 mb-5">
        <div class="card-body">
            <h4 class="mb-3 highlight">About Mehendi Ceremony</h4>

            <p class="fs-6">
                The <strong>Mehendi ceremony</strong> is a joyful pre-wedding celebration
                where intricate henna designs are applied on the bride’s hands and feet.
                It symbolizes <span class="highlight">love, beauty, and prosperity</span>.
            </p>

            <ul class="fs-6">
                <li>Held 1–2 days before the wedding</li>
                <li>Signifies strength of love & bond</li>
                <li>Filled with music, dance & laughter</li>
                <li>Green décor represents growth & harmony</li>
            </ul>
        </div>
    </div>

    <!-- Back Button -->
    <div class="text-center">
        <a href="ceremony.aspx" class="btn btn-success btn-lg px-5">
            ← Back to Ceremonies
        </a>
    </div>

</div>

</form>

</body>
</html>
