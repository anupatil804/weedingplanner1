<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Booking Confirmed</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #fff5f8, #fefefe);
        }
        .success-box {
            max-width: 600px;
            margin: 120px auto;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
        }
        .success-icon {
            font-size: 70px;
            color: #28a745;
        }
    </style>
</head>

<body>

<div class="success-box">
    <div class="success-icon">✔</div>
    <h2 class="mt-3 text-success">Payment Successful</h2>

    <p class="mt-3">
        Your <b>wedding booking is confirmed</b> 🎉 <br />
        We have received your advance payment successfully.
    </p>

    <a href="Home.aspx" class="btn btn-success mt-4 px-4">
        Go to Home
    </a>
</div>

</body>
</html>
