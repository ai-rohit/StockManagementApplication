using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void filterCustomerSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            DataView data = (DataView)filterCustomerSource.Select(DataSourceSelectArguments.Empty);
            bool duplicateNameOrEmail = data.Table.Rows.Count > 0;
            if (duplicateNameOrEmail)
            {
                msgLabel.Text = "Username or email already exists! Please try again.";
                msgLabel.Visible = true;
            }
            else {
                msgLabel.Visible = false;
                filterCustomerSource.InsertParameters["customerEmail"].DefaultValue = txtCustomerEmail.Text;
                filterCustomerSource.InsertParameters["customerName"].DefaultValue = txtCustomerName.Text;
                filterCustomerSource.InsertParameters["customerAddress"].DefaultValue = txtCustomerAddress.Text;
                filterCustomerSource.InsertParameters["customerContact"].DefaultValue = txtCustomerContact.Text;
                filterCustomerSource.InsertParameters["memberType"].DefaultValue = txtMemberType.Text;
               
                filterCustomerSource.Insert();
            }
        }
    }
}