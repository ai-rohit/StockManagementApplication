using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class ItemDetails : System.Web.UI.Page
    {
        //Page Load event Method for ItemDetails Class 
        protected void Page_Load(object sender, EventArgs e)
        {
            //checking session
            if (Session["ItemId"] == null || Session["ItemId"].ToString() == "")
            {
                Response.Redirect("~/Items.aspx");
            }
            else {
                string itemId = (string)Session["ItemId"];
                txtItemId.Text = itemId;
                //getting data from session an data source
                DataView data = (DataView)itemDetailsSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView drvSql in data)
                {
                   
                    itemName.Text = drvSql["itemName"].ToString();
                    category.Text = drvSql["name"].ToString();
                    purchasedDate.Text = drvSql["purchaseDate"].ToString();
                    availableQuantity.Text = drvSql["quantity"].ToString();
                    unitPrice.Text = drvSql["itemPrice"].ToString();
                    manufactureDate.Text = drvSql["manufacturedDate"].ToString();
                    expiryDate.Text = drvSql["expiryDate"].ToString();

                    itemName.Visible = true;
                    category.Visible = true;
                    purchasedDate.Visible = true;
                    availableQuantity.Visible = true;
                    unitPrice.Visible = true;
                    manufactureDate.Visible = true;
                    expiryDate.Visible = true;
                }
            }
        }

        
    }
}