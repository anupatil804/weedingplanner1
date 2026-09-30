using System;
using System.Data;
using System.Data.SqlClient;

public partial class LightDecor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLightDecorators();
        }
    }

    void LoadLightDecorators()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query =
                "SELECT Artist_id, Artistname, City " +
                "FROM Arti_reg WHERE Arttype LIKE '%Light%'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // 🔴 6 SEPARATE LIGHT DECOR PAGES
    public string GetLightDecorLink(int index)
    {
        switch (index)
        {
            case 0: return "maha.aspx";
            case 1: return "jmd.aspx";
            case 2: return "durga.aspx";
            case 3: return "shree.aspx";
            case 4: return "ss.aspx";
            case 5: return "suf.aspx";
            default: return "#";
        }
    }
}
