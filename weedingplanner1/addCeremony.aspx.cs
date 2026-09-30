using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class addCeremony : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtCeremonyName.Text.Trim() == "")
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please enter ceremony name.";
            return;
        }

        if (!fuCeremonyImage.HasFile)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please select an image.";
            return;
        }

        try
        {
            string folderPath = Server.MapPath("~/Image/");
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            string fileName = Path.GetFileName(fuCeremonyImage.FileName);
            string fullPath = Path.Combine(folderPath, fileName);
            fuCeremonyImage.SaveAs(fullPath);

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Ceremony (CeremonyName, ImageName) VALUES (@name, @img)", con);

            cmd.Parameters.AddWithValue("@name", txtCeremonyName.Text.Trim());
            cmd.Parameters.AddWithValue("@img", fileName);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Ceremony added successfully!";

            txtCeremonyName.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}
