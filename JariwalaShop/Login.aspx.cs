using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.HLEnabled = false;
                txtUsername.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (isCredentialCorrect())
            {
                Session.Add("username", txtUsername.Text);
                if (ckbAdmin.Checked) Session.Add("admin", "true");
                else Session.Add("admin", "false");
                Response.Redirect("~/Shop");
            }
            else
            {
                lblError.Text = "Invalid Username or Password!";
            }
        }

        private bool isCredentialCorrect()
        {
            DataView userData;
            if (ckbAdmin.Checked)
            {
                userData = (DataView)sqlDSAdminLogin.Select(DataSourceSelectArguments.Empty);
            }
            else
            {
                userData = (DataView)sqlDSUserLogin.Select(DataSourceSelectArguments.Empty);
            }
            DataRowView row = userData[0];

            return ((Int32)row["count"]) == 1 ? true : false;
        }
    }
}