using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;

public partial class arti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "dateErr",
                "Swal.fire('Error','Please select a date','error');", true);
            return;
        }

        DateTime selectedDate;
        if (!DateTime.TryParseExact(txtDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture,
            DateTimeStyles.None, out selectedDate))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "dateInvalid",
                "Swal.fire('Error','Invalid date format','error');", true);
            return;
        }

        bool isBusy = false;
        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        // Check artist calendar
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Artist_Calendar WHERE Artist_id = 6 AND BookingDate = @date",
                con);
            cmd.Parameters.AddWithValue("@date", selectedDate);
            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count > 0) isBusy = true;
        }

        if (isBusy)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "busy",
                "Swal.fire('Artist Busy','Artist is busy on selected date','error');", true);
            return;
        }

        // Add to wishlist
        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 6; // Arti Nayar
        string artistType = "Makeup";

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO wishlist (user_id, artist_type, artist_id) VALUES (@user_id, @artist_type, @artist_id)",
                con);
            cmd.Parameters.AddWithValue("@user_id", userId);
            cmd.Parameters.AddWithValue("@artist_type", artistType);
            cmd.Parameters.AddWithValue("@artist_id", artistId);
            con.Open();
            cmd.ExecuteNonQuery();
        }

        // Professional SweetAlert Popup + Redirect to Venue Page
        string script = @"
            Swal.fire({
                title: 'Success!',
                text: ' Artist added to wishlist successfully.',
                icon: 'success',
                confirmButtonText: 'Proceed to photographer',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'Photo.aspx';
                }
            });
        ";

        ScriptManager.RegisterStartupScript(this, GetType(), "popup", script, true);
    }
}
