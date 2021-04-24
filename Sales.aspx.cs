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
        protected void Page_Load(object sender, EventArgs e)
        {

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
                }
               
            }
            catch (Exception ex)
            {
                Console.WriteLine("Something wEnt wrong");
            }
        }
    }
}