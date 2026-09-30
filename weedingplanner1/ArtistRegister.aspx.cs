using System;
using System.Data.SqlClient;
using System.IO;

public partial class ArtistRegister : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            byte[] imageData = null;

            if (fuImage.HasFile)
            {
                using (BinaryReader br = new BinaryReader(fuImage.PostedFile.InputStream))
                {
                    imageData = br.ReadBytes(fuImage.PostedFile.ContentLength);
                }
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select artist photo";
                return;
            }

            string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                INSERT INTO Arti_reg
                (Artistname, City, Emailid, Password, Arttype, Artistphoto)
                VALUES
                (@name, @city, @email, @password, @arttype, @photo)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", EmailID.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@arttype", ddlArtType.SelectedItem.Text);
                    cmd.Parameters.Add("@photo", System.Data.SqlDbType.VarBinary).Value = imageData;

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Artist registered successfully!";
        }
        catch (Exception ex)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Error: " + ex.Message;
        }
    }
}
