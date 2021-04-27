using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace StockManagementApplication
{
    public partial class Sales : System.Web.UI.Page
    {
        int itemPrice;
        int quantity;
        int lineTotal;

        DataTable cart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                AddDefaultFirstRecord();
            }
        }

        protected void dropDnItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            getLineTotal();
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            getLineTotal();
        }

        public void getLineTotal() {
            try
            {
                DataView dvSql = (DataView)itemDataSource2.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView drvSql in dvSql)
                { 
                    lineTotal = Int32.Parse(drvSql["itemPrice"].ToString()) * Int32.Parse(txtQuantity.Text);
                    txtLineTotal.Text = lineTotal.ToString();
                    lblQuantity.Text = drvSql["quantity"].ToString();
                }
               
            }
            catch (Exception ex)
            {
                Console.WriteLine("Something wEnt wrong");
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            AddNewRecordRowToGrid();
        }

        public void AddDefaultFirstRecord() {
            if (Session["Cart"] == null)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.TableName = "Cart";
                dt.Columns.Add(new DataColumn("ItemId", typeof(int)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
                dt.Columns.Add(new DataColumn("LineTotal", typeof(decimal)));

                dr = dt.NewRow();
                dt.Rows.Add(dr);

                Session["Cart"] = dt;

                grdCart.DataSource = dt;
                grdCart.DataBind();
        }
            else {
                DataTable dt = (DataTable)Session["Cart"];
                 grdCart.DataSource = dt;
                grdCart.DataBind();
         }

}

        public void AddNewRecordRowToGrid() {
            if (lblCustomer.Text == "Customer Id" || dropDnCustomer.SelectedValue == lblCustomer.Text)
            {
                lblCustomer.Text = dropDnCustomer.SelectedValue;
                msgLabel.Visible = false;
                if (Session["Cart"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)Session["Cart"];
                    DataRow drCurrentRow = null;

                    if (dtCurrentTable.Rows.Count > 0)
                    {

                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {
                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["ItemId"] = Int32.Parse(dropDnItem.SelectedValue);
                            drCurrentRow["Quantity"] = Int32.Parse(txtQuantity.Text);
                            drCurrentRow["LineTotal"] = Int32.Parse(txtLineTotal.Text);
                        }
                        if (dtCurrentTable.Rows[0][0].ToString() == "")
                        {
                            dtCurrentTable.Rows[0].Delete();
                            dtCurrentTable.AcceptChanges();

                        }

                        //add created Rows into dataTable  
                        dtCurrentTable.Rows.Add(drCurrentRow);
                        //Save Data table into view state after creating each row  
                        Session["Cart"] = dtCurrentTable;
                        //Bind Gridview with latest Row  
                        grdCart.DataSource = dtCurrentTable;
                        grdCart.DataBind();
                    }
                }
            }
            else
            {
                msgLabel.Text = "The customer you selected is different than the customer in cart! Please try again";
                msgLabel.Visible = true;
                return;     
            }
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            int totalAmount = 0;
            DataTable cartTable = (DataTable)Session["Cart"];
            lblQuantity.Text = cartTable.Rows.Count.ToString();
            foreach (DataRow dr in cartTable.Rows) {
                if (dr["ItemId"].ToString() == "") {
                    msgLabel.Text = "Cart is empty to make purchase";
                    msgLabel.Visible = true;
                    return;
                }
                else {
                    totalAmount = totalAmount + Int32.Parse(dr["LineTotal"].ToString());
                  
                }
            }
                     msgLabel.Visible = false;
                    lblQuantity.Text = "Something in cart";
                    salesDataSource.InsertParameters["customerId"].DefaultValue = lblCustomer.Text;
                    salesDataSource.InsertParameters["billingDate"].DefaultValue = txtBillingDate.Text;
                    salesDataSource.InsertParameters["totalAmount"].DefaultValue = totalAmount.ToString();

                    salesDataSource.Insert();
                    lblQuantity.Text = "Data Inserted Successfully";
                    
                    clearAndInitiateCart();
            
           /* foreach (DataRow dr in cartTable.Rows) {
               
                totalAmount = totalAmount +Int32.Parse( dr["LineTotal"].ToString());
              
            }
           */
        }
        public void clearAndInitiateCart() {
            Session.Clear();
            if (Session["Cart"] == null)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.TableName = "Cart";
                dt.Columns.Add(new DataColumn("ItemId", typeof(int)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
                dt.Columns.Add(new DataColumn("LineTotal", typeof(decimal)));

                dr = dt.NewRow();
                dt.Rows.Add(dr);

                Session["Cart"] = dt;

                grdCart.DataSource = dt;
                grdCart.DataBind();
            }
        }

        protected void grdCart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}