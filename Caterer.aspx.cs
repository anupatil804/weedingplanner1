using System;
using System.Data;
using System.Data.SqlClient;

public partial class Caterer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCaterers();
        }
    }

    void LoadCaterers()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query =
                "SELECT Artist_id, Artistname, City " +
                "FROM Arti_reg WHERE Arttype LIKE '%Cater%'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // 🔴 FIXED 6 CATERER PAGES
    public string GetCatererLink(int index)
    {
        switch (index)
        {
            case 0: return "elite.aspx";
            case 1: return "omkara.aspx";
            case 2: return "zir.aspx";
            case 3: return "krish.aspx";
            case 4: return "mini.aspx";
            case 5: return "cook.aspx";
            default: return "#";
        }
    }
}
