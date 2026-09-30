using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ArtistReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.Visible = false; // hide initially
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        GridView1.Visible = false;

        if (txtFromDate.Text == "" || txtToDate.Text == "")
        {
            lblMsg.Text = "Please select both dates";
            return;
        }

        DateTime fromDate = Convert.ToDateTime(txtFromDate.Text);
        DateTime toDate = Convert.ToDateTime(txtToDate.Text);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT Artist_id, Artistname, City, Emailid, Arttype, charges, CreatedDate
                  FROM Arti_reg
                  WHERE CreatedDate >= @FromDate
                  AND CreatedDate < DATEADD(DAY,1,@ToDate)
                  ORDER BY CreatedDate DESC", con);

            cmd.Parameters.AddWithValue("@FromDate", fromDate);
            cmd.Parameters.AddWithValue("@ToDate", toDate);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            else
            {
                lblMsg.Text = "No records found.";
            }
        }
    }
}