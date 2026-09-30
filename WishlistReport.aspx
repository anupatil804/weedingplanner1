<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="WishlistReport.aspx.cs"
    Inherits="WishlistReport"
    MasterPageFile="~/admin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .container-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            margin-top: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        h2 {
            color: #d81b60;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .grid-img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 10px;
        }
    </style>

    <div class="container container-box">

        <h2>My Wishlist Report</h2>

        <asp:GridView ID="gvWishlist" runat="server" AutoGenerateColumns="False"
            CssClass="table table-bordered table-striped">

            <Columns>

                <asp:BoundField DataField="wishlist_id" HeaderText="ID" />

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img src='<%# Eval("ItemImage") %>' class="grid-img" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ItemName" HeaderText="Name" />
                <asp:BoundField DataField="ItemType" HeaderText="Type" />
                <asp:BoundField DataField="Charges" HeaderText="Charges" />
                <asp:BoundField DataField="created_at" HeaderText="Date"
                    DataFormatString="{0:dd/MM/yyyy hh:mm tt}" />

            </Columns>

        </asp:GridView>

    </div>

</asp:Content>