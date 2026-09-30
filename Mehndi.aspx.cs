using System;
using System.Data;
using System.Data.SqlClient;

public partial class Mehndi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMehndiArtists();
        }
    }

    void LoadMehndiArtists()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT Artist_id, Artistname, City FROM Arti_reg WHERE Arttype='Mehndi Artist'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // 🔴 FIXED LINKS FOR 6 MEHNDI PAGES
    public string GetMehndiLink(int index)
    {
        switch (index)
        {
            case 0: return "sonali.aspx";
            case 1: return "shravani.aspx";
            case 2: return "aishu.aspx";
            case 3: return "neha.aspx";
            case 4: return "sayali.aspx";
            case 5: return "gayatri.aspx";
            default: return "#";
        }
    }
}
