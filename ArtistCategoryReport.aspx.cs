using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ArtistCategoryReport : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["WeedingDBConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.Visible = false;
            LoadCategories();
        }
    }

    // Load unique categories from database dynamically
    private void LoadCategories()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "SELECT DISTINCT Arttype FROM Arti_reg ORDER BY Arttype";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem("-- Select Category --", ""));
            while (dr.Read())
            {
                ddlCategory.Items.Add(new System.Web.UI.WebControls.ListItem(dr["Arttype"].ToString()));
            }
            con.Close();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        GridView1.Visible = false;

        // Validation
        if (string.IsNullOrWhiteSpace(txtFromDate.Text) || string.IsNullOrWhiteSpace(txtToDate.Text))
        {
            lblMsg.Text = "Please enter both From Date and To Date.";
            return;
        }

        if (ddlCategory.SelectedValue == "")
        {
            lblMsg.Text = "Please select a category.";
            return;
        }

        DateTime fromDate, toDate;
        if (!DateTime.TryParse(txtFromDate.Text, out fromDate) ||
            !DateTime.TryParse(txtToDate.Text, out toDate))
        {
            lblMsg.Text = "Invalid date format.";
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = @"
                SELECT Artist_id, Artistname, City, Emailid, Arttype, charges, CreatedDate
                FROM Arti_reg
                WHERE Arttype = @type
                AND CreatedDate BETWEEN @from AND @to
                ORDER BY Artist_id DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@type", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@from", fromDate.Date);
            cmd.Parameters.AddWithValue("@to", toDate.Date.AddDays(1).AddSeconds(-1));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
            else
            {
                lblMsg.Text = "No records found for selected date and category.";
            }
        }
    }
}