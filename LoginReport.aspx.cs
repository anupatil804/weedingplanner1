using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class LoginReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Do nothing on page load
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        GridView1.Visible = false;

        if (txtFromDate.Text == "" || txtToDate.Text == "")
        {
            lblMessage.Text = "Please select both dates.";
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
            @"SELECT user_id, role, name, LoginDate, LoginTime
              FROM login_tb
              WHERE LoginDate >= @FromDate
              AND LoginDate < DATEADD(day,1,@ToDate)
              ORDER BY LoginDate DESC", con);

            cmd.Parameters.Add("@FromDate", SqlDbType.DateTime)
                .Value = Convert.ToDateTime(txtFromDate.Text);

            cmd.Parameters.Add("@ToDate", SqlDbType.DateTime)
                .Value = Convert.ToDateTime(txtToDate.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                lblMessage.Text = "No records found.";
            }
        }
    }
}