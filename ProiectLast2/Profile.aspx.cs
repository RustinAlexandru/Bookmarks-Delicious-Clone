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


namespace ProiectLast2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindListView();
                usernameLabel.Text = Membership.GetUser().UserName;
            }
        }

        private void BindListView()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand command = new SqlCommand();
            SqlConnection connection;

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            String id_user = (String) Membership.GetUser().ProviderUserKey.ToString();
            
            command.CommandText = "Select * from Bookmark b, SavedBookmarks sb where @id_user = sb.id_user and b.id = sb.id_bookmark";
            command.Connection = connection;
            command.Parameters.AddWithValue("@id_user", id_user);
            
            da = new SqlDataAdapter(command);
            da.Fill(ds);
            connection.Open();

            command.ExecuteNonQuery();

            ProfileListView.DataSource = ds;
            ProfileListView.DataBind();
            connection.Close();

        }

        public string FormatDescription(String Description)
        {
            if (Description.Length > 3)
            {
                return Description.Substring(0, 3) + "[...]"; 
            }
            else
            {
                return Description;
            }
        }

        protected void ProfileListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ProfileListView.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }
    }
}