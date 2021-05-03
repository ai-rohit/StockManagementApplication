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

        //Register button click event method
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
                //checking if page is valid
                if (Page.IsValid)
                {
                    DataView data = (DataView)registrationDataSource.Select(DataSourceSelectArguments.Empty);
                    bool duplicate = data.Table.Rows.Count > 0;
                    if (!duplicate)
                    {
                        //DateTime today = DateTime.Today;
                        //Inserting data into data source
                        registrationDataSource.InsertParameters["userEmail"].DefaultValue = txtEmail.Text;
                        registrationDataSource.InsertParameters["userName"].DefaultValue = txtUserName.Text;
                        registrationDataSource.InsertParameters["userAddress"].DefaultValue = txtUserAddress.Text;
                        registrationDataSource.InsertParameters["userContact"].DefaultValue = txtMobile.Text;
                        registrationDataSource.InsertParameters["userType"].DefaultValue = "user";
                        registrationDataSource.InsertParameters["password"].DefaultValue = txtPassword.Text;

                        registrationDataSource.Insert();
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
                        errorLabel.Text = "Email entered is already in use";
                    }
                }
            }
            catch {
                errorLabel.Text = "*Something went wrong";
                errorLabel.Visible = true;
            }

        }
    }
}