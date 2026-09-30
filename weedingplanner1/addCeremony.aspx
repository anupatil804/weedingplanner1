<%@ Page Title="Add Ceremony" Language="C#" MasterPageFile="~/admin.master"
    AutoEventWireup="true" CodeFile="addCeremony.aspx.cs" Inherits="addCeremony" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg border-0 rounded-4">
                
                <div class="card-header text-center bg-success text-white rounded-top-4">
                    <h4 class="mb-0">✨ Add Ceremony</h4>
                </div>

                <div class="card-body p-4">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Ceremony Name</label>
                        <asp:TextBox ID="txtCeremonyName" runat="server"
                            CssClass="form-control form-control-lg"
                            placeholder="Enter ceremony name (e.g. Haldi, Mehndi)">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Ceremony Image</label>
                        <asp:FileUpload ID="fuCeremonyImage" runat="server"
                            CssClass="form-control form-control-lg" />
                        <small class="text-muted">Upload JPG / PNG image</small>
                    </div>

                    <div class="d-grid mt-4">
                        <asp:Button ID="btnSave" runat="server"
                            Text=" Add Ceremony"
                            CssClass="btn btn-success btn-lg"
                            OnClick="btnSave_Click" />
                    </div>

                    <div class="text-center mt-3">
                        <asp:Label ID="lblMessage" runat="server" CssClass="fw-semibold"></asp:Label>
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

</asp:Content>
