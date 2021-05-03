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

        //AddItems button click event method
        protected void btnAddItems_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtItemName.Text == "" || txtItemDesc.Text == "" || txtItemPrice.Text == "" || txtQuantity.Text == "" || Int32.Parse(txtQuantity.Text) < 1 || txtPurchaseDate.Text == "")
                {
                    errorMsg.Text = "*Some fields are missing or invalid! Please try again";
                    errorMsg.Visible = true;
                    return;
                }
                DataView dataview = (DataView)itemDataSource2.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataview.Table.Rows.Count > 0;

                if (duplicate)
                {
                    errorMsg.Visible = true;
                    errorMsg.Text = "*Item already in database! Please update through table if you want to update the item!";
                }
                else
                {
                    //adding items to table using datasource
                    itemDataSource2.InsertParameters["itemName"].DefaultValue = txtItemName.Text;
                    itemDataSource2.InsertParameters["itemDesc"].DefaultValue = txtItemDesc.Text;
                    itemDataSource2.InsertParameters["itemPrice"].DefaultValue = txtItemPrice.Text;
                    itemDataSource2.InsertParameters["purchaseDate"].DefaultValue = txtPurchaseDate.Text;
                    itemDataSource2.InsertParameters["category"].DefaultValue = dropCategory.SelectedItem.Value;
                    itemDataSource2.InsertParameters["manufacturedDate"].DefaultValue = txtManufactured.Text;
                    itemDataSource2.InsertParameters["expiryDate"].DefaultValue = txtExpiry.Text;
                    itemDataSource2.InsertParameters["quantity"].DefaultValue = txtQuantity.Text;
                    itemDataSource2.Insert();
                    grdItem.DataBind();
                    errorMsg.Visible = false;
                    txtItemName.Text = "";
                    txtExpiry.Text = "";
                    txtItemPrice.Text = "";
                    txtPurchaseDate.Text = "";
                    txtItemDesc.Text = "";
                    txtManufactured.Text = "";
                    txtQuantity.Text = "";
                    
                }
            }
            catch {
                errorMsg.Visible = true;
                errorMsg.Text = "*Something went wrong";
            }

        }

        protected void btnOldStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OldStock.aspx");
        }

        protected void btnNotPurchased_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NotPurchased.aspx");
        }

        protected void grdItem_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string data = grdItem.Rows[index].Cells[2].Text;

                Session["ItemId"] = data;
                Response.Redirect("~/ItemDetails.aspx");
            }
        }

        protected void btnSortItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OutOfStock.aspx");
        }

        protected void grdItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
               /* grdItem.Columns[3].Visible = false;*/
                 grdItem.Columns[8].Visible = false;
                grdItem.Columns[9].Visible = false;
            }
            
        }
    }
}