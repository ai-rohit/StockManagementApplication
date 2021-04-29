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
            }

            if (Session["UserEmail"] != null && Session["UserEmail"].ToString() != "")
            {
                lblUserEmail.Text = Session["UserEmail"].ToString();

            }
            else {
                lblUserEmail.Text = "Anonymous User";
            }
        }

       
    }
}