using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class Reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.HLEnabled = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    sqlDSAddress.Insert();
                    var parameter = sqlDSCustomer.InsertParameters;
                    parameter["bill_address_id"].DefaultValue = getAddressID();
                    parameter["ship_address_id"].DefaultValue = getAddressID();
                    sqlDSCustomer.Insert();
                    Session.Add("username", txtEmail.Text);
                    Session.Add("admin", "false");
                    Response.RedirectPermanent("~/Shop");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }

        private string getAddressID()
        {
            DataView addressTable;
            addressTable = (DataView)sqlDSAddress.Select(DataSourceSelectArguments.Empty);
            addressTable.RowFilter = "line = '" + txtLine1.Text + "' AND city = '" + txtCity.Text + "' AND state = '" + txtState.Text + "' AND zipcode = '" + txtZipCode.Text + "'";
            DataRowView row = addressTable[0];
            return row["address_id"].ToString();
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