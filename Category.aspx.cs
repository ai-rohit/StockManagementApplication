using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StockManagementApplication
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            DataView dataview = (DataView)categoryDataSource2.Select(DataSourceSelectArguments.Empty);
            bool duplicate = dataview.Table.Rows.Count > 0;

            if (duplicate)
            {
                Response.Write("Duplicate Entry Found");
            }
            else {
                categoryDataSource2.InsertParameters["id"].DefaultValue = txtCategoryId.Text;
                categoryDataSource2.InsertParameters["Name"].DefaultValue = txtCategoryName.Text;
                categoryDataSource2.InsertParameters["Description"].DefaultValue = txtCategoryDescription.Text;

                categoryDataSource2.Insert();
                Response.Write("Data Inserted");
            }
        }
    }
}