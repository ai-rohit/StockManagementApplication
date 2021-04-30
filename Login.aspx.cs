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
            try
            {
                if (txtEmail.Text == "" || txtPassword.Text == "")
                {
                    errorLabel.Visible = true;
                    errorLabel.Text = "*Some fields seems to be empty. Please try again!";
                    return;
                }
                DataView data = (DataView)loginDataSource.Select(DataSourceSelectArguments.Empty);

                bool authenticated = data.Table.Rows.Count > 0;

                if (authenticated)
                {
                    Session["UserEmail"] = txtEmail.Text.ToString();
                    foreach (DataRowView drvSql in data)
                    {
                        Session["UserType"] = drvSql["userType"].ToString();
                        Session["UserId"] = drvSql["userId"].ToString();
                        Session["UserName"] = drvSql["userName"].ToString();
                        Session["UserAddress"] = drvSql["userAddress"].ToString();
                        Session["UserContact"] = drvSql["userContact"].ToString();
                    }
                    FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
                    errorLabel.Visible = false;
                }
                else
                {
                    errorLabel.Visible = true;
                    errorLabel.Text = "*Email and password doesn't match";
                }
            }
            catch {
                errorLabel.Visible = true;
                errorLabel.Text = "Something went wrong";
            }
        }
    }
}