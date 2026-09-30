using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FeedbackReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        GridView1.Visible = false;

        if (txtFromDate.Text == "" || txtToDate.Text == "")
        {
            lblMsg.Text = "Please select both dates.";
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
            @"SELECT *
              FROM Feedback
              WHERE CreatedDate >= @FromDate
              AND CreatedDate < DATEADD(day,1,@ToDate)
              ORDER BY CreatedDate DESC", con);

            cmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(txtFromDate.Text));
            cmd.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(txtToDate.Text));

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
                lblMsg.Text = "No records found.";
            }
        }
    }
}