using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WebQLDaoTao
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.5.1.min.js",
                CdnPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js",
                CdnSupportsSecureConnection = true
            });
        }
    }
}