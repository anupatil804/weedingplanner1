<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Wishlist</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #fff3f6;
            min-height: 100vh;
            font-family: "Segoe UI", sans-serif;
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
        .container {
            background: white;
            padding: 35px 30px;
            border-radius: 22px;
            box-shadow: 0 10px 28px rgba(0,0,0,0.12);
            border: 1px solid #ffd6de;
        }

        h2 {
            color: #d81b60;
            font-weight: 700;
        }

        .item-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 12px;
            border: 2px solid #f3b7c6;
        }

        .card {
            border-radius: 15px;
            border: 1px solid #f3b7c6;
            box-shadow: 0 5px 15px rgba(216,27,96,0.15);
            transition: 0.3s;
            cursor: pointer;
        }

        .total-amount {
            font-size: 1.3rem;
            font-weight: bold;
            text-align: right;
            margin-top: 25px;
            color: #c2185b;
        }

        .final-confirm-btn {
            display: block;
            margin: 25px auto 0 auto;
            padding: 12px 35px;
            font-size: 1.2rem;
            background: linear-gradient(135deg, #d81b60, #ec407a);
            border: none;
            color: white;
            border-radius: 25px;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ff5252, #ff1744);
            border: none;
        }

        a.card-link {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>

<body>


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

    
<form id="form1" runat="server">

<div class="container mt-5">

    <h2 class="text-center mb-4">My Wishlist</h2>

    <asp:Repeater ID="rptWishlist" runat="server">

        <ItemTemplate>

            <a href='<%# Eval("RedirectUrl") %>' class="card-link">

                <div class="card mb-3 p-3">

                    <div class="row align-items-center">

                        <div class="col-md-3 text-center">
                            <img src='<%# Eval("ItemImage") %>' class="item-img" />
                        </div>

                        <div class="col-md-6">

                            <h5><%# Eval("ItemName") %></h5>

                            <p><%# Eval("ItemType") %></p>

                            <p>
                                <%# Eval("Charges") != DBNull.Value ? "₹ " + Eval("Charges") : "" %>
                            </p>

                        </div>

                        <div class="col-md-3 text-end">

                            <asp:Button 
                                ID="btnCancel" 
                                runat="server" 
                                Text="Remove"
                                CssClass="btn btn-danger btn-sm px-3"
                                CommandArgument='<%# Eval("wishlist_id") %>'
                                OnCommand="btnCancel_Command"
                                OnClientClick="event.stopPropagation();" />

                        </div>

                    </div>

                </div>

            </a>

        </ItemTemplate>

    </asp:Repeater>

    <div class="total-amount">
        Total Amount: ₹ 
        <asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label>
    </div>

    <asp:Button 
        ID="btnFinalConfirm" 
        runat="server" 
        CssClass="btn final-confirm-btn"
        Text="Go to Final Confirmation" 
        OnClick="btnFinalConfirm_Click" />

</div>

</form>

</body>
</html>
