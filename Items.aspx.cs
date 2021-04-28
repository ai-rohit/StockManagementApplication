using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class Items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddItems_Click(object sender, EventArgs e)
        {
            DataView dataview = (DataView)itemDataSource2.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;

            if (duplicate)
            {
                Response.Write("Duplicate Entry Found");
            }
            else
            {
                itemDataSource2.InsertParameters["itemName"].DefaultValue = txtItemName.Text;
                itemDataSource2.InsertParameters["itemDesc"].DefaultValue = txtItemDesc.Text;
                itemDataSource2.InsertParameters["itemPrice"].DefaultValue = txtItemPrice.Text;
                itemDataSource2.InsertParameters["purchaseDate"].DefaultValue = txtPurchaseDate.Text;
                itemDataSource2.InsertParameters["category"].DefaultValue = dropCategory.SelectedItem.Value;
                itemDataSource2.InsertParameters["manufacturedDate"].DefaultValue = txtManufactured.Text;
                itemDataSource2.InsertParameters["expiryDate"].DefaultValue = txtExpiry.Text;
                itemDataSource2.InsertParameters["quantity"].DefaultValue = txtQuantity.Text;
                itemDataSource2.Insert();
            }

        }

        protected void btnOldStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerPurchase.aspx");
        }
    }
}