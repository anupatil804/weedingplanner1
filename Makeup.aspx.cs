using System;
using System.Data;
using System.Data.SqlClient;

public partial class Makeup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMakeupArtists();
        }
    }

    void LoadMakeupArtists()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT Artist_id, Artistname, City FROM Arti_reg WHERE Arttype='Makeup Artist'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // FIXED LINKS FOR 6 MAKEUP ARTISTS
    public string GetMakeupLink(int index)
    {
        switch (index)
        {
            case 0: return "Mak.aspx";
            case 1: return "kunal1.aspx";
            case 2: return "pratik.aspx";
            case 3: return "trupti.aspx";
            case 4: return "parul.aspx";
            case 5: return "arti.aspx";
            default: return "#";
        }
    }
}
