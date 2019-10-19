using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JariwalaShop
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                if (Session["admin"].ToString() == "true")
                {
                    Checkcategory.InputAttributes.Add("class", "custom-control-input");
                    Checkcategory.LabelAttributes.Add("class", "custom-control-label");
                    if (!IsPostBack)
                    {
                        ddlCategory.DataBind();
                        ddlCategory.Focus();
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

        protected void Checkcategory_CheckedChanged(object sender, EventArgs e)
        {
            if (Checkcategory.Checked)
            {
                ddlCategory.Visible = false;
                txtCategory.Visible = true;
                rfvCategory.ControlToValidate = "txtCategory";
            }
            else
            {
                ddlCategory.Visible = true;
                txtCategory.Visible = false;
                rfvCategory.ControlToValidate = "ddlCategory";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                string ext = Path.GetExtension(fuImage.FileName).ToLower();
                if (ext != ".jpeg" && ext != ".jpg" && ext != ".png" && ext != "gif")
                {
                    rfvImage.Text = "Only Image are allowed!";
                    rfvImage.IsValid = false;
                }
                else
                {
                    fuImage.SaveAs(Server.MapPath("~/Images/" + fuImage.FileName));
                    rfvImage.Text = "Required";
                    rfvImage.IsValid = true;
                }

                var parameters = sqlDSProduct.InsertParameters;
                parameters["product_name"].DefaultValue = txtName.Text;

                if (Checkcategory.Checked)
                {
                    var parameter = sqlDSCategory.InsertParameters;
                    parameter["category_name"].DefaultValue = txtCategory.Text;
                    try
                    {
                        sqlDSCategory.Insert();
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = $"<b>1. A database error has occurred:</b> {ex.Message}";
                    }

                    parameters["category_id"].DefaultValue = getInsertedCategoryID();
                    txtCategory.Text = "";
                }
                else
                {
                    parameters["category_id"].DefaultValue = ddlCategory.SelectedValue;
                }

                parameters["size"].DefaultValue = txtSize.Text;
                parameters["shape"].DefaultValue = txtShape.Text;
                parameters["colour"].DefaultValue = txtColour.Text;
                parameters["quantity"].DefaultValue = txtQuantity.Text;
                parameters["price"].DefaultValue = txtPrice.Text;
                parameters["img"].DefaultValue = fuImage.FileName;
                try
                {
                    sqlDSProduct.Insert();
                    txtName.Text = "";
                    txtSize.Text = "";
                    txtColour.Text = "";
                    txtQuantity.Text = "";
                    txtPrice.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = $"<b>A database error has occurred:</b> {ex.Message}";
                }
            }
        }

        private string getInsertedCategoryID()
        {
            DataView customersTable = (DataView)sqlDSCategory.Select(DataSourceSelectArguments.Empty);
            customersTable.RowFilter = "category_name = '" + txtCategory.Text + "'";
            DataRowView row = customersTable[0];

            return row["category_id"].ToString();
        }
    }
}