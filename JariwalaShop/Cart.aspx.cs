using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.RedirectPermanent("~/Login");
            }
            else
            {
                cart = CartItemList.GetCart();
                if (!IsPostBack)
                {
                    Master.CartItems = cart.Count.ToString();
                    this.displayCart();
                }
            }
        }

        private void displayCart()
        {
            lstCart.Items.Clear();
            for (int i = 0; i < cart.Count; i++)
                lstCart.Items.Add(cart[i].Display());
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                var parInvoice = sqlDBInvoice.InsertParameters;
                parInvoice["email"].DefaultValue = Session["username"].ToString();
                parInvoice["date"].DefaultValue = DateTime.Now.ToString();
                sqlDBInvoice.Insert();

                string invoiceID = getInvoiceID(Session["username"].ToString(),
                    DateTime.Now.ToString());

                for (int i = 0; i < cart.Count; i++)
                {
                    var parOrder = sqlDBOrder.InsertParameters;
                    parOrder["invoice_id"].DefaultValue = invoiceID;
                    parOrder["product_code"].DefaultValue = cart[i].Product.ProductCode.ToString();
                    parOrder["quantity"].DefaultValue = cart[i].Quantity.ToString();

                    var parProduct = sqlDBProduct.UpdateParameters;
                    decimal newQty = getQuantity(cart[i].Product.ProductCode) - (cart[i].Quantity / 1000);
                    parProduct["product_code"].DefaultValue = cart[i].Product.ProductCode.ToString();
                    parProduct["quantity"].DefaultValue = newQty.ToString();
                    try
                    {
                        sqlDBOrder.Insert();
                        sqlDBProduct.Update();
                        EmptyCart();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = DatabaseErrorMessage(ex.Message);
                        lblMessage.Visible = true;
                    }
                }
                Master.CartItems = cart.Count.ToString();
                lblMessage.Text = "Thank You for Shopping!";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Cart is Empty.";
                lblMessage.Visible = true;
            }
        }

        private string getInvoiceID(string user, string dt)
        {
            DataView invoiceTable;
            invoiceTable = (DataView)sqlDBInvoice.Select(DataSourceSelectArguments.Empty);
            invoiceTable.RowFilter = "email = '" + user + "' AND date = '" + dt + "'";
            DataRowView row = invoiceTable[0];
            return row["invoice_id"].ToString();
        }

        private decimal getQuantity(int pid)
        {
            DataView productTable;
            productTable = (DataView)sqlDBProduct.Select(DataSourceSelectArguments.Empty);
            productTable.RowFilter = "product_code = " + pid;
            DataRowView row = productTable[0];
            return (decimal)row["quantity"];
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }

        private void EmptyCart()
        {
            lblMessage.Text = "";
            cart.Clear();
            this.displayCart();
            Master.CartItems = cart.Count.ToString();
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                EmptyCart();
            }
            else
            {
                lblMessage.Text = "Cart is Empty.";
                lblMessage.Visible = true;
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0 && lstCart.SelectedIndex >= 0)
            {
                lblMessage.Text = "";
                cart.RemoveAt(lstCart.SelectedIndex);
                this.displayCart();
                Master.CartItems = cart.Count.ToString();
            }
            else
            {
                lblMessage.Text = "Please select the item to remove.";
                lblMessage.Visible = true;
            }
        }
    }
}