<%@ Page Language="C#" AutoEventWireup="true" CodeFile="finalconfirmation.aspx.cs" Inherits="finalconfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Final Wedding Confirmation</title>

```
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@400;500&display=swap" rel="stylesheet" />

<style>
    body {
        background: linear-gradient(to right, #fff5f8, #fefefe);
        font-family: 'Poppins', sans-serif;
    }
    /* ===== UPDATED NAVBAR ===== */
        .navbar {
            background: #000 !important; /* Black background */
            height: 60px;                /* Reduced height */
            padding: 5px 15px;
        }

        .navbar-brand img {
            height: 40px; /* Smaller logo */
        }

        .nav-link {
            color: white !important;
            font-size: 15px;
            margin-left: 15px;
        }

        .nav-link:hover {
            color: #ffcc00 !important; /* Gold hover */
        }

    .page-title {
        font-family: 'Playfair Display', serif;
        color: #b76e79;
        font-weight: 700;
    }

    .card-custom {
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        background: #ffffff;
    }

    .section-title {
        font-weight: 600;
        color: #444;
    }

    .table thead {
        background: #b76e79;
        color: white;
    }

    .total-box {
        background: linear-gradient(135deg, #b76e79, #d4a5ad);
        color: white;
        border-radius: 12px;
        padding: 20px;
        font-size: 22px;
        font-weight: 600;
    }

    .btn-confirm {
        background: linear-gradient(135deg, #b76e79, #d4a5ad);
        border: none;
        color: white;
        font-size: 18px;
        padding: 12px 50px;
        border-radius: 30px;
    }

    .btn-confirm:hover {
        opacity: 0.9;
    }
</style>
```

</head>

<body>
<form id="form1" runat="server">

<!-- LEFT ALIGNED NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <a class="navbar-brand" href="Home.aspx">
            <img src="image/logo.png" alt="Logo" />
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
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
<div class="container my-5">

```
<!-- PAGE HEADER -->
<div class="text-center mb-5">
    <h1 class="page-title">Final Wedding Confirmation</h1>
    <p class="text-muted">Please review your selected wedding services</p>
</div>

<!-- USER INFO -->
<div class="card card-custom mb-4">
    <div class="card-body d-flex justify-content-between align-items-center">
        <div>
            <h6 class="section-title mb-1">Booked By</h6>
            <h5 class="mb-0 text-capitalize">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </h5>
        </div>
        <span class="badge bg-success px-3 py-2">Wedding Planner</span>
    </div>
</div>

<!-- WISHLIST DETAILS -->
<div class="card card-custom mb-4">
    <div class="card-body">
        <h5 class="section-title mb-3">Selected Wedding Services</h5>

        <asp:Repeater ID="rptFinalWishlist" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered align-middle text-center">
                    <thead>
                        <tr>
                            <th>Service Name</th>
                            <th>Category</th>
                            <th>Charges (₹)</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td class="fw-semibold"><%# Eval("ItemName") %></td>
                    <td><%# Eval("ItemType") %></td>
                    <td class="fw-semibold text-success">₹ <%# Eval("Charges") %></td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>

    </div>
</div>

<!-- TOTAL -->
<div class="total-box text-end mb-4">
    Total Payable Amount: ₹ <asp:Label ID="lblTotal" runat="server"></asp:Label>
</div>

<!-- CONFIRM BUTTON -->
<div class="text-center">
    <asp:Button ID="btnConfirm"
        runat="server"
        Text="Confirm Wedding Booking"
        CssClass="btn btn-confirm"
        OnClick="btnConfirm_Click" />
</div>
```

</div>

</form>
</body>
</html>
