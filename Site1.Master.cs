﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementApplication
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        //Page Load event method
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserEmail"].ToString() == "")
            {
                Response.Redirect("~/Login.aspx");
                lblUser.Text = "Anonymous User";
            }
            else {
                lblUser.Text = Session["UserEmail"].ToString();
            }
        }

        //Method for logging out user
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            try
            {
                //Clearing session and redirecting user to Login page
                Session.Clear();
                Response.Redirect("~/Login.aspx");
            }
            catch (Exception ex) {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong logging out!')", true);
            }
        }
    }
}