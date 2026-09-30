using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class VenueMasterReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVenues();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadVenues();
    }

    private void LoadVenues()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT * FROM Venues WHERE (@district='' OR District=@district)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@district", ddlDistrict.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvVenue.DataSource = dt;
            gvVenue.DataBind();

            lblTotal.Text = dt.Rows.Count.ToString();
        }
    }
}