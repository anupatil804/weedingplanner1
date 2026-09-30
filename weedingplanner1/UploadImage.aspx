<%@ Page Title="Upload Image"
    Language="C#"
    MasterPageFile="~/Admin.master"
    AutoEventWireup="true"
    CodeFile="UploadImage.aspx.cs"
    Inherits="UploadImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .card {
            width: 450px;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
        .title {
            font-size: 22px;
            text-align: center;
            color: #c2185b;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        .btn {
            background: #c2185b;
            color: white;
            padding: 8px 20px;
            border: none;
            cursor: pointer;
        }
        .msg {
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
            color: green;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
        <div class="title">Upload Image</div>

        <div class="form-group">
            <label>Select Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" Width="100%"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Select Image</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>

        <div style="text-align:center;">
            <asp:Button ID="btnUpload" runat="server"
                Text="Upload Image"
                CssClass="btn"
                OnClick="btnUpload_Click" />
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
    </div>

</asp:Content>
