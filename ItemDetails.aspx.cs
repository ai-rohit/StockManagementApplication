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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ItemId"] == null || Session["ItemId"].ToString() == "")
            {
                Response.Redirect("~/Items.aspx");
            }
            else {
                string itemId = (string)Session["ItemId"];
                txtItemId.Text = itemId;
                DataView data = (DataView)itemDetailsSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView drvSql in data)
                {
                    /*lineTotal = Int32.Parse(drvSql["itemPrice"].ToString()) * Int32.Parse(txtQuantity.Text);
                    txtLineTotal.Text = lineTotal.ToString();
                    lblQuantity.Text = drvSql["quantity"].ToString();
                    lblSelectedItem.Text = drvSql["itemName"].ToString();
                    lblItemCategory.Text = drvSql["name"].ToString();
                    lblItemPrice.Text = drvSql["itemPrice"].ToString();*/
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