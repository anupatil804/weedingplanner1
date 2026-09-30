<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Category</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background:#fff5f8">

<form id="form1" runat="server" class="container mt-5" style="max-width:400px;">
    <h3 class="text-center text-danger">Add Image Category</h3>

    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"
        placeholder="Enter Category Name" />
    <br />

    <asp:Button ID="btnAdd" runat="server" Text="Add Category"
        CssClass="btn btn-danger btn-block"
        OnClick="btnAdd_Click" />

    <br />
    <asp:Label ID="lblMsg" runat="server" CssClass="text-success" />
</form>

</body>
</html>
