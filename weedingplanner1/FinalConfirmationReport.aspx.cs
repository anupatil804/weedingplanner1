using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FinalConfirmationReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT final_id,
                       total_amount,
                       paid_amount,
                       payment_method,
                       payment_status,
                       confirm_date
                FROM final_conf
                WHERE CAST(confirm_date AS DATE)
                BETWEEN @from AND @to
                ORDER BY final_id DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@from", txtFrom.Text);
            cmd.Parameters.AddWithValue("@to", txtTo.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvFinal.DataSource = dt;
            gvFinal.DataBind();
        }
    }
}