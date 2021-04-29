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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
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
            }
            else {
                errorLabel.Text = "User already Registered";
            }
            }
    }
}