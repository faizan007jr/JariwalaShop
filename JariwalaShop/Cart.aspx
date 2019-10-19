<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="JariwalaShop.Cart" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <div class="row">
            <div class="col-sm-12">
                <h6>Cart:</h6>
            </div>
            <div class="col-sm-8">
                <div class="form-group">
                    <asp:ListBox ID="lstCart" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <asp:Button ID="btnRemove" runat="server"
                        Text="Remove Item"
                        CssClass="btn btn-primary btn-block"
                        OnClick="btnRemove_Click" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnEmpty" runat="server"
                        Text="Empty Cart"
                        CssClass="btn btn-primary btn-block"
                        OnClick="btnEmpty_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-form-label col-sm-12">
                <asp:Label ID="lblMessage" runat="server"
                    ForeColor="Red"
                    Visible="false">
                </asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <asp:Button ID="btnCheckOut" runat="server"
                    Text="Check Out"
                    CssClass="btn btn-primary btn-block"
                    OnClick="btnCheckOut_Click" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sqlDBInvoice" runat="server"
        OldValuesParameterFormatString="original_{0}" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>" 
        InsertCommand="INSERT INTO [invoices] ([email], [date]) VALUES (@email, @date)" 
        SelectCommand="SELECT * FROM [invoices]">
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="date" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDBOrder" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
        InsertCommand="INSERT INTO [orders] ([invoice_id], [product_code], [quantity]) VALUES (@invoice_id, @product_code, @quantity)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [orders]">
        <InsertParameters>
            <asp:Parameter Name="invoice_id" Type="Int32" />
            <asp:Parameter Name="product_code" Type="Int32" />
            <asp:Parameter Name="quantity" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDBProduct" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>" 
        SelectCommand="SELECT * FROM [products]" 
        UpdateCommand="UPDATE [products] SET [quantity] = @quantity WHERE [product_code] = @product_code" >
        <UpdateParameters>
            <asp:Parameter Name="quantity" Type="Decimal" />
            <asp:Parameter Name="product_code" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
