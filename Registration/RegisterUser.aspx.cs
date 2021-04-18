using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                DataView data = (DataView)registrationDataSource.Select(DataSourceSelectArguments.Empty);
                bool duplicate = data.Table.Rows.Count > 0;
                if (!duplicate)
                {
                    //DateTime today = DateTime.Today;

                    registrationDataSource.InsertParameters["userEmail"].DefaultValue = txtEmail.Text;
                    registrationDataSource.InsertParameters["userName"].DefaultValue = txtUserName.Text;
                    registrationDataSource.InsertParameters["userAddress"].DefaultValue = txtUserAddress.Text;
                    registrationDataSource.InsertParameters["userContact"].DefaultValue = txtMobile.Text;
                    registrationDataSource.InsertParameters["userType"].DefaultValue = "Customer";
                    registrationDataSource.InsertParameters["password"].DefaultValue = txtPassword.Text;
                   
                    registrationDataSource.Insert();
                }
                else {
                    errorLabel.Visible = true;
                    errorLabel.Text = "Email entered is already in use";
                }
            }

        }
    }
}