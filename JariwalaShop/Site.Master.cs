using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //btnLogout.TabIndex = 100;
            }
        }

        public bool HLEnabled
        {
            set
            {
                hlShop.Enabled = value;
                hlCart.Enabled = value;
                hlAccount.Enabled = value;
                hlOrder.Enabled = value;
                hlAddProduct.Enabled = value;
                hlEditProducts.Enabled = value;
            }
        }

        public string CartItems
        {
            set { lblCartItems.Text = value; }
            get { return lblCartItems.Text; }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.RedirectPermanent("~/Login");
        }
    }
}