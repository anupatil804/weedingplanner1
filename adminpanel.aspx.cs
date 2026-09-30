using System;

public partial class adminpanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Static values for now
            lblVendors.Text = "0";
            lblBookings.Text = "0";
            lblPackages.Text = "0";
        }
    }
}
