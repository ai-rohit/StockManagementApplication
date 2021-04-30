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
            try
            {
                if (txtCategoryName.Text == "" || txtCategoryDescription.Text == "")
                {
                    errorMsg.Text = "*Some field seems to be empty!";
                    errorMsg.Visible = true;
                    return;
                }

                DataView dataview = (DataView)categoryDataSource2.Select(DataSourceSelectArguments.Empty);
                bool duplicate = dataview.Table.Rows.Count > 0;

                if (duplicate)
                {
                    errorMsg.Text = "Category already exists";
                    errorMsg.Visible = true;
                }
                else
                {
                    errorMsg.Visible = false;
                    /*categoryDataSource2.InsertParameters["id"].DefaultValue = txtCategoryId.Text;*/
                    categoryDataSource2.InsertParameters["Name"].DefaultValue = txtCategoryName.Text;
                    categoryDataSource2.InsertParameters["Description"].DefaultValue = txtCategoryDescription.Text;

                    categoryDataSource2.Insert();
                    grdCategory.DataBind();
                    txtCategoryName.Text = "";
                    txtCategoryDescription.Text = "";
                }
            }
            catch {
                errorMsg.Text = "*Somethng went wrong!";
                errorMsg.Visible = true;
            }
        }

        protected void categoryDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void grdCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewItems")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string data = grdCategory.Rows[index].Cells[2].Text;

                catId.Text = data;
                grdCategoryItems.Visible = true;
                lblItemCategory.Visible = true;
            }
        }
    }
}