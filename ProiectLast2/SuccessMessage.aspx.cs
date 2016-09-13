using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProiectLast2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void literal_Init(object sender, EventArgs e)
        {
            String type = Request.QueryString["t"];
            if (type == "c")
            {
                literal.Text = "Comment successfully added!";
            }
            else if (type == "bp")
            {
                literal.Text = "Bookmark successfully added to your profile!";
            }
            else if (type == "db")
            {
                literal.Text = "Bookmark successfully deleted from the site!";
            }
            else
            {
                literal.Text = "Bookmark successfully added to the site!";
            }
        }

    }
}