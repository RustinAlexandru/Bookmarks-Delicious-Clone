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
    
    public partial class WebForm2 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        SqlCommand sqlcommand = new SqlCommand();
                        sqlcommand.Connection = connection;

                        String titleString = title.Text;
                        String URLString = URL.Text;
                        String DescriptionString = Description.Text;
                        String TagsString = Tags.Text;
                        String fileName = hiddenfield.Value;
                        String savePath = "~/Images/" + fileName;
                        String imgPathString = savePath; 
                        

                        sqlcommand.CommandText = "INSERT INTO Bookmark(title, description, tags, URL, img) VALUES(@title, @description, @tags, @url, @img)";
                        sqlcommand.Parameters.Add("@img", imgPathString);
                        sqlcommand.Parameters.Add("@title", titleString);
                        sqlcommand.Parameters.Add("@url", URLString);
                        sqlcommand.Parameters.Add("@description", DescriptionString);
                        sqlcommand.Parameters.Add("@tags", TagsString);
                        sqlcommand.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        //Handle exception, perhaps log it and do the needful
                    }

                }

                Response.Redirect("~/SuccessMessage.aspx?t=bg");
            }
            else
            {
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {


            String fileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            hiddenfield.Value = fileName;

            if (FileUpload1.HasFile)
            {
                String savePath = Server.MapPath("~/Images/") + fileName;

                FileUpload1.SaveAs(savePath);

                UploadStatusLabel.Text = "Your file was uploaded successfully.";

                
            }
            else
            {
                UploadStatusLabel.Text = "You did not specify a file to upload.";
            }
        }
    }
}