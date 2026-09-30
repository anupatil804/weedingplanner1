using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class remaining_payment : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadPaymentDetails();
        }
    }

    private void LoadPaymentDetails()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    total_amount,
                    ISNULL((
                        SELECT TOP 1 paid_amount
                        FROM final_conf
                        WHERE user_id = @uid
                          AND payment_type = 'Advance'
                        ORDER BY confirm_date DESC
                    ), 0) AS paid_amount
                FROM final_conf
                WHERE user_id = @uid
                GROUP BY total_amount
            ", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                decimal total = Convert.ToDecimal(dr["total_amount"]);
                decimal paid = Convert.ToDecimal(dr["paid_amount"]);
                decimal remaining = total - paid;

                lblTotal.Text = total.ToString("0.00");
                lblPaid.Text = paid.ToString("0.00");
                lblRemaining.Text = remaining.ToString("0.00");
            }
        }
    }

    protected void btnPayRemaining_Click(object sender, EventArgs e)
    {
        decimal remaining = Convert.ToDecimal(lblRemaining.Text);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                INSERT INTO final_conf
                (user_id, total_amount, paid_amount, payment_method, payment_type, payment_status, confirm_date)
                VALUES
                (@uid, @total, @paid, 'UPI', 'Full', 'Paid', GETDATE())
            ", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);
            cmd.Parameters.AddWithValue("@total", lblTotal.Text);
            cmd.Parameters.AddWithValue("@paid", remaining);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "success",
            "showSuccess();",
            true
        );
    }
}
