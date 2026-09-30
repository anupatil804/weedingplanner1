using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class Cart : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindCart();
    }

    private void BindCart()
    {
        List<CartItem> cart = Session["Cart"] as List<CartItem> ?? new List<CartItem>();
        gvCart.DataSource = cart;
        gvCart.DataBind();

        int total = 0;
        foreach (var item in cart)
            total += item.Charges;

        lblTotal.Text = "Total: ₹" + total;
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        var btn = (System.Web.UI.WebControls.Button)sender;
        int index = Convert.ToInt32(btn.CommandArgument);

        List<CartItem> cart = Session["Cart"] as List<CartItem>;
        if (cart != null && index < cart.Count)
        {
            cart.RemoveAt(index);
            Session["Cart"] = cart;
        }

        BindCart();
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        Session["Cart"] = null; // clear cart after confirmation
        string script = @"Swal.fire({
                            icon: 'success',
                            title: 'Booking Confirmed!',
                            text: 'Your booking has been successfully confirmed.',
                            confirmButtonColor: '#4caf50'
                          });";
        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), script, true);

        BindCart();
    }
}
