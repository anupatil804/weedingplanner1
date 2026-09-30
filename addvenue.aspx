<%@ Page Title="Add Venue" Language="C#" MasterPageFile="~/admin.master"
    AutoEventWireup="true" CodeFile="addvenue.aspx.cs" Inherits="addvenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-7 col-md-9">

            <div class="card shadow-lg border-0 rounded-4">
                <div class="card-header bg-success text-white text-center rounded-top-4">
                    <h3 class="mb-0 fw-bold">
                        <i class="bi bi-building"></i> Add New Venue
                    </h3>
                </div>

                <div class="card-body p-4">

                    <!-- Venue Name -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Venue Name</label>
                        <asp:TextBox ID="txtVenueName" runat="server"
                            CssClass="form-control form-control-lg"
                            placeholder="Enter venue name" />
                    </div>

                    <!-- Address -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Venue Address</label>
                        <asp:TextBox ID="txtAddress" runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine" Rows="3"
                            placeholder="Enter full address" />
                    </div>

                    <!-- Contact -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Contact Number</label>
                        <asp:TextBox ID="txtContact" runat="server"
                            CssClass="form-control"
                            placeholder="Enter contact number"
                            MaxLength="15" />
                    </div>

                    <!-- District -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">District</label>
                        <asp:DropDownList ID="ddlDistrict" runat="server"
                            CssClass="form-select">
                            <asp:ListItem Value="">-- Select District --</asp:ListItem>
                            <asp:ListItem>Sangli</asp:ListItem>
                            <asp:ListItem>Satara</asp:ListItem>
                            <asp:ListItem>Kolhapur</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Image -->
                    <div class="mb-4">
                        <label class="form-label fw-semibold">Venue Image</label>
                        <asp:FileUpload ID="fuVenueImage" runat="server"
                            CssClass="form-control" />
                    </div>

                    <!-- Button -->
                    <div class="d-grid">
                        <asp:Button ID="btnSaveVenue" runat="server"
                            Text="Save Venue"
                            CssClass="btn btn-success btn-lg fw-bold"
                            OnClick="btnSaveVenue_Click" />
                    </div>

                    <!-- Message -->
                    <div class="mt-3 text-center">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

</asp:Content>
