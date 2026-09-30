<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="ArtistRegister.aspx.cs"
    Inherits="ArtistRegister" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Artist Registration</title>

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
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fff0f3, #fde2e4, #ffe5ec);
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

        .outer {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 2;
        }

        /* Glass Form Box */
        .form-box {
            width: 430px;
            background: rgba(255, 255, 255, 0.45);
            backdrop-filter: blur(18px);
            padding: 35px 30px;
            border-radius: 18px;
            border: 1px solid var(--lightpink);
            box-shadow: 0px 10px 35px rgba(201, 24, 74, 0.15);
        }

        h2 {
            text-align: center;
            color: var(--darkpink);
            margin-bottom: 25px;
            font-size: 28px;
        }

        label {
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
            display: block;
        }

        .input-box {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 1px solid var(--lightpink);
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(247, 141, 167, 0.4);
        }

        .msg {
            margin-top: 15px;
            text-align: center;
            font-weight: bold;
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

    <div class="outer">
        <div class="form-box">

            <h2>Artist Registration</h2>

            <label>Artist Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-box"></asp:TextBox>

            <label>City</label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="input-box"></asp:TextBox>

            <label>Email ID</label>
            <asp:TextBox ID="EmailID" runat="server" CssClass="input-box"></asp:TextBox>

            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server"
                TextMode="Password" CssClass="input-box"
                placeholder="Enter password"></asp:TextBox>

            <label>Art Type</label>
            <asp:DropDownList ID="ddlArtType" runat="server" CssClass="input-box">
                <asp:ListItem Text="Makeup Artist" />
                <asp:ListItem Text="Mehndi Artist" />
                <asp:ListItem Text="Photographer" />
                <asp:ListItem Text="sound & DJ" />
                <asp:ListItem Text="light decorator" />
                <asp:ListItem Text="caterers" />
            </asp:DropDownList>

            <label>Artist Photo</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="input-box" />

            <asp:Button ID="btnSubmit" runat="server"
                Text="Register Artist"
                CssClass="btn"
                OnClick="btnSubmit_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        </div>
    </div>

</form>
</body>
</html>
