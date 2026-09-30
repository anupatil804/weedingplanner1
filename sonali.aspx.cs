using System;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class sonali : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSelectArtist_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(),
                "dateErr",
                "Swal.fire('Select Date','Please select a date first','warning');",
                true);
            return;
        }

        DateTime selectedDate;
        if (!DateTime.TryParseExact(
            txtDate.Text,
            "dd-MM-yyyy",
            CultureInfo.InvariantCulture,
            DateTimeStyles.None,
            out selectedDate))
        {
            ScriptManager.RegisterStartupScript(
                this, GetType(),
                "dateInvalid",
                "Swal.fire('Invalid Date','Please select valid date','error');",
                true);
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);

        string artistType = "Mehandi";
        int artistId = 25; // Sonali

        string cs = ConfigurationManager
            .ConnectionStrings["WeedingDBConnection"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            SqlCommand chk = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@u AND artist_id=@a",
                con);
            chk.Parameters.AddWithValue("@u", userId);
            chk.Parameters.AddWithValue("@a", artistId);

            if (Convert.ToInt32(chk.ExecuteScalar()) > 0)
            {
                ScriptManager.RegisterStartupScript(
                    this, GetType(),
                    "dup",
                    "Swal.fire('Already Added','Artist already in wishlist','info');",
                    true);
                return;
            }

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO wishlist (user_id, artist_type, artist_id) VALUES (@u,@t,@a)",
                con);
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
