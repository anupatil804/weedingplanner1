using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class mak : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSelectArtist_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "err",
                "Swal.fire('Error','Please select date','error');", true);
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 1;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO wishlist(user_id,artist_type,artist_id) VALUES(@u,'Makeup',@a)",
                con);

            cmd.Parameters.AddWithValue("@u", userId);
            cmd.Parameters.AddWithValue("@a", artistId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        string script = @"
            Swal.fire({
                title: 'Success!',
                text: 'Artist selected successfully',
                icon: 'success',
                confirmButtonText: 'Proceed to photographer',
              
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then(()=>{
                window.location='Photo.aspx';
            });
        ";

        ScriptManager.RegisterStartupScript(this, GetType(), "ok", script, true);
    }
}