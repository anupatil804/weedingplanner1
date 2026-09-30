using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class UploadImage : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["weedingdb"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategories();
        }
    }

    void LoadCategories()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT CategoryId, CategoryName FROM ImageCategory", con);

            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!FileUpload1.HasFile)
        {
            lblMsg.Text = "Please select an image";
            return;
        }

        string fileName = DateTime.Now.Ticks + "_" +
                          Path.GetFileName(FileUpload1.FileName);

        // ✅ USING EXISTING image FOLDER
        string folderPath = Server.MapPath("~/image/");
        string fullPath = folderPath + fileName;

        FileUpload1.SaveAs(fullPath);

        string imagePath = "image/" + fileName;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO ImageGallery (CategoryId, ImagePath) VALUES (@cid, @img)", con);

            cmd.Parameters.AddWithValue("@cid", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@img", imagePath);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        lblMsg.Text = "Image uploaded successfully!";
    }
}
