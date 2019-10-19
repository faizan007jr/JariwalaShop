<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="JariwalaShop.Order" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <asp:GridView ID="gvOrders" runat="server" 
            CssClass="table table-striped table-condensed table-bordered table-responsive table"
            DataSourceID="sqlDBOrders" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="order_id">
            <Columns>
                <asp:BoundField DataField="order_id" HeaderText="order_id" InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                <asp:BoundField DataField="invoice_id" HeaderText="invoice_id" ReadOnly="True" SortExpression="invoice_id" />
                <asp:BoundField DataField="product_code" HeaderText="product_code" ReadOnly="True" SortExpression="product_code" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" ReadOnly="True" SortExpression="quantity" />
                <asp:CheckBoxField DataField="complete" HeaderText="complete" SortExpression="complete" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDBOrders" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [orders] WHERE ([complete] = @complete)" 
            UpdateCommand="UPDATE [orders] SET [complete] = @complete WHERE [order_id] = @original_order_id AND [invoice_id] = @original_invoice_id AND [product_code] = @original_product_code AND [quantity] = @original_quantity AND [complete] = @original_complete">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="complete" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="invoice_id" Type="Int32" />
                <asp:Parameter Name="product_code" Type="Int32" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="complete" Type="Boolean" />
                <asp:Parameter Name="original_order_id" Type="Int32" />
                <asp:Parameter Name="original_invoice_id" Type="Int32" />
                <asp:Parameter Name="original_product_code" Type="Int32" />
                <asp:Parameter Name="original_quantity" Type="Int32" />
                <asp:Parameter Name="original_complete" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
