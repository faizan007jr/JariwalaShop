<%@ Page Title="Edit Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="JariwalaShop.EditProduct" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <asp:GridView ID="gvProducts" runat="server"
            CssClass="table table-striped table-condensed table-bordered table-responsive table"
            AllowPaging="True" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="product_code" 
            DataSourceID="sqlDBProducts">
            <Columns>
                <asp:BoundField DataField="product_code" HeaderText="product_code" InsertVisible="False" ReadOnly="True" SortExpression="product_code" />
                <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDBProducts" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ShopConnection %>" 
            DeleteCommand="DELETE FROM [products] WHERE [product_code] = @original_product_code AND [product_name] = @original_product_name AND [quantity] = @original_quantity AND [price] = @original_price"  
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [product_code], [product_name], [quantity], [price] FROM [products] ORDER BY [product_name]" 
            UpdateCommand="UPDATE [products] SET [product_name] = @product_name, [quantity] = @quantity, [price] = @price WHERE [product_code] = @original_product_code AND [product_name] = @original_product_name AND [quantity] = @original_quantity AND [price] = @original_price">
            <DeleteParameters>
                <asp:Parameter Name="original_product_code" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_quantity" Type="Decimal" />
                <asp:Parameter Name="original_price" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="quantity" Type="Decimal" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="original_product_code" Type="Int32" />
                <asp:Parameter Name="original_product_name" Type="String" />
                <asp:Parameter Name="original_quantity" Type="Decimal" />
                <asp:Parameter Name="original_price" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
