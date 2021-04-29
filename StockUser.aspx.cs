using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementApplication
{
    public partial class StockUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userType = (string)Session["UserType"];
            if (userType != "admin")
            {
                Response.Redirect("~/Dashboard.aspx");
            }
            else {
                return;
            }
        }
    }
}