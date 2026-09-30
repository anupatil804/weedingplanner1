using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class venue : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadVenues();
        }
    }

    private void LoadVenues(string district = "")
    {
        string query = "SELECT VenueID, VenueName, VenueImage, Address, ContactNo FROM Venues";

        if (!string.IsNullOrEmpty(district))
            query += " WHERE District=@district";

        SqlDataAdapter da = new SqlDataAdapter(query, con);

        if (!string.IsNullOrEmpty(district))
            da.SelectCommand.Parameters.AddWithValue("@district", district);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptVenues.DataSource = dt;
        rptVenues.DataBind();
    }

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadVenues(ddlDistrict.SelectedValue);
    }

    protected void btnCheckAvailability_Command(object sender, CommandEventArgs e)
    {
        int venueId = Convert.ToInt32(e.CommandArgument);

        RepeaterItem item = (RepeaterItem)((Button)sender).NamingContainer;
        TextBox txtDate = (TextBox)item.FindControl("txtBookingDate");

        if (string.IsNullOrEmpty(txtDate.Text))
        {
            ShowPopup("Select Date", "Please select a booking date first", "warning");
            return;
        }

        DateTime selectedDate = Convert.ToDateTime(txtDate.Text);

        SqlCommand cmd = new SqlCommand(
            "SELECT COUNT(*) FROM Bookings WHERE VenueID=@vid AND BookingDate=@bdate", con);

        cmd.Parameters.AddWithValue("@vid", venueId);
        cmd.Parameters.AddWithValue("@bdate", selectedDate);

        con.Open();
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (count == 0)
            ShowPopup("Venue Available", "Venue is available for your wedding day", "success");
        else
            ShowPopup("Venue Busy", "Venue is already booked on this date. Please choose another date or venue.", "error");
    }

    // ✅ Updated: Add venue to wishlist without breaking NOT NULL columns
    protected void btnSelectVenue_Command(object sender, CommandEventArgs e)
    {
        int venueId = Convert.ToInt32(e.CommandArgument);

        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        int userId = Convert.ToInt32(Session["UserID"]);

        // For venues, we must insert a placeholder for artist_type (required column)
        string venueType = "VENUE";

        using (SqlCommand cmd = new SqlCommand(
            @"INSERT INTO wishlist (user_id, venue_id, artist_type, created_at) 
              VALUES (@uid, @vid, @atype, GETDATE())", con))
        {
            cmd.Parameters.AddWithValue("@uid", userId);
            cmd.Parameters.AddWithValue("@vid", venueId);
            cmd.Parameters.AddWithValue("@atype", venueType); // avoids NOT NULL error

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // SweetAlert popup + redirect
        string script = @"
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: 'Venue added to wishlist successfully!',
                confirmButtonText: 'Proceed to ceremony',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then(function() {
                window.location = 'ceremony.aspx';
            });";

        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), script, true);
    }

    private void ShowPopup(string title, string message, string icon)
    {
        string script = "Swal.fire({title: '" + title + "', text: '" + message + "', icon: '" + icon + "', confirmButtonText: 'OK'});";
        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), script, true);
    }
}
