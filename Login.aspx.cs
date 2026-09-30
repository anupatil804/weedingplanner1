using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

        string role = ddlRole.SelectedValue.Trim();
        string username = txtName.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (role == "" || username == "" || password == "")
        {
            lblMessage.Text = "All fields are required!";
            return;
        }

        string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();

            string checkQuery = @"
                SELECT user_id 
                FROM dbo.login_tb
                WHERE LOWER(LTRIM(RTRIM(role))) = LOWER(@role)
                  AND LOWER(LTRIM(RTRIM(name))) = LOWER(@username)";

            SqlCommand cmdCheck = new SqlCommand(checkQuery, con);
            cmdCheck.Parameters.AddWithValue("@role", role);
            cmdCheck.Parameters.AddWithValue("@username", username);

            object result = cmdCheck.ExecuteScalar();
            int userId;

            if (result != null)
            {
                string pwdQuery = @"SELECT user_id FROM dbo.login_tb 
                                    WHERE LOWER(LTRIM(RTRIM(role))) = LOWER(@role)
                                      AND LOWER(LTRIM(RTRIM(name))) = LOWER(@username)
                                      AND LTRIM(RTRIM(password)) = @password";

                SqlCommand cmdPwd = new SqlCommand(pwdQuery, con);
                cmdPwd.Parameters.AddWithValue("@role", role);
                cmdPwd.Parameters.AddWithValue("@username", username);
                cmdPwd.Parameters.AddWithValue("@password", password);

                object pwdResult = cmdPwd.ExecuteScalar();

                if (pwdResult != null)
                {
                    userId = Convert.ToInt32(pwdResult);
                }
                else
                {
                    lblMessage.Text = "Username already exists with different password!";
                    return;
                }
            }
            else
            {
                string insertQuery = @"
                    INSERT INTO dbo.login_tb (role, name, password)
                    VALUES (@role, @username, @password);
                    SELECT SCOPE_IDENTITY();";

                SqlCommand cmdInsert = new SqlCommand(insertQuery, con);
                cmdInsert.Parameters.AddWithValue("@role", role);
                cmdInsert.Parameters.AddWithValue("@username", username);
                cmdInsert.Parameters.AddWithValue("@password", password);

                userId = Convert.ToInt32(cmdInsert.ExecuteScalar());
            }

            // ✅ Store session
            Session["UserID"] = userId;
            Session["UserName"] = username;
            Session["Role"] = role;

            // ✅ Redirect to previous page if exists
            string returnUrl = Request.QueryString["ReturnUrl"];

            if (!string.IsNullOrEmpty(returnUrl))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }

    protected void lnkRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }
}