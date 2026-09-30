using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class VenueExplorerReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVenues();
        }
    }

    private void LoadVenues(string district = "", string search = "")
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"SELECT *
                             FROM Venues
                             WHERE (District = @district OR @district = '')
                             AND (VenueName LIKE '%' + @search + '%' OR @search = '')
                             ORDER BY VenueID DESC";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@district", district);
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptVenue.DataSource = dt;
            rptVenue.DataBind();

            lblCount.Text = dt.Rows.Count.ToString();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadVenues(ddlDistrict.SelectedValue, txtSearch.Text.Trim());
    }
}