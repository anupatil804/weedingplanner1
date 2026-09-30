using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class WishlistReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadReport();
        }
    }

    private void LoadReport()
    {
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"

            -- ARTISTS
            SELECT 
                w.wishlist_id,
                a.Artistname AS ItemName,
                a.Arttype AS ItemType,
                a.charges AS Charges,
                'ArtistImage.aspx?id=' + CAST(a.Artist_id AS VARCHAR) AS ItemImage,
                w.created_at

            FROM wishlist w
            INNER JOIN Arti_reg a ON w.artist_id = a.Artist_id
            WHERE w.user_id = @uid AND w.artist_id IS NOT NULL


            UNION ALL

            -- VENUES
            SELECT
                w.wishlist_id,
                v.VenueName,
                'Venue',
                v.charges,
                'Image/' + v.VenueImage,
                w.created_at

            FROM wishlist w
            INNER JOIN Venues v ON w.venue_id = v.VenueID
            WHERE w.user_id = @uid AND w.venue_id IS NOT NULL


            UNION ALL

            -- CEREMONIES
            SELECT
                w.wishlist_id,
                c.CeremonyName,
                'Ceremony',
                c.charges,
                'Image/' + c.ImageName,
                w.created_at

            FROM wishlist w
            INNER JOIN Ceremony c ON w.ceremony_id = c.CeremonyID
            WHERE w.user_id = @uid AND w.ceremony_id IS NOT NULL


            UNION ALL

            -- WEDDING TYPES
            SELECT
                w.wishlist_id,
                t.TypeName,
                'Wedding Type',
                NULL,
                'Image/' + t.ImageName,
                w.created_at

            FROM wishlist w
            INNER JOIN WeedingTypes t ON w.weddingtype_id = t.TypeID
            WHERE w.user_id = @uid AND w.weddingtype_id IS NOT NULL

            ORDER BY wishlist_id DESC
            ";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uid", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvWishlist.DataSource = dt;
            gvWishlist.DataBind();
        }
    }
}