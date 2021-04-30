using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace StockManagementApplication
{
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userId.Text = (string)Session["UserId"];
            userName.Text = (string)Session["UserName"];
            email.Text = (string)Session["UserEmail"];
            address.Text = (string)Session["UserAddress"];
            contactNumber.Text = (string)Session["UserContact"];
            userName.Visible = true;
            email.Visible = true;
            address.Visible = true;
            contactNumber.Visible = true;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try { 
            DataView data = (DataView)passwordDataSource.Select(DataSourceSelectArguments.Empty);
            bool passwordMatched = data.Table.Rows.Count > 0;

            if (passwordMatched)
            {
                if (txtNewPassword.Text != txtConfirmPassword.Text) {
                    msgLabel.Text = "New password and confirm password doesnot match!";
                    msgLabel.Visible = true;
                }
                else {

                    string query = "Update Users set password = '" + txtNewPassword.Text + "' where userId = '" + userId.Text + "'";

                    using (SqlConnection connection = new SqlConnection(passwordDataSource.ConnectionString)) {
                        connection.Open();
                        try
                        {
                           
                            SqlCommand cmd = new SqlCommand(query, connection);
                            cmd.ExecuteNonQuery();
                            msgLabel.Text = "Old Password Matches";
                            
                        }
                        catch {
                            msgLabel.Text = "Something went wrong";
                            msgLabel.Visible = true;
                        }

                    }    
                }
            }
            else {
                msgLabel.Visible = true;
                msgLabel.Text = "Old Password doesn't match with your input password.";            
            }
            }
            catch
            {
                msgLabel.Text = "Something went wrong";
                msgLabel.Visible = true;
            }
        }
    }
}