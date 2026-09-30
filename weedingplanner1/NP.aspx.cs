using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class NP : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔒 Login check (Same as Sai)
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        // ✅ Date validation
        if (string.IsNullOrWhiteSpace(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(),
                "warn",
                "Swal.fire('Select Date','Please select a date first','warning');",
                true);

            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);

        // Same pattern as Sai
        int artistId = 18; // NP Sound
        string artistType = "Sound & DJ";

        string cs = ConfigurationManager
                        .ConnectionStrings["WeedingDBConnection"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 🔍 Check duplicate
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@uid AND artist_id=@aid",
                con);

            checkCmd.Parameters.AddWithValue("@uid", userId);
            checkCmd.Parameters.AddWithValue("@aid", artistId);

            int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (exists == 0)
            {
                // ✅ Insert wishlist
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
                confirmButtonText: 'Proceed to LightDecor',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'LightDecor.aspx';
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
