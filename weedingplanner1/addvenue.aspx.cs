using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class addvenue : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString);

    protected void btnSaveVenue_Click(object sender, EventArgs e)
    {
        // Validation
        if (string.IsNullOrWhiteSpace(txtVenueName.Text) ||
            string.IsNullOrWhiteSpace(txtAddress.Text) ||
            string.IsNullOrWhiteSpace(txtContact.Text) ||
            ddlDistrict.SelectedIndex == 0)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please fill all required fields.";
            return;
        }

        if (!fuVenueImage.HasFile)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please upload venue image.";
            return;
        }

        try
        {
            // Save Image
            string folderPath = Server.MapPath("~/Image/");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string fileName = Guid.NewGuid() + Path.GetExtension(fuVenueImage.FileName);
            fuVenueImage.SaveAs(Path.Combine(folderPath, fileName));

            // Insert Data
            string query = @"INSERT INTO Venues
                             (VenueName, VenueImage, District, Address, ContactNo)
                             VALUES
                             (@name, @image, @district, @address, @contact)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", txtVenueName.Text.Trim());
            cmd.Parameters.AddWithValue("@image", fileName);
            cmd.Parameters.AddWithValue("@district", ddlDistrict.SelectedValue);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@contact", txtContact.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Venue added successfully!";

            // Clear fields
            txtVenueName.Text = "";
            txtAddress.Text = "";
            txtContact.Text = "";
            ddlDistrict.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}
