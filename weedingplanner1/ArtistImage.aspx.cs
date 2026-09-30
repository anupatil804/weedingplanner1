using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class ArtistImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            return;

        int artistId;
        if (!int.TryParse(Request.QueryString["id"], out artistId))
            return;

        string cs = ConfigurationManager
            .ConnectionStrings["WeedingDBConnection"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Artistphoto FROM Arti_reg WHERE Artist_id=@id",
                con);

            cmd.Parameters.AddWithValue("@id", artistId);

            con.Open();
            object img = cmd.ExecuteScalar();

            if (img != DBNull.Value && img != null)
            {
                byte[] bytes = (byte[])img;
                Response.Clear();
                Response.ContentType = "image/jpeg";
                Response.BinaryWrite(bytes);
                Response.End();
            }
        }
    }
}
