using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class aishu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "select",
                "Swal.fire('Select Date','Please select a date first','warning');",
                true
            );
            return;
        }

        // 🔒 BUSY DATES CHECK (UNCHANGED)
        string[] busyDates = {
            "2026-01-04",
            "2026-01-10",
            "2026-01-18",
            "2026-01-25"
        };

        if (Array.Exists(busyDates, d => d == txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "busy",
                "Swal.fire('Artist Busy','Artist is busy on selected date','error');",
                true
            );
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 27;                 // ✅ UNIQUE ID FOR AISHU
        string artistType = "Mehandi";

        string cs = ConfigurationManager
            .ConnectionStrings["WeedingDBConnection"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 🔒 DUPLICATE CHECK
            SqlCommand chk = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@u AND artist_id=@a",
                con
            );
            chk.Parameters.AddWithValue("@u", userId);
            chk.Parameters.AddWithValue("@a", artistId);

            if (Convert.ToInt32(chk.ExecuteScalar()) > 0)
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(), "dup",
                    "Swal.fire('Already Added','Artist already in wishlist','info');",
                    true
                );
                return;
            }

            // 🔥 INSERT WISHLIST
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO wishlist (user_id, artist_type, artist_id) VALUES (@u,@t,@a)",
                con
            );
            cmd.Parameters.AddWithValue("@u", userId);
            cmd.Parameters.AddWithValue("@t", artistType);
            cmd.Parameters.AddWithValue("@a", artistId);
            cmd.ExecuteNonQuery();
        }

       // Professional SweetAlert Popup + Redirect to Venue Page
        string script = @"
            Swal.fire({
                title: 'Success!',
                text: ' Artist added to wishlist successfully.',
                icon: 'success',
                confirmButtonText: 'Proceed to Caterer',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'Caterer.aspx';
                }
            });
        ";

        ScriptManager.RegisterStartupScript(this, GetType(), "popup", script, true);
        
    }
}
