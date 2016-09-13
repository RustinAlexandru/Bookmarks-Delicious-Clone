using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;



namespace Proiect
{
    public partial class mainpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn;

            if (Page.IsPostBack)
                return;


            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            cmd.CommandText = "Select * from Bookmark";
            cmd.Connection = conn;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Open();
            cmd.ExecuteNonQuery();
            Grid1.DataSource = ds;
            Grid1.DataBind();
            conn.Close();

        }

        protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            Grid1.CurrentPageIndex = e.NewPageIndex;
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn;
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            cmd.CommandText = "Select * from Bookmark";
            cmd.Connection = conn;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Open();
            cmd.ExecuteNonQuery();
            Grid1.DataSource = ds;
            Grid1.DataBind();
            conn.Close();
        }
    }
}