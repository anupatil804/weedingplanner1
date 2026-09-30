using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Feedback : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Feedback(Name, Email, Rating, Message) VALUES(@n,@e,@r,@m)", con);

            cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@r", Convert.ToInt32(rating.Value));
            cmd.Parameters.AddWithValue("@m", txtMessage.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ShowAlert("Thank You 💖", "Your feedback submitted successfully!", "success");
    }


    private void ShowAlert(string title, string msg, string icon)
    {
        string script =
        "Swal.fire({" +
        "title: '" + title + "'," +
        "text: '" + msg + "'," +
        "icon: '" + icon + "'," +
        "confirmButtonText: 'OK'" +
        "}).then((result)=>{" +
        "if(result.isConfirmed){" +
        "window.location='home.aspx';" +
        "}" +
        "});";

        ClientScript.RegisterStartupScript(this.GetType(), "msg", script, true);
    }
}
