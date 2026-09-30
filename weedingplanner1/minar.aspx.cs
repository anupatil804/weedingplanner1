using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;

public partial class minar : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // User must be logged in (same as mak.aspx)
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        // Date validation (same style as mak)
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(),
                "dateErr",
                "Swal.fire('Error','Please select a date','error');",
                true);
            return;
        }

        // Logged-in user
        int userId = Convert.ToInt32(Session["UserID"]);

        // STATIC artist info (like mak.aspx)
        int artistId = 7; // Minar Dev
        string artistType = "Photographer";

        string cs = ConfigurationManager
                        .ConnectionStrings["WeedingDBConnection"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 🔹 Prevent duplicate wishlist entry
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@uid AND artist_id=@aid",
                con);
            checkCmd.Parameters.AddWithValue("@uid", userId);
            checkCmd.Parameters.AddWithValue("@aid", artistId);

            int alreadyExists = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (alreadyExists == 0)
            {
                // 🔹 Add to wishlist (same as mak)
                SqlCommand insertCmd = new SqlCommand(
                    "INSERT INTO wishlist (user_id, artist_type, artist_id) VALUES (@uid,@type,@aid)",
                    con);
                insertCmd.Parameters.AddWithValue("@uid", userId);
                insertCmd.Parameters.AddWithValue("@type", artistType);
                insertCmd.Parameters.AddWithValue("@aid", artistId);
                insertCmd.ExecuteNonQuery();

                // Professional SweetAlert Popup + Redirect to Venue Page
                string script = @"
            Swal.fire({
                title: 'Success!',
                text: ' Artist added to wishlist successfully.',
                icon: 'success',
                confirmButtonText: 'Proceed to soundDj',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'SoundDJ.aspx';
                }
            });
        ";

                ScriptManager.RegisterStartupScript(this, GetType(), "popup", script, true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(),
                    "info",
                    "Swal.fire('Info','Already in wishlist','info');",
                    true);
            }
        }
    }
}
