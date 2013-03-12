using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_ACMSTextBox_JavaScript_tiny_mce_plugins_FileManager_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthenticateFileManager();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }



  public void AuthenticateFileManager()
    {

        if (Session["userID"] == null)
        {
            Response.Clear();
            Response.Write("Access Denied");
            Response.End();
        }

    }
}