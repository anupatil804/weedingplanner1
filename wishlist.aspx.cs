using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class wishlist : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        }

        if (!IsPostBack)
        {
            LoadWishlist();
        }
    }

    private void LoadWishlist()
    {
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"

            -- ARTISTS (Redirect Using Artist ID)
            SELECT 
                w.wishlist_id,
                a.Artistname AS ItemName,
                a.Arttype AS ItemType,
                a.charges AS Charges,
                'ArtistImage.aspx?id=' + CAST(a.Artist_id AS VARCHAR) AS ItemImage,
                NULL AS Address,
                NULL AS District,

                CASE 
                    WHEN a.Artist_id = 1 THEN 'Mak.aspx'
                    WHEN a.Artist_id = 2 THEN 'kunal1.aspx'
                    WHEN a.Artist_id = 3 THEN 'pratik.aspx'
                    WHEN a.Artist_id = 4 THEN 'trupti.aspx'
                    WHEN a.Artist_id = 5 THEN 'parul.aspx'
                    WHEN a.Artist_id = 6 THEN 'arti.aspx'
                    WHEN a.Artist_id = 7 THEN 'minar.aspx'
                    WHEN a.Artist_id = 9 THEN 'sairaj.aspx'
                    WHEN a.Artist_id = 11 THEN 'sumit.aspx'
                    WHEN a.Artist_id = 8 THEN 'pranali.aspx'
                    WHEN a.Artist_id = 10 THEN 'atharv.aspx'
                    WHEN a.Artist_id = 12 THEN 'mayur.aspx'
                    WHEN a.Artist_id = 13 THEN 'choundeshwari.aspx'
WHEN a.Artist_id = 14 THEN 'appa.aspx'
WHEN a.Artist_id = 15 THEN 'sai.aspx'
WHEN a.Artist_id = 16 THEN 'bavachi.aspx'
WHEN a.Artist_id = 17 THEN 'omkar.aspx'
WHEN a.Artist_id = 18 THEN 'NP.aspx'
WHEN a.Artist_id = 19 THEN 'maha.aspx'
WHEN a.Artist_id = 20 THEN 'jmd.aspx'
WHEN a.Artist_id = 21 THEN 'durga.aspx'
WHEN a.Artist_id = 22 THEN 'shree.aspx'
WHEN a.Artist_id = 23 THEN 'ss.aspx'
WHEN a.Artist_id = 24 THEN 'suf.aspx'
WHEN a.Artist_id = 25 THEN 'Mehndi.aspx'
WHEN a.Artist_id = 26 THEN 'shravani.aspx'
WHEN a.Artist_id = 27 THEN 'aishu.aspx'
WHEN a.Artist_id = 28 THEN 'neha.aspx'
WHEN a.Artist_id = 29 THEN 'sayali.aspx'
WHEN a.Artist_id = 30 THEN 'gayatri.aspx'
WHEN a.Artist_id = 31 THEN 'elite.aspx'
WHEN a.Artist_id = 32 THEN 'omkara.aspx'
WHEN a.Artist_id = 33 THEN 'zir.aspx'
WHEN a.Artist_id = 34 THEN 'krish.aspx'
WHEN a.Artist_id = 35 THEN 'mini.aspx'
WHEN a.Artist_id = 36 THEN 'cook.aspx'






                    ELSE 'artistprofile.aspx?id=' + CAST(a.Artist_id AS VARCHAR)
                END AS RedirectUrl

            FROM wishlist w
            INNER JOIN Arti_reg a ON w.artist_id = a.Artist_id
            WHERE w.user_id = @uid AND w.artist_id IS NOT NULL


            UNION ALL


            -- VENUES
            SELECT
                w.wishlist_id,
                v.VenueName AS ItemName,
                'Venue' AS ItemType,
                v.charges AS Charges,
                'Image/' + v.VenueImage AS ItemImage,
                v.Address AS Address,
                v.District AS District,
                'venueDetails.aspx?id=' + CAST(v.VenueID AS VARCHAR) AS RedirectUrl

            FROM wishlist w
            INNER JOIN Venues v ON w.venue_id = v.VenueID
            WHERE w.user_id = @uid AND w.venue_id IS NOT NULL


            UNION ALL


            -- CEREMONIES
            SELECT
                w.wishlist_id,
                c.CeremonyName AS ItemName,
                'Ceremony' AS ItemType,
                c.charges AS Charges,
                'Image/' + c.ImageName AS ItemImage,
                NULL AS Address,
                NULL AS District,
                'ceremonyDetails.aspx?id=' + CAST(c.CeremonyID AS VARCHAR) AS RedirectUrl

            FROM wishlist w
            INNER JOIN Ceremony c ON w.ceremony_id = c.CeremonyID
            WHERE w.user_id = @uid AND w.ceremony_id IS NOT NULL


            UNION ALL


            -- WEDDING TYPES
            SELECT
                w.wishlist_id,
                t.TypeName AS ItemName,
                'Wedding Type' AS ItemType,
                NULL AS Charges,
                'Image/' + t.ImageName AS ItemImage,
                NULL AS Address,
                NULL AS District,
                'showweedingTypes.aspx?id=' + CAST(t.TypeID AS VARCHAR) AS RedirectUrl

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

            rptWishlist.DataSource = dt;
            rptWishlist.DataBind();


            // TOTAL CALCULATION
            decimal total = 0;

            foreach (DataRow row in dt.Rows)
            {
                if (row["Charges"] != DBNull.Value)
                {
                    total += Convert.ToDecimal(row["Charges"]);
                }
            }

            lblTotalAmount.Text = total.ToString("0.00");
        }
    }


    // REMOVE ITEM
    protected void btnCancel_Command(object sender, CommandEventArgs e)
    {
        int wishlistId = Convert.ToInt32(e.CommandArgument);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM wishlist WHERE wishlist_id = @id", con);

            cmd.Parameters.AddWithValue("@id", wishlistId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        LoadWishlist();
    }


    // FINAL CONFIRM
    protected void btnFinalConfirm_Click(object sender, EventArgs e)
    {
        Response.Redirect("finalconfirmation.aspx");
    }
}
