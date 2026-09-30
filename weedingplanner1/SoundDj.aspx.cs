using System;
using System.Data;
using System.Data.SqlClient;

public partial class SoundDJ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSoundDJ();
        }
    }

    void LoadSoundDJ()
    {
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT Artist_id, Artistname, City FROM Arti_reg WHERE Arttype='Sound & DJ'";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
    }

    // 🔴 FIXED LINKS FOR 6 CARDS
    public string GetSoundLink(int index)
    {
        switch (index)
        {
            case 0: return "choundeshwari.aspx";
            case 1: return "appa.aspx";
            case 2: return "sai.aspx";
            case 3: return "bavachi.aspx";
            case 4: return "omkar.aspx";
            case 5: return "NP.aspx";
            default: return "#";
        }
    }
}
