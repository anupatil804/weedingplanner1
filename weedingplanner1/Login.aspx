<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login - Wedding Planner</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        :root {
            --primary: #f78da7;
            --secondary: #fbc4d4;
            --darkpink: #c9184a;
            --lightpink: #fde2e4;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fff0f3, #fde2e4, #ffe5ec);
            height: 100vh;
            overflow: hidden;
        }

        .login-box {
            width: 420px;
            margin: 120px auto;
            padding: 35px;
            background: rgba(255, 255, 255, 0.45);
            backdrop-filter: blur(18px);
            border-radius: 18px;
            border: 1px solid var(--lightpink);
            box-shadow: 0px 10px 35px rgba(201, 24, 74, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: var(--darkpink);
            font-weight: bold;
        }

        .form-control {
            border-radius: 10px;
            border: 1px solid var(--lightpink);
        }

        .btn-primary {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            border: none;
            border-radius: 30px;
            font-weight: bold;
            padding: 10px;
        }

        .password-wrapper {
            position: relative;
        }

        .toggle-eye {
            position: absolute;
            right: 12px;
            top: 38px;
            cursor: pointer;
            font-size: 18px;
        }

        .loader {
            display: none;
            text-align: center;
            margin-top: 10px;
        }

        .spinner {
            width: 25px;
            height: 25px;
            border: 3px solid #fde2e4;
            border-top: 3px solid var(--primary);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: auto;
        }

        @keyframes spin {
            100% { transform: rotate(360deg); }
        }
    </style>

    <script>
        function togglePassword() {
            var txt = document.getElementById('<%= txtPassword.ClientID %>');
            txt.type = (txt.type === "password") ? "text" : "password";
        }

        function showLoader() {
            document.getElementById("loader").style.display = "block";
        }
    </script>
</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">
        <h2>Login / Register</h2>

        <div class="form-group">
            <label>Role</label>
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                <asp:ListItem Text="-- Select Role --" Value="" />
                <asp:ListItem Text="User" Value="user" />
                <asp:ListItem Text="Admin" Value="admin" />
                <asp:ListItem Text="Artist" Value="artist" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="txtName" runat="server"
                CssClass="form-control"
                placeholder="Enter Username"></asp:TextBox>
        </div>

        <div class="form-group password-wrapper">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="form-control"
                TextMode="Password"
                placeholder="Enter Password"></asp:TextBox>

            <span class="toggle-eye" onclick="togglePassword()">👁</span>
        </div>

        <asp:Button ID="btnLogin" runat="server"
            CssClass="btn btn-primary btn-block"
            Text="Login / Register"
            OnClick="btnLogin_Click"
            OnClientClick="showLoader()" />

        <div id="loader" class="loader">
            <div class="spinner"></div>
        </div>

        <div class="text-center mt-3">
            <asp:LinkButton ID="lnkRegister" runat="server"
                OnClick="lnkRegister_Click">
                If you are a new user, click here to Register
            </asp:LinkButton>
        </div>

        <asp:Label ID="lblMessage" runat="server"
            ForeColor="Red"
            CssClass="d-block text-center mt-3"></asp:Label>

    </div>

</form>
</body>
</html>