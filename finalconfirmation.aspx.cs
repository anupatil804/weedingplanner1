
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class finalconfirmation : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadUserName();
            LoadWishlistDetails();
            LoadTotalAmount();
        }
    }

    // FETCH USER NAME
    private void LoadUserName()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT name FROM login_tb WHERE user_id=@uid", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            object result = cmd.ExecuteScalar();
            lblUsername.Text = result != null ? result.ToString() : "";
        }
    }

    // LOAD WISHLIST ITEMS
    private void LoadWishlistDetails()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT 
                    CASE 
                        WHEN a.Artist_id IS NOT NULL THEN a.Artistname
                        WHEN v.VenueID IS NOT NULL THEN v.VenueName
                        WHEN c.CeremonyID IS NOT NULL THEN c.CeremonyName
                    END AS ItemName,

                    CASE 
                        WHEN a.Artist_id IS NOT NULL THEN a.Arttype
                        WHEN v.VenueID IS NOT NULL THEN 'Venue'
                        WHEN c.CeremonyID IS NOT NULL THEN 'Ceremony'
                    END AS ItemType,

                    ISNULL(a.charges, ISNULL(v.charges, ISNULL(c.charges,0))) AS Charges
                FROM wishlist w
                LEFT JOIN Arti_reg a ON w.artist_id = a.Artist_id
                LEFT JOIN Venues v ON w.venue_id = v.VenueID
                LEFT JOIN Ceremony c ON w.ceremony_id = c.CeremonyID
                WHERE w.user_id = @uid
            ";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptFinalWishlist.DataSource = dt;
            rptFinalWishlist.DataBind();
        }
    }

    // TOTAL AMOUNT
    private void LoadTotalAmount()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT SUM(
                    ISNULL(a.charges,0) +
                    ISNULL(v.charges,0) +
                    ISNULL(c.charges,0)
                )
                FROM wishlist w
                LEFT JOIN Arti_reg a ON w.artist_id = a.Artist_id
                LEFT JOIN Venues v ON w.venue_id = v.VenueID
                LEFT JOIN Ceremony c ON w.ceremony_id = c.CeremonyID
                WHERE w.user_id = @uid", con);

            cmd.Parameters.AddWithValue("@uid", Session["UserID"]);

            con.Open();
            object total = cmd.ExecuteScalar();
            lblTotal.Text = total != DBNull.Value && total != null ? total.ToString() : "0";
        }
    }

    // ✅ ONLY CHANGE IS HERE
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        // store total for payment page
        Session["TotalAmount"] = lblTotal.Text;

        // go to payment page
        Response.Redirect("payment.aspx");
    }
}
 