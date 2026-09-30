using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Configuration;

public partial class elite : System.Web.UI.Page
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
        // Validate date
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "dateErr",
                "Swal.fire('Error','Please select a date','error');", true);
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
                this, this.GetType(), "dateInvalid",
                "Swal.fire('Error','Invalid date format','error');", true);
            return;
        }

        bool isBusy = false;

        string cs = ConfigurationManager
            .ConnectionStrings["WeedingDBConnection"]
            .ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Artist_Calendar WHERE Artist_id = 31 AND BookingDate = @date",
                con);

            cmd.Parameters.AddWithValue("@date", selectedDate);

            con.Open();

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0) isBusy = true;
        }

        if (isBusy)
        {
            ScriptManager.RegisterStartupScript(
                this, this.GetType(), "busy",
                "Swal.fire('Caterer Busy','Caterer is busy on selected date','error');", true);
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);
        int artistId = 31; // Elite
        string artistType = "Caterer";

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO wishlist (user_id, artist_type, artist_id) VALUES (@u,@t,@a)",
                con);

            cmd.Parameters.AddWithValue("@u", userId);
            cmd.Parameters.AddWithValue("@t", artistType);
            cmd.Parameters.AddWithValue("@a", artistId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        string script = @"
            Swal.fire({
                title: 'Success!',
                text: 'Artist added to wishlist successfully.',
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