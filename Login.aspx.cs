using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace StockManagementApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataView data = (DataView)loginDataSource.Select(DataSourceSelectArguments.Empty);

            bool authenticated = data.Table.Rows.Count > 0;

            if (authenticated)
            {
                FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
            }
            else {
                errorLabel.Visible = true;
                errorLabel.Text = "Email and password doesn't match";
            }
        }
    }
}