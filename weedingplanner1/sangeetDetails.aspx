<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sangeet Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #fff0f7, #f3e8ff);
            font-family: 'Segoe UI', sans-serif;
        }

        .sangeet-title {
            color: #7a2cbf;
            font-weight: 800;
        }

        .sangeet-img {
            height: 260px;
            object-fit: cover;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.18);
        }

        .info-card {
            border-radius: 22px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .highlight {
            color: #b5179e;
            font-weight: 600;
        }
    </style>
</head>
<body>

<form id="Form1" runat="server">

<div class="container py-5">

    <!-- Title -->
    <div class="text-center mb-5">
        <h1 class="sangeet-title">Sangeet Ceremony</h1>
        <p class="text-muted fs-5">A night of music, dance & joyful celebrations</p>
    </div>

    <!-- Images -->
    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <img src="Image/sangeet1.jpeg" class="img-fluid sangeet-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/sangeet2.jpeg" class="img-fluid sangeet-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/sangeet3.jpeg" class="img-fluid sangeet-img w-100" />
        </div>
    </div>

    <!-- Description -->
    <div class="card info-card p-4 mb-5">
        <div class="card-body">
            <h4 class="mb-3 highlight">About Sangeet Ceremony</h4>

            <p class="fs-6">
                The <strong>Sangeet ceremony</strong> is a lively celebration filled with
                music, dance, and happiness. Families come together to perform, sing,
                and celebrate the union of two hearts.
            </p>

            <ul class="fs-6">
                <li>Celebrated before the wedding day</li>
                <li>Features dance performances by family & friends</li>
                <li>Strengthens bonding between families</li>
                <li>Creates unforgettable joyful memories</li>
            </ul>
        </div>
    </div>

    <!-- Back Button -->
    <div class="text-center">
        <a href="ceremony.aspx" class="btn btn-primary btn-lg px-5">
            ← Back to Ceremonies
        </a>
    </div>

</div>

</form>

</body>
</html>
