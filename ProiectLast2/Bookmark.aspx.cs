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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
            this.BindView();
            this.BindRepeater();
            if (User.IsInRole("admin"))
             {
                for (int i = 0; i < Repeater.Items.Count; i++)
                { 
                    Button deleteButton = (Button)Repeater.Items[i].FindControl("deleteComment");
                    if (deleteButton != null)
                    {
                        deleteButton.Visible = true;
                    }
                }
                
             }
            }

        }

        private void BindView()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand command = new SqlCommand();
            SqlConnection conn;

            // bookmark id
            String id = Request.QueryString["id"];

            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            command.CommandText = "SELECT title, description, tags, likes, dislikes, date_added, URL, img FROM Bookmark WHERE id=@id";
            command.Parameters.Add("@id", id);
            command.Connection = conn;

            da = new SqlDataAdapter(command);
            da.Fill(ds);
            conn.Open();

            command.ExecuteNonQuery();

            formview.DataSource = ds;
            formview.DataBind();
            conn.Close();

        }
        
        private void BindRepeater()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand sqlcommand = new SqlCommand();
                    sqlcommand.Connection = connection;

                    String id = Request.QueryString["id"];
                    sqlcommand.CommandText = "SELECT id, text, UserName, date_added FROM Comment, Users WHERE id_bookmark = @id and  UserId = Comment.id_user";
                    sqlcommand.Parameters.Add("@id", id);
                    sqlcommand.ExecuteNonQuery();
                    da = new SqlDataAdapter(sqlcommand);
                    da.Fill(ds);
                    Repeater.DataSource = ds;
                    Repeater.DataBind();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

               
            }
        }

        protected void addComment(object sender, EventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand sqlcommand = new SqlCommand();
                    sqlcommand.Connection = connection;

                    TextBox commentTextbox = (TextBox) loginview.FindControl("comment");
                    String Comment = commentTextbox.Text;
                    String id_user = Membership.GetUser().ProviderUserKey.ToString();
                    String id_bookmark = Request.QueryString["id"];

                    sqlcommand.CommandText = "INSERT INTO Comment(text, id_user, id_bookmark) VALUES(@comment, @id_user, @id_bookmark)";
                    sqlcommand.Parameters.Add("@comment", Comment);
                    sqlcommand.Parameters.Add("@id_user", id_user);
                    sqlcommand.Parameters.Add("@id_bookmark", id_bookmark);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

               
                this.BindRepeater();
                

                if (User.IsInRole("admin"))
                {
                    for (int i = 0; i < Repeater.Items.Count; i++)
                    {
                        Button deleteButton = (Button)Repeater.Items[i].FindControl("deleteComment");
                        if (deleteButton != null)
                        {
                            deleteButton.Visible = true;
                        }
                    }

                }

            }
            
        }

        protected void commandClick(object sender, CommandEventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand sqlcommand = new SqlCommand();
                    sqlcommand.Connection = connection;

                    String id = (String) e.CommandArgument;

                    sqlcommand.CommandText = "DELETE FROM Comment WHERE Id=@id";
                    sqlcommand.Parameters.Add("@id", id);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

                this.BindRepeater();
                if (User.IsInRole("admin"))
                {
                    for (int i = 0; i < Repeater.Items.Count; i++)
                    {
                        Button deleteButton = (Button)Repeater.Items[i].FindControl("deleteComment");
                        if (deleteButton != null)
                        {
                            deleteButton.Visible = true;
                        }
                    }

                }
            }
            
        }



    }

}