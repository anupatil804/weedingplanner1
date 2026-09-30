<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Data.SqlClient;
using System.Web;

public class ImageHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.QueryString["id"] == null)
            return;

        int id = Convert.ToInt32(context.Request.QueryString["id"]);

        string cs = @"Data Source=.\SQLEXPRESS;Initial Catalog=weedingdb;Integrated Security=True";

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Artistphoto FROM Arti_reg WHERE Artist_id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            byte[] img = cmd.ExecuteScalar() as byte[];

            if (img != null)
            {
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(img);
            }
        }
    }

    public bool IsReusable { get { return false; } }
}
