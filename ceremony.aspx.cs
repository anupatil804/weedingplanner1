using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class ceremony : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            LoadCeremonies();
        }
    }

    private void LoadCeremonies()
    {
        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT CeremonyID, CeremonyName, ImageName FROM Ceremony", con);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptCeremony.DataSource = dt;
        rptCeremony.DataBind();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(Session["UserID"]);

        foreach (RepeaterItem item in rptCeremony.Items)
        {
            CheckBox chk = (CheckBox)item.FindControl("chkSelect");

            if (chk != null && chk.Checked)
            {
                HiddenField hfId = (HiddenField)item.FindControl("hfCeremonyID");
                int ceremonyId = Convert.ToInt32(hfId.Value);

                using (SqlCommand cmd = new SqlCommand(
                    "INSERT INTO wishlist (user_id, ceremony_id) VALUES (@uid, @cid)", con))
                {
                    cmd.Parameters.AddWithValue("@uid", userId);
                    cmd.Parameters.AddWithValue("@cid", ceremonyId);

                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }

        con.Close();
        Response.Redirect("wishlist.aspx");
    }
}
