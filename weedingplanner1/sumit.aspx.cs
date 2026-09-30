using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class sumit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure user is logged in
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        // ✅ Correct way to read jQuery datepicker value
        string selectedDate = Request.Form[txtDate.UniqueID];

        if (string.IsNullOrWhiteSpace(selectedDate))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "warn",
                @"Swal.fire({
                    icon: 'warning',
                    title: 'Select Date',
                    text: 'Please select a date first',
                    confirmButtonColor: '#c2185b'
                });",
                true);
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 11;                // 🔹 CHANGE if Sumit has different ID
        string artistType = "Photographer";

        string cs = ConfigurationManager
                        .ConnectionStrings["WeedingDBConnection"]
                        .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // 🔹 Check if already in wishlist
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@uid AND artist_id=@aid",
                con);

            checkCmd.Parameters.AddWithValue("@uid", userId);
            checkCmd.Parameters.AddWithValue("@aid", artistId);

            int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (exists > 0)
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(), "info",
                    @"Swal.fire({
                        icon: 'info',
                        title: 'Already Added',
                        text: 'This artist is already in your wishlist',
                        confirmButtonColor: '#c2185b'
                    });",
                    true);
                return;
            }

            // 🔹 Insert into wishlist
            SqlCommand insertCmd = new SqlCommand(
                @"INSERT INTO wishlist (user_id, artist_id, artist_type, created_at)
                  VALUES (@uid, @aid, @atype, GETDATE())",
                con);

            insertCmd.Parameters.AddWithValue("@uid", userId);
            insertCmd.Parameters.AddWithValue("@aid", artistId);
            insertCmd.Parameters.AddWithValue("@atype", artistType);

            insertCmd.ExecuteNonQuery();
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
