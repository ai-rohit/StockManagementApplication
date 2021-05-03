using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class StockUser : System.Web.UI.Page
    {
        //PageLoad event method
        protected void Page_Load(object sender, EventArgs e)
        {
            //authorizing admin only using session
            string userType = (string)Session["UserType"];
            if (userType != "admin")
            {
                string body = "Acess is denied";
                string title = "Access Denied! You will now be redirected to customers page";
                string icon = "warning";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "ShowProfileAlert('" + title + "', '" + body + "', '" + icon + "');", true);
               /* Response.Redirect("~/User.aspx");*/
            }
            else {
                return;
            }
        }

        //Event method for Register button to add user
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmail.Text == "" || txtMobile.Text == "" || txtUserName.Text == "" || txtUserAddress.Text == "" || txtPassword.Text == "" || txtConfirmPassword.Text == "")
                {
                    errorLabel.Visible = true;
                    errorLabel.Text = "*Some fields are missing! Please try again.";
                    return;
                }
                if (txtConfirmPassword.Text != txtPassword.Text)
                {
                    errorLabel.Visible = true;
                    errorLabel.Text = "*Password and cofirm password doesnot match!";
                    return;
                }
                DataView data = (DataView)filterUserSource.Select(DataSourceSelectArguments.Empty);
                bool duplicate = data.Table.Rows.Count > 0;
                if (!duplicate)
                {
                    filterUserSource.InsertParameters["userEmail"].DefaultValue = txtEmail.Text;
                    filterUserSource.InsertParameters["userName"].DefaultValue = txtUserName.Text;
                    filterUserSource.InsertParameters["userAddress"].DefaultValue = txtUserAddress.Text;
                    filterUserSource.InsertParameters["userContact"].DefaultValue = txtMobile.Text;
                    filterUserSource.InsertParameters["userType"].DefaultValue = "user";
                    filterUserSource.InsertParameters["password"].DefaultValue = txtPassword.Text;

                    filterUserSource.Insert();
                    grdUsers.DataBind();
                    errorLabel.Visible = false;
                    txtEmail.Text = "";
                    txtMobile.Text = "";
                    txtUserName.Text = "";
                    txtUserAddress.Text = "";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";

                }
                else
                {
                    errorLabel.Visible = true;
                    errorLabel.Text = "*User already Registered";
                }
            }
            catch {
                errorLabel.Visible = true;
                errorLabel.Text = "*Something went wrong";
            }
        }
    }
}