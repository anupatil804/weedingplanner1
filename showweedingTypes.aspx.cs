using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showweedingtypes : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadWeedingTypes();
        }
    }

    private void LoadWeedingTypes()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT TypeID, TypeName, ImageName FROM WeedingTypes", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptTypes.DataSource = dt;
            rptTypes.DataBind();
        }
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
            return;
        }

        Button btn = (Button)sender;
        int typeId = Convert.ToInt32(btn.CommandArgument);
        int userId = Convert.ToInt32(Session["UserID"]);

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            // Check if already in wishlist
            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM wishlist WHERE user_id=@uid AND weddingtype_id=@wid", con);

            checkCmd.Parameters.AddWithValue("@uid", userId);
            checkCmd.Parameters.AddWithValue("@wid", typeId);

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count == 0)
            {
                // Insert into wishlist
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO wishlist (user_id, weddingtype_id) VALUES (@uid, @wid)", con);

                cmd.Parameters.AddWithValue("@uid", userId);
                cmd.Parameters.AddWithValue("@wid", typeId);

                cmd.ExecuteNonQuery();
            }
        }

        // Professional SweetAlert Popup + Redirect to Venue Page
        string script = @"
            Swal.fire({
                title: 'Success!',
                text: 'Wedding type added successfully.',
                icon: 'success',
                confirmButtonText: 'Proceed to Venue',
                confirmButtonColor: '#d81b60',
                background: '#fff5f8'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'venue.aspx';
                }
            });
        ";

        ScriptManager.RegisterStartupScript(this, GetType(), "popup", script, true);
    }
}
