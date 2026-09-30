<%@ WebHandler Language="C#" Class="imageHandler7" %>

using System;
using System.Data.SqlClient;
using System.Web;

public class imageHandler7 : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string id = context.Request.QueryString["id"];
        if (string.IsNullOrEmpty(id)) return;

        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Artistphoto FROM Arti_reg WHERE Artist_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            object result = cmd.ExecuteScalar();

            if (result != null && result != DBNull.Value)
            {
                byte[] img = (byte[])result;
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(img);
            }
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
