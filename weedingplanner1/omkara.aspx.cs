using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class omkara : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 🔒 LOGIN CHECK
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        // ❌ DATE NOT SELECTED
        if (string.IsNullOrWhiteSpace(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "select",
                "Swal.fire('Select Date','Please select a date first','warning');",
                true
            );
            return;
        }

        // 🔒 BUSY DATES (STATIC – SAME PATTERN)
        string[] busyDates =
        {
            "2025-12-09",
            "2025-12-16",
            "2025-12-24"
        };

        if (Array.Exists(busyDates, d => d == txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(), "busy",
                "Swal.fire('Caterer Busy','Caterer is busy on selected date','error');",
                true
            );
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 32;                 // ✅ UNIQUE ID FOR OMKARA CATERERS
        string artistType = "Caterer";

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
                    "Swal.fire('Already Added','Caterer already in wishlist','info');",
                    true
                );
                return;
            }

            // 🔥 INSERT INTO WISHLIST
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
                confirmButtonText: 'Proceed to weedingtypes',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'showweedingTypes.aspx';
                }
            });
        ";

        ScriptManager.RegisterStartupScript(this, GetType(), "popup", script, true);
    }
}
