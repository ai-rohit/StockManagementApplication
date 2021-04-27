using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView itemData = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (!Page.IsPostBack)
            {
               
                if (itemData.Table.Rows.Count > 0)
                {
                    string Data = "";
                    foreach (DataRowView drvSql in itemData)
                    {
                        
                        Data = Data + drvSql["itemName"].ToString();

                    }
                    string message = $"alert('Some items are low on stocks! They are: {Data}')";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", message , true);
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