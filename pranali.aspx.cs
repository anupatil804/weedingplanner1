using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class pranali : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        // ✅ Get selected date properly (same fix as before)
        string selectedDate = Request.Form[txtDate.UniqueID];

        if (string.IsNullOrWhiteSpace(selectedDate))
        {
            string warn = @"
                Swal.fire({
                    icon: 'warning',
                    title: 'Select Date',
                    text: 'Please select a date first',
                    confirmButtonColor: '#c2185b'
                });";

            ScriptManager.RegisterStartupScript(this, GetType(), "w1", warn, true);
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 8;                 // ✅ Pranali artist ID
        string artistType = "Photographer"; // ✅ REQUIRED (NON-NULL COLUMN)

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 🔹 Check already in wishlist
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@uid AND artist_id=@aid",
                con);

            checkCmd.Parameters.AddWithValue("@uid", userId);
            checkCmd.Parameters.AddWithValue("@aid", artistId);

            int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (exists > 0)
            {
                string info = @"
                    Swal.fire({
                        icon: 'info',
                        title: 'Already Added',
                        text: 'This photographer is already in your wishlist',
                        confirmButtonColor: '#c2185b'
                    });";

                ScriptManager.RegisterStartupScript(this, GetType(), "w2", info, true);
                return;
            }

            // ✅ FIXED INSERT (artist_type INCLUDED)
            SqlCommand cmd = new SqlCommand(
                @"INSERT INTO wishlist (user_id, artist_id, artist_type, created_at)
                  VALUES (@uid, @aid, @atype, GETDATE())", con);

            cmd.Parameters.AddWithValue("@uid", userId);
            cmd.Parameters.AddWithValue("@aid", artistId);
            cmd.Parameters.AddWithValue("@atype", artistType);

            cmd.ExecuteNonQuery();
        }

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
}
