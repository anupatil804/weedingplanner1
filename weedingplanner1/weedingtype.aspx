<%@ Page Language="C#" AutoEventWireup="true"
    MasterPageFile="~/admin.master"
    CodeFile="weedingtype.aspx.cs"
    Inherits="weedingtype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .card {
            width: 600px;
            margin: auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .card-header {
            background: #1f8b4c;
            color: white;
            padding: 18px;
            font-size: 22px;
            font-weight: 600;
            text-align: center;
        }

        .card-body {
            padding: 25px 30px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            margin-top: 20px;
            background: #1f8b4c;
            color: white;
            border: none;
            padding: 12px;
            font-size: 17px;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn:hover {
            background: #166a39;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>

    <div class="card">

        <div class="card-header">
            💍 Add New Wedding Type
        </div>

        <div class="card-body">

            <label>Wedding Type Name</label>
            <asp:TextBox ID="txtWeedingType" runat="server"
                CssClass="form-control"
                placeholder="Enter wedding type name">
            </asp:TextBox>

            <label>Wedding Image</label>
            <asp:FileUpload ID="fuImage" runat="server"
                CssClass="form-control" />

            <asp:Button ID="btnSave" runat="server"
                Text="Save Wedding Type"
                CssClass="btn"
                OnClick="btnSave_Click" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</asp:Content>