using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                if (Session["admin"].ToString() == "true")
                {
                    if (!IsPostBack)
                    {
                        gvProducts.DataBind();
                    }
                }
                else
                {
                    Response.RedirectPermanent("~/Shop");
                }
            }
            else
            {
                Response.RedirectPermanent("~/Login");
            }
        }
    }
}