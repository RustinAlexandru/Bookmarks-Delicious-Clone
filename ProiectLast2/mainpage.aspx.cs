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
             if (!this.IsPostBack)
             {
                 this.BindListView();
                // this.bindSearchList();
                 this.showSaveLikeDislikeButtons();
                 this.showAdminDeleteButton();
     
             }

             this.showAdminDeleteButton();
             

             
        }

        

        private void BindListView()
        {
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
            
            ListView.DataSource = ds;
            ListView.DataBind();
            conn.Close();

        }


        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListView.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            if (mostViewedCheckbox.Checked)
            {
                this.bindMostViewed();
            }
            else if (mostRecentCheckbox.Checked)
            {
                this.bindMostRecent();
            }
            else 
            {
                this.BindListView();
            }
            this.showSaveLikeDislikeButtons();
            this.showAdminDeleteButton();

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

        protected void commandclick(object sender, CommandEventArgs e)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            switch (e.CommandName)
            {
                case "saveBookmark":
                   
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            connection.Open();
                            SqlCommand sqlcommand = new SqlCommand();
                            sqlcommand.Connection = connection;

                            String id_user = Membership.GetUser().ProviderUserKey.ToString();
                            String id_bookmark = (String) e.CommandArgument;
                    

                            sqlcommand.CommandText = "INSERT INTO SavedBookmarks(id_user, id_bookmark) VALUES(@id_user, @id_bookmark)";
                            sqlcommand.Parameters.Add("@id_user", id_user);
                            sqlcommand.Parameters.Add("@id_bookmark", id_bookmark);
                            sqlcommand.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            //Handle exception, perhaps log it and do the needful
                        }

                        Response.Redirect("~/SuccessMessage.aspx?t=bp");
                    }
   
                 break;
                case "DeleteBookmark":
                 using (SqlConnection connection = new SqlConnection(connectionString))
                 {
                     try
                     {
                         connection.Open();
                         SqlCommand sqlcommand = new SqlCommand();
                         sqlcommand.Connection = connection;

                         String id_bookmark = (String)e.CommandArgument;


                         sqlcommand.CommandText = "DELETE FROM Bookmark WHERE Id = @id_bookmark";
                         sqlcommand.Parameters.Add("@id_bookmark", id_bookmark);
                         sqlcommand.ExecuteNonQuery();
                     }
                     catch (Exception ex)
                     {
                         //Handle exception, perhaps log it and do the needful
                     }

                     Response.Redirect("~/SuccessMessage.aspx?t=db");
                 }
                    
                break;
                case "like":
                 using (SqlConnection connection = new SqlConnection(connectionString))
                 {
                     try
                     {
                         connection.Open();
                         SqlCommand sqlcommand = new SqlCommand();
                         sqlcommand.Connection = connection;

                         String id_bookmark = (String)e.CommandArgument;


                         sqlcommand.CommandText = "UPDATE Bookmark SET likes = likes + 1 WHERE Id=@id_bookmark";
                         sqlcommand.Parameters.Add("@id_bookmark", id_bookmark);
                         sqlcommand.ExecuteNonQuery();
                     }
                     catch (Exception ex)
                     {
                         //Handle exception, perhaps log it and do the needful
                     }

                     //Response.Redirect("~/mainpage.aspx");
                     this.BindListView();
                     this.showSaveLikeDislikeButtons();
                     this.showAdminDeleteButton();

                 }
                break;
              case "dislike":
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        SqlCommand sqlcommand = new SqlCommand();
                        sqlcommand.Connection = connection;

                        String id_bookmark = (String)e.CommandArgument;


                        sqlcommand.CommandText = "UPDATE Bookmark SET dislikes = dislikes + 1 WHERE Id=@id_bookmark";
                        sqlcommand.Parameters.Add("@id_bookmark", id_bookmark);
                        sqlcommand.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        //Handle exception, perhaps log it and do the needful
                    }

                    //Response.Redirect("~/mainpage.aspx");
                    this.BindListView();
                    this.showSaveLikeDislikeButtons();
                    this.showAdminDeleteButton();

                }
                break;
                default:
                    break;
            }
            
        }

        protected void mostViewedBind(object sender, EventArgs e)
        {
            this.bindMostViewed();
            mostRecentCheckbox.Checked = false;
            mostViewedCheckbox.Checked = true;
            this.showSaveLikeDislikeButtons();
            this.showAdminDeleteButton();



        }

        private void bindMostViewed()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand sqlcommand = new SqlCommand();
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    sqlcommand.Connection = connection;
                    sqlcommand.CommandText = "Select * from Bookmark order by likes desc";
                    da = new SqlDataAdapter(sqlcommand);
                    da.Fill(ds);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

            }
            ListView.DataSource = ds;
            ListView.DataBind();

        }


        protected void mostRecentBind(object sender, EventArgs e)
        {
            this.bindMostRecent();
            mostViewedCheckbox.Checked = false;
            mostRecentCheckbox.Checked = true;
            this.showSaveLikeDislikeButtons();
            this.showAdminDeleteButton();

        }

        private void bindMostRecent()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand sqlcommand = new SqlCommand();
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    sqlcommand.Connection = connection;
                    sqlcommand.CommandText = "Select * from Bookmark order by date_added desc";
                    da = new SqlDataAdapter(sqlcommand);
                    da.Fill(ds);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

            }
            ListView.DataSource = ds;
            ListView.DataBind();

        }


        private void bindSearchList()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand sqlcommand = new SqlCommand();
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    sqlcommand.Connection = connection;
                    sqlcommand.CommandText = "Select * from Bookmark";
                    da = new SqlDataAdapter(sqlcommand);
                    da.Fill(ds);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

            }

            searchList.DataSource = ds;
            searchList.DataBind();

        }

        protected void searchList_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (searchList.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.searchBind();
        }

        protected void SearchBind(object sender, EventArgs e)
        {
            this.searchBind();
        }
        
        private void searchBind()
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            SqlCommand sqlcommand = new SqlCommand();
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    sqlcommand.Connection = connection;
                    if (DropDownList.SelectedItem.Text == "title")
                    {
                        sqlcommand.CommandText = string.Format("SELECT * FROM Bookmark WHERE title like '%{0}%'", searchTextbox.Text);
                        //sqlcommand.Parameters.AddWithValue("@title", searchTextbox.Text);
                    }
                    else if (DropDownList.SelectedItem.Text == "description")
                    {
                        sqlcommand.CommandText = string.Format("SELECT * FROM Bookmark WHERE description like '%{0}%'", searchTextbox.Text);
                        //sqlcommand.CommandText = "SELECT * FROM Bookmark WHERE description LIKE '%@description%'";
                        //sqlcommand.Parameters.AddWithValue("@description", searchTextbox.Text);
                    }
                        // searching by tags
                    else
                    {
                        String[] searchingTags = searchTextbox.Text.Split(' ');
                        sqlcommand.CommandText = string.Format("SELECT * FROM Bookmark WHERE tags LIKE '%{0}%'",searchingTags[0]);
                        for (int i = 1; i < searchingTags.Length; i++ )
                        {
                            String tag = searchingTags[i];
                            sqlcommand.CommandText += string.Format(" OR tags LIKE '%{0}%'", tag);
                        }

                    }
                    da = new SqlDataAdapter(sqlcommand);
                    da.Fill(ds);
                    sqlcommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    //Handle exception, perhaps log it and do the needful
                }

            }

            searchList.DataSource = ds;
            searchList.DataBind();
        }

        private void showSaveLikeDislikeButtons()
        {
            if (Request.IsAuthenticated)
            {
                foreach (var item in ListView.Items)
                {
                    Button saveButton = (Button)item.FindControl("saveButton2");
                    Button likeButton = (Button)item.FindControl("likeButton");
                    Button dislikeButton = (Button)item.FindControl("dislikeButton");
                    if (saveButton != null)
                    {
                        saveButton.Visible = true;
                    }
                    if (likeButton != null)
                    {
                        likeButton.Visible = true;
                    }
                    if (dislikeButton != null)
                    {
                        dislikeButton.Visible = true;
                    }
                }
            }
        }

        private void showAdminDeleteButton()
        {
            if (User.IsInRole("admin"))
            {
                foreach (var item in ListView.Items)
                {
                    Button deleteButton = (Button)item.FindControl("deleteBookmark");
                    if (deleteButton != null)
                    {
                        deleteButton.Visible = true;
                    }
                }
            }
        }
    }
}