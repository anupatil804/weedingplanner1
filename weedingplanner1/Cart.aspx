<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Cart</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        table { width: 80%; margin: 20px auto; border-collapse: collapse; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: center; }
        th { background: #c2185b; color: #fff; }
        .btn { padding: 8px 12px; border: none; border-radius: 6px; cursor: pointer; }
        .btn-remove { background: #e53935; color: #fff; }
        .btn-confirm { background: #4caf50; color: #fff; margin-top: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Type" DataField="ItemType" />
                <asp:BoundField HeaderText="Name" DataField="ItemName" />
                <asp:BoundField HeaderText="Charges" DataField="Charges" />
                <asp:BoundField HeaderText="Date" DataField="SelectedDate" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnRemove_Click" CssClass="btn btn-remove" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div style="text-align:center;">
            <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Font-Size="Large" />
            <br />
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" OnClick="btnConfirm_Click" CssClass="btn btn-confirm" />
        </div>
    </form>
</body>
</html>
