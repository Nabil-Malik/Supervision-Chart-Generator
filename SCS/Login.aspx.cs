using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = 1, j = 1;
        label: i++;
        j += 1;
        if (i < 10)
        {
            Response.Write(i+"");
            goto label;
        }


    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (FormsAuthentication.Authenticate(Login1.UserName, Login1.Password))
        {
            Session["username"] = "Admin";
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
        }
        else
        {
            Response.Write("You r not authenticated");
        }
    }
}