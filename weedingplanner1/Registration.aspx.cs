using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

        // ✅ Check Required Fields
        if (string.IsNullOrWhiteSpace(txtName.Text) ||
            string.IsNullOrWhiteSpace(txtEmail.Text) ||
            string.IsNullOrWhiteSpace(txtPassword.Text) ||
            string.IsNullOrWhiteSpace(txtCity.Text))
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Please fill all required fields!";
            return;   // STOP EXECUTION
        }

        try
        {
            string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // ✅ Insert Query
                string query = @"INSERT INTO Users 
                                (Name, Email, Password, City) 
                                VALUES 
                                (@Name, @Email, @Password, @City)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Registration Successful!";

                    // Clear Fields
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                    txtCity.Text = "";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Registration Failed!";
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}