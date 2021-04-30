using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;

namespace StockManagementApplication
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView itemData = (DataView)itemStockDataSource.Select(DataSourceSelectArguments.Empty);
            if (!Page.IsPostBack)
            {

                if (itemData.Table.Rows.Count > 0)
                {
                    List<string> itemList = new List<string>();
                   
                    foreach (DataRowView drvSql in itemData)
                    {
                        itemList.Add(drvSql["itemName"].ToString());
                    }
                    string[] itemListArray = itemList.ToArray();
                    string serializedItems = (new JavaScriptSerializer()).Serialize(itemListArray);
                    string title = "Low Stock";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowUp('" + title + "', '" + serializedItems + "');", true);
                }

                DataView sales = (DataView)salesNumDataSource.Select(DataSourceSelectArguments.Empty);
                DataView item = (DataView)itemNumDataSource.Select(DataSourceSelectArguments.Empty);
                DataView customers = (DataView)numCustDataSource.Select(DataSourceSelectArguments.Empty);

                foreach (DataRowView numOfSales in sales)
                {
                    string numSales = numOfSales["numSales"].ToString();
                   lblNumSales.Text = numSales;
                }
                foreach (DataRowView numOfItems in item)
                {
                    string numItem = numOfItems["numItems"].ToString();
                    lblNumItems.Text = numItem;
                }
                foreach (DataRowView numOfCust in customers)
                {
                    string numCustomer = numOfCust["numCustomer"].ToString();
                    lblNumCustomers.Text = numCustomer;
                }

            }

            if (Session["UserEmail"] != null && Session["UserEmail"].ToString() != "")
            {
                return;

            }
            else {
                Response.Redirect("~/Login.aspx");
            }
        }

       
    }
}