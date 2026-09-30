using System;
using System.Data;
using System.Data.SqlClient;

public partial class Photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPhotographers();
        }
    }

    void LoadPhotographers()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT Artist_id, Artistname, City FROM Arti_reg WHERE Arttype='Photographer'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // 🔴 FIXED LINKS FOR 6 PHOTOGRAPHERS
    public string GetPhotoLink(int index)
    {
        switch (index)
        {
            case 0: return "minar.aspx";
            case 1: return "pranali.aspx";
            case 2: return "sairaj.aspx";
            case 3: return "atharv.aspx";
            case 4: return "sumit.aspx";
            case 5: return "mayur.aspx";
            default: return "#";
        }
    }
}
