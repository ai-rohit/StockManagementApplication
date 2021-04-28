﻿using System;
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                AddNewRecordRowToGrid();
            }
            catch (Exception ex) {
                lblCartMessage.Text = "Something went wrong while adding items to cart!";
                lblCartMessage.Visible = true;
            }
        }

        public void AddDefaultFirstRecord() {
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

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
          /*  DateTime minDate = DateTime.Parse("01/01/2018");
            DateTime today = DateTime.Today;
            DateTime selectedDate = Convert.ToDateTime(txtBillingDate.Text);*/
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

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@customerId", lblCustomer.Text);
                cmd.Parameters.AddWithValue("@billingDate", txtBillingDate.Text);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount.ToString());

                conn.Open();
                /*cmd.ExecuteNonQuery();*/
                var salesId = cmd.ExecuteScalar();
                conn.Close();
                Console.WriteLine(salesId);
                /* lblCustomer.Text = salesId.ToString();*/

                DataView orderData = (DataView)OrderDetailsDataSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow dr in cartTable.Rows)
                {
                    OrderDetailsDataSource.InsertParameters["itemId"].DefaultValue = dr["ItemId"].ToString();
                    OrderDetailsDataSource.InsertParameters["quantity"].DefaultValue = dr["Quantity"].ToString();
                    OrderDetailsDataSource.InsertParameters["lineTotal"].DefaultValue = dr["LineTotal"].ToString();
                    OrderDetailsDataSource.InsertParameters["salesId"].DefaultValue =salesId.ToString();

                    OrderDetailsDataSource.Insert();
                }
                lblCustomer.Text = "Customer Id";
                clearAndInitiateCart();

            }
            catch (Exception ex) {
                msgLabel.Text = "Something went wrong while making purchase";
                msgLabel.Visible = true;
            }
                  
        }
        public void clearAndInitiateCart() {
            Session.Clear();
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

        protected void grdCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            /*lblQuantity.Text = cartTable.Rows.Count.ToString();*/
           
            if (e.CommandName == "RemoveCart") {
                int index = Convert.ToInt32(e.CommandArgument);
                removeItemFromCart(index);

            }
        }

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