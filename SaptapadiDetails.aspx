<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Saptapadi Ceremony</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #fff5f0, #ffe8ec);
            font-family: 'Segoe UI', sans-serif;
        }

        .saptapadi-title {
            color: #9d0208;
            font-weight: 800;
        }

        .saptapadi-img {
            height: 260px;
            object-fit: cover;
            border-radius: 22px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        }

        .info-card {
            border-radius: 22px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .step-box {
            background: #fff;
            border-left: 6px solid #9d0208;
            padding: 15px;
            margin-bottom: 12px;
            border-radius: 12px;
        }

        .step-number {
            font-weight: 700;
            color: #9d0208;
        }
    </style>
</head>
<body>

<form id="Form1" runat="server">

<div class="container py-5">

    <!-- Title -->
    <div class="text-center mb-5">
        <h1 class="saptapadi-title">Saptapadi Ceremony</h1>
        <p class="text-muted fs-5">
            The seven sacred steps that bind two souls forever
        </p>
    </div>

    <!-- Images -->
    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <img src="Image/saptpadi1.jpeg" class="img-fluid saptapadi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/saptpadi2.jpeg" class="img-fluid saptapadi-img w-100" />
        </div>
        <div class="col-md-4 mb-4">
            <img src="Image/saptpadi3.jpeg" class="img-fluid saptapadi-img w-100" />
        </div>
    </div>

    <!-- Description -->
    <div class="card info-card p-4 mb-5">
        <div class="card-body">
            <h4 class="mb-3 text-danger fw-bold">About Saptapadi</h4>

            <p class="fs-6">
                <strong>Saptapadi</strong> is the most important ritual in a Hindu wedding.
                The bride and groom take <strong>seven sacred steps</strong> around the holy fire,
                each step representing a vow they make to each other.
            </p>

            <div class="mt-4">
                <div class="step-box">
                    <span class="step-number">1.</span> Promise of nourishment & prosperity
                </div>
                <div class="step-box">
                    <span class="step-number">2.</span> Promise of strength & health
                </div>
                <div class="step-box">
                    <span class="step-number">3.</span> Promise of wealth & growth
                </div>
                <div class="step-box">
                    <span class="step-number">4.</span> Promise of happiness & harmony
                </div>
                <div class="step-box">
                    <span class="step-number">5.</span> Promise of family & children
                </div>
                <div class="step-box">
                    <span class="step-number">6.</span> Promise of lifelong companionship
                </div>
                <div class="step-box">
                    <span class="step-number">7.</span> Promise of friendship & loyalty
                </div>
            </div>

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
