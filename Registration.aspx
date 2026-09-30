<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Registration.aspx.cs"
    Inherits="Registration" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>User Registration</title>

    <style>

        :root {
            --primary: #f78da7;
            --secondary: #fbc4d4;
            --darkpink: #c9184a;
            --lightpink: #fde2e4;
            --bgpink: #fff0f3;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fff0f3, #fde2e4, #ffe5ec);
            height: 100vh;
            overflow: hidden;
        }

        /* Floating Hearts */
        .hearts span {
            position: absolute;
            width: 18px;
            height: 18px;
            background: rgba(247, 141, 167, 0.5);
            transform: rotate(45deg);
            animation: float 12s linear infinite;
            bottom: -50px;
        }

        .hearts span:before,
        .hearts span:after {
            content: '';
            position: absolute;
            width: 18px;
            height: 18px;
            background: rgba(247, 141, 167, 0.5);
            border-radius: 50%;
        }

        .hearts span:before { top: -9px; left: 0; }
        .hearts span:after { left: -9px; top: 0; }

        @keyframes float {
            0% { transform: translateY(0) rotate(45deg); opacity: 1; }
            100% { transform: translateY(-900px) rotate(45deg); opacity: 0; }
        }

        .hearts span:nth-child(1){left:10%;animation-duration:9s;}
        .hearts span:nth-child(2){left:25%;animation-duration:13s;}
        .hearts span:nth-child(3){left:40%;animation-duration:11s;}
        .hearts span:nth-child(4){left:55%;animation-duration:15s;}
        .hearts span:nth-child(5){left:70%;animation-duration:10s;}
        .hearts span:nth-child(6){left:85%;animation-duration:12s;}

        /* Glass Card */
        .card {
            position: relative;
            z-index: 2;
            width: 420px;
            margin: 80px auto;
            padding: 30px;
            border-radius: 18px;

            background: rgba(255, 255, 255, 0.45);
            backdrop-filter: blur(18px);

            border: 1px solid var(--lightpink);
            box-shadow: 0px 10px 35px rgba(201, 24, 74, 0.15);
        }

        h2 {
            text-align: center;
            color: var(--darkpink);
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid var(--lightpink);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(247, 141, 167, 0.4);
        }

        .msg {
            text-align: center;
            margin-top: 10px;
        }

        .links {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .links a {
            color: var(--darkpink);
            text-decoration: none;
            font-weight: bold;
        }

        .links a:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

    <!-- Floating Hearts -->
    <div class="hearts">
        <span></span><span></span><span></span>
        <span></span><span></span><span></span>
    </div>

<form id="form1" runat="server">

    <div class="card">
        <h2>User Registration</h2>

        <label>Name</label>
        <asp:TextBox ID="txtName" runat="server" />

        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" />

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />

        <label>City</label>
        <asp:TextBox ID="txtCity" runat="server" />

        <asp:Button ID="btnRegister" runat="server"
            Text="Register"
            CssClass="btn"
            OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

        <div class="links">
            <p>
                If you are an artist,
                <a href="ArtistRegister.aspx">click here to register</a>
            </p>
            <p>
                Already a user?
                <a href="Login.aspx">Click here to login</a>
            </p>
        </div>

    </div>

</form>
</body>
</html>
