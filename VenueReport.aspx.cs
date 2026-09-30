using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class VenueReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVenues();
        }
    }

    private void LoadVenues(string district = "")
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT * FROM Venues";

            if (!string.IsNullOrEmpty(district))
            {
                query += " WHERE District = @district";
            }

            SqlCommand cmd = new SqlCommand(query, con);

            if (!string.IsNullOrEmpty(district))
            {
                cmd.Parameters.AddWithValue("@district", district);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvVenue.DataSource = dt;
            gvVenue.DataBind();
        }
    }

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadVenues(ddlDistrict.SelectedValue);
    }
}