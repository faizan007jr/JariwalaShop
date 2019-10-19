using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.RedirectPermanent("~/Login");
            }
            else
            {
                lblUsername.Text = Session["username"].ToString();
                if (!IsPostBack)
                {
                    CartItemList cart = CartItemList.GetCart();
                    Master.CartItems = cart.Count.ToString();
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if (isValidPassword())
            {
                try
                {
                    sqlDSPwd.Update();
                    txtOldPwd.Text = "";
                    txtNewPwd.Text = "";
                    txtCPwd.Text = "";
                    lblSuccess.Text = "Password Updated Successfully.";
                    lblSuccess.Visible = true;
                }
                catch (Exception ex)
                {
                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }
            }
            else
            {
                lblError.Text = "Invalid Old Password.";
            }
        }

        private bool isValidPassword()
        {
            DataView customerTable;
            customerTable = (DataView)sqlDSPwd.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter = "pwd = '" + txtOldPwd.Text + "'";

            return (customerTable.Count == 1) ? true : false;
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }
    }
}