using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace StockManagementApplication
{
    public partial class Sales : System.Web.UI.Page
    {
       
        int lineTotal;

        DataTable cart = new DataTable();

        //Page Load event method
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                InitiateCart();
            }
        }

        //Drop down index changed method
        protected void dropDnItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            getLineTotal();
        }

        //Text box input change method
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            getLineTotal();
        }

        //getting line total from input intem and quantity to be purchased
        public void getLineTotal() {
            try
            {
                DataView dvSql = (DataView)itemDataSource2.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView drvSql in dvSql)
                { 
                    lineTotal = Int32.Parse(drvSql["itemPrice"].ToString()) * Int32.Parse(txtQuantity.Text);
                    txtLineTotal.Text = lineTotal.ToString();
                    lblQuantity.Text = drvSql["quantity"].ToString();
                    lblSelectedItem.Text = drvSql["itemName"].ToString();
                    lblItemCategory.Text = drvSql["name"].ToString();
                    lblItemPrice.Text = drvSql["itemPrice"].ToString();
                }
               
            }
            catch (Exception ex)
            {
                msgLabel.Text = "Something went wrong";
            }
        }

        //Button click evevnt method for adding items to cart.
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                AddToCart();
            }
            catch (Exception ex) {
                lblCartMessage.Text = "Something went wrong while adding items to cart!";
                lblCartMessage.Visible = true;
            }
        }

        //Method to initiate the cart in sales page
        public void InitiateCart() {
            try
            {
                if (Session["Cart"] == null)
                {
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.TableName = "Cart";
                    dt.Columns.Add(new DataColumn("ItemId", typeof(int)));
                    dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
                    dt.Columns.Add(new DataColumn("Category", typeof(string)));
                    dt.Columns.Add(new DataColumn("Price", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
                    dt.Columns.Add(new DataColumn("LineTotal", typeof(decimal)));

                    dr = dt.NewRow();
                    dt.Rows.Add(dr);

                    Session["Cart"] = dt;

                    grdCart.DataSource = dt;
                    grdCart.DataBind();
                }
                else
                {
                    DataTable dt = (DataTable)Session["Cart"];
                    grdCart.DataSource = dt;
                    grdCart.DataBind();
                }
            }
            catch (Exception ex) {
                lblCartMessage.Text = "Something went wrong";
                lblCartMessage.Visible = true;
            }

}

        //method to add items to the cart
        public void AddToCart() {
            if (Int32.Parse(lblQuantity.Text) < Int32.Parse(txtQuantity.Text)) {
                lblCartMessage.Text = "The quantity you selected exceeds the quantity on stock for the item!";
                lblCartMessage.Visible = true;
                return;
            }

            if (lblCustomer.Text == "Customer Id" || dropDnCustomer.SelectedValue == lblCustomer.Text)
            {
                lblCustomer.Text = dropDnCustomer.SelectedValue;
                msgLabel.Visible = false;
                if (Session["Cart"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)Session["Cart"];
                    DataRow drCurrentRow = null;
                    foreach (DataRow dr in dtCurrentTable.Rows)
                    {
                        if (dr["ItemId"].ToString() == dropDnItem.SelectedItem.Value)
                        {
                            msgLabel.Text = "*Item already in cart! Need to remove the item from cart to add again";
                            msgLabel.Visible = true;
                            return;
                        }
                    }
                    if (dtCurrentTable.Rows.Count > 0)
                    {

                        for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                        {
                            drCurrentRow = dtCurrentTable.NewRow();
                            drCurrentRow["ItemId"] = Int32.Parse(dropDnItem.SelectedValue);
                            drCurrentRow["ItemName"] = lblSelectedItem.Text;
                            drCurrentRow["Category"] = lblItemCategory.Text;
                            drCurrentRow["Price"] = lblItemPrice.Text;
                            drCurrentRow["Quantity"] = Int32.Parse(txtQuantity.Text);
                            drCurrentRow["LineTotal"] = Int32.Parse(txtLineTotal.Text);
                        }

                        if (dtCurrentTable.Rows[0][0].ToString() == "")
                        {
                            dtCurrentTable.Rows[0].Delete();
                            dtCurrentTable.AcceptChanges();

                        }
                        lblCartMessage.Visible = false;
                        //add created Rows into dataTable  
                        dtCurrentTable.Rows.Add(drCurrentRow);
                        //Save Data table into view state after creating each row  
                        Session["Cart"] = dtCurrentTable;
                        //Bind Gridview with latest Row  
                        grdCart.DataSource = dtCurrentTable;
                        grdCart.DataBind();

                        int total = CalculateTotalAmount();
                        lblTotalValue.Text = total.ToString();
                    }
                }
            }
            else
            {
                lblCartMessage.Text = "The customer you selected is different than the customer in cart! Please try again";
                lblCartMessage.Visible = true;
                return;     
            }
        }

        //calculate total amount based on price of items added in cart
        private int CalculateTotalAmount() {
            int totalAmount = 0;
            DataTable cartTable = (DataTable)Session["Cart"];
            foreach (DataRow dr in cartTable.Rows)
            {
                if (dr["ItemId"].ToString() == "")
                {
                    totalAmount = 0;
                }
                else
                {
                    totalAmount = totalAmount + Int32.Parse(dr["LineTotal"].ToString());

                }
            }
            return totalAmount;
        }

        //Event method for purchase button
        protected void btnPurchase_Click(object sender, EventArgs e)
        {
         
            try
            {
                int totalAmount = 0;
                DataTable cartTable = (DataTable)Session["Cart"];
                /*lblQuantity.Text = cartTable.Rows.Count.ToString();*/
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

              /*  if (selectedDate.Date < minDate.Date||selectedDate.Date>today.Date) {
                    msgLabel.Text = "Date is not valid";
                    return;
                }*/
                msgLabel.Visible = false;
                String strConnString = ConfigurationManager.ConnectionStrings["StockConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConnString);
                String query = "Insert into Sales values (@customerId, @billingDate, @totalAmount); Select SCOPE_IDENTITY();";
                String quantityQuery = "Update Items Set quantity = quantity- @selectedQuantity where itemId = @itemId";
                String orderDetailsQuery = "Insert into Order_details values (@itemId, @quantity, @lineTotal, @salesId)";


                conn.Open();
                //SqlTransaction transaction = conn.BeginTransaction();
                try
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@customerId", lblCustomer.Text);
                    cmd.Parameters.AddWithValue("@billingDate", txtBillingDate.Text);
                    cmd.Parameters.AddWithValue("@totalAmount", totalAmount.ToString());

                    int salesId = Convert.ToInt32(cmd.ExecuteScalar());

                    /* Console.WriteLine(salesId);*/
                    lblCustomer.Text = salesId.ToString();
                    lblCustomer.Visible = true;

                    DataView orderData = (DataView)OrderDetailsDataSource.Select(DataSourceSelectArguments.Empty);
                    foreach (DataRow dr in cartTable.Rows)
                    {
                        OrderDetailsDataSource.InsertParameters["itemId"].DefaultValue = dr["ItemId"].ToString();
                        OrderDetailsDataSource.InsertParameters["quantity"].DefaultValue = dr["Quantity"].ToString();
                        OrderDetailsDataSource.InsertParameters["lineTotal"].DefaultValue = dr["LineTotal"].ToString();
                        OrderDetailsDataSource.InsertParameters["salesId"].DefaultValue = salesId.ToString();

                        OrderDetailsDataSource.Insert();

                        cmd = new SqlCommand(quantityQuery, conn);
                        cmd.Parameters.AddWithValue("@selectedQuantity", dr["Quantity"].ToString());
                        cmd.Parameters.AddWithValue("@itemId", dr["ItemId"].ToString());
                        cmd.ExecuteNonQuery();
                    }
                   /* transaction.Commit();*/
                    lblCustomer.Text = "Customer Id";
                    clearAndInitiateCart();
                }
                catch (Exception ex) {
                   // transaction.Rollback();
                    msgLabel.Text = ex.Message;
                    msgLabel.Visible = true;
                }

            }
            catch (Exception ex) {
                msgLabel.Text = "Something went wrong while making purchase";
                msgLabel.Visible = true;
            }
                  
        }
        
        //Method to clear the cart and initiate it
        public void clearAndInitiateCart() {
            Session["Cart"] = null;
            lblCustomer.Text = "Customer Id";
            lblTotalValue.Text = "0";
            if (Session["Cart"] == null)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.TableName = "Cart";
                dt.Columns.Add(new DataColumn("ItemId", typeof(int)));
                dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
                dt.Columns.Add(new DataColumn("Category", typeof(string)));
                dt.Columns.Add(new DataColumn("Price", typeof(decimal)));
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

        //Row command event method for command field in grid view
        protected void grdCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            /*lblQuantity.Text = cartTable.Rows.Count.ToString();*/
           
            if (e.CommandName == "RemoveCart") {
                int index = Convert.ToInt32(e.CommandArgument);
                removeItemFromCart(index);

            }
        }

        //method to remove items form the cart
        public void removeItemFromCart(int index) {
            try
            {
                DataTable cartTable = (DataTable)Session["Cart"];

                foreach (DataRow dr in cartTable.Rows)
                {
                    if (dr["ItemId"].ToString() == "")
                    {
                        msgLabel.Text = "There is no item in cart to delete";
                        msgLabel.Visible = true;
                        return;
                    }

                }
              
                cartTable.Rows[index].Delete();
               
                int total = CalculateTotalAmount();
                lblTotalValue.Text = total.ToString();
                if (cartTable.Rows.Count < 1)
                {
                    clearAndInitiateCart();
                    lblCustomer.Text = "Customer Id";
                }
                else
                {
                    grdCart.DataSource = cartTable;
                    grdCart.DataBind();
                    
                }
            }
            catch (Exception ex)
            {
                msgLabel.Text = "Something went wrong while removing item from cart";
            }
        }

    }
}