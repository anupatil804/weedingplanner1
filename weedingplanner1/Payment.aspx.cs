using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class payment : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null || Session["TotalAmount"] == null)
        {
            Response.Redirect("Home.aspx");
            return;
        }

        if (!IsPostBack)
        {
            decimal total = Convert.ToDecimal(Session["TotalAmount"]);
            decimal advance = total * 0.30m;

            lblTotal.Text = total.ToString("0.00");
            lblAdvance.Text = advance.ToString("0.00");
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        decimal total = Convert.ToDecimal(lblTotal.Text);
        decimal advance = Convert.ToDecimal(lblAdvance.Text);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO final_conf
                (user_id, total_amount, paid_amount, payment_method, payment_type, payment_status, confirm_date)
                VALUES
                (@uid, @total, @paid, 'UPI', 'Advance', 'Pending', GETDATE())
            ", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
            cmd.Parameters.AddWithValue("@total", total);
            cmd.Parameters.AddWithValue("@paid", advance);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        Session.Remove("TotalAmount");

        // Loader 3 sec then popup
        ClientScript.RegisterStartupScript(
            this.GetType(),
            "paymentSuccess",
            "setTimeout(function(){ showPaymentSuccess(); }, 3000);",
            true
        );
    }
}