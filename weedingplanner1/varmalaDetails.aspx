<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Varmala Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #fff1eb, #fde2e4);
            font-family: 'Segoe UI', sans-serif;
        }

        .varmala-title {
            color: #b23a48;
            font-weight: 800;
        }

        .varmala-img {
            height: 260px;
            object-fit: cover;
            border-radius: 22px;
            box-shadow: 0 14px 35px rgba(0,0,0,0.2);
        }

        .info-card {
            border-radius: 22px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .highlight {
            color: #9d0208;
            font-weight: 600;
        }
    </style>
</head>
<body>

<form id="Form1" runat="server">

<div class="container py-5">

    <!-- Title -->
    <div class="text-center mb-5">
        <h1 class="varmala-title">Varmala Ceremony</h1>
        <p class="text-muted fs-5">
            The sacred exchange of garlands marking the union of two souls
        </p>
    </div>

    <!-- Images -->
    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <img src="Image/varmala1.jpeg" class="img-fluid varmala-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/varmala2.jpeg" class="img-fluid varmala-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/varmala3.jpeg" class="img-fluid varmala-img w-100" />
        </div>
    </div>

    <!-- Description -->
    <div class="card info-card p-4 mb-5">
        <div class="card-body">
            <h4 class="mb-3 highlight">About Varmala Ceremony</h4>

            <p class="fs-6">
                The <strong>Varmala ceremony</strong> is a beautiful ritual where
                the bride and groom exchange flower garlands, symbolizing mutual
                acceptance and respect for each other.
            </p>

            <ul class="fs-6">
                <li>Represents love, respect & togetherness</li>
                <li>Marks the beginning of wedding rituals</li>
                <li>Performed on a decorated stage (mandap)</li>
                <li>A joyful and emotional moment for families</li>
            </ul>
        </div>
    </div>

    <!-- Back Button -->
    <div class="text-center">
        <a href="ceremony.aspx" class="btn btn-danger btn-lg px-5">
            ← Back to Ceremonies
        </a>
    </div>

</div>

</form>

</body>
</html>
