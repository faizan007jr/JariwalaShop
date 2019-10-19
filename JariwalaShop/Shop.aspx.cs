using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Shop : System.Web.UI.Page
    {
        private Product selectedProduct;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["username"] as string))
            {
                Response.RedirectPermanent("~/Login");
            }
            else
            {
                if (!IsPostBack)
                {
                    CartItemList cart = CartItemList.GetCart();
                    Master.CartItems = cart.Count.ToString();
                }
            }
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                if (IsValid)
                {
                    TextBox qtytxtbox = (TextBox)(e.Item.FindControl("txtQuantity"));

                    selectedProduct = GetSelectedProduct(Convert.ToInt32(e.CommandArgument),
                        Convert.ToDecimal(qtytxtbox.Text));

                    CartItemList cart = CartItemList.GetCart();
                    CartItem cartItem = cart[selectedProduct.ProductCode.ToString()];

                    if (cartItem == null)
                        cart.AddItem(selectedProduct, Convert.ToDecimal(qtytxtbox.Text));
                    else
                        cartItem.AddQuantity(Convert.ToDecimal(qtytxtbox.Text));

                    Master.CartItems = cart.Count.ToString();
                }
            }
        }

        private Product GetSelectedProduct(int productCode, decimal qty)
        {
            DataView productsTable = (DataView)sqlDSProducts.Select(DataSourceSelectArguments.Empty);
            productsTable.RowFilter = "product_code = " + productCode;
            DataRowView row = productsTable[0];

            Product p = new Product();
            p.ProductCode = (int)row["product_code"];
            p.Name = row["product_name"].ToString();
            p.Image = row["img"].ToString();
            p.Size = (int)row["size"];
            p.Price = (int)row["price"];
            p.Quantity = qty;

            return p;
        }
    }
}