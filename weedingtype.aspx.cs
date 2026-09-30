using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class weedingtype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // ✅ Check Login Session
        if (Session["UserID"] == null)
        {
            Response.Redirect("Login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Validation
        if (txtWeedingType.Text.Trim() == "")
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please enter weeding type name.";
            return;
        }

        if (!fuImage.HasFile)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please select an image.";
            return;
        }

        try
        {
            // Image folder
            string folderPath = Server.MapPath("~/Image/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // Unique image name
            string extension = Path.GetExtension(fuImage.FileName);
            string fileName = Guid.NewGuid().ToString() + extension;

            fuImage.SaveAs(Path.Combine(folderPath, fileName));

            // Insert into DB
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO WeedingTypes (TypeName, ImageName) VALUES (@name, @img)", con);

                cmd.Parameters.AddWithValue("@name", txtWeedingType.Text.Trim());
                cmd.Parameters.AddWithValue("@img", fileName);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Weeding Type Added Successfully!";
            txtWeedingType.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}