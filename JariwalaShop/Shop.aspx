<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="JariwalaShop.Shop" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <asp:Label ID="lblMsg" runat="server" /><br />
        <asp:DataList ID="dlProducts" runat="server"
            DataSourceID="sqlDSProducts"
            DataKeyField="product_code"
            RepeatLayout="Flow"
            RepeatDirection="Horizontal"
            OnItemCommand="dlProducts_ItemCommand"
            CssClass="align-content-center">
            <ItemTemplate>
                <div class="card border-primary mb-3 d-inline-block table-responsive" style="max-width: 16rem;">
                    <div class="card-header">
                        <asp:Label runat="server"
                            Text='<%# Eval("product_name") %>' />
                    </div>
                    <div class="card-img" style="max-height:280px; overflow:hidden;">
                        <asp:Image runat="server"
                            ImageUrl='<%# "~/Images/" + Eval("img") %>'
                            CssClass="img-responsive"
                            style="border-radius:0; margin-left: 50%; transform: translateX(-50%) translateY(-25%);"/>
                    </div>
                    <div class="card-body">
                        <asp:Label runat="server"
                            CssClass="card-text"
                            Text='<%# "Size: " + Eval("size") + "mm"%>' />
                        <asp:Label runat="server"
                            CssClass="card-text text-right"
                            Text='<%# "Price: " + Eval("price") + "$ per kg"%>' />
                        <br />
                        <label>Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            Placeholder="00Gm" />
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server"
                            ControlToValidate="txtQuantity"
                            ValidationGroup='<%# Eval("product_code") %>'
                            ErrorMessage="Required"
                            Display="Dynamic"
                            CssClass="text-danger" />
                        <asp:RangeValidator ID="rvQuantity" runat="server"
                            ControlToValidate="txtQuantity"
                            ValidationGroup='<%# Eval("product_code") %>'
                            ErrorMessage='<%# "Min:100Gm Max:" + Convert.ToInt32(Eval("quantity")) * 1000 + "Gm" %>'
                            MaximumValue='<%# Convert.ToInt32(Eval("quantity")) * 1000 %>'
                            Display="Dynamic"
                            CssClass="text-danger"
                            MinimumValue="100"
                            Type="Integer" />
                        <asp:Button ID="btnAddToCart" runat="server"
                            CssClass="btn btn-primary btn-block mt-2"
                            ValidationGroup='<%# Eval("product_code") %>'
                            Text="Add to Cart"
                            CommandName="AddToCart"
                            CommandArgument='<%# Eval("product_code") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sqlDSProducts" runat="server"
            ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
            SelectCommand="SELECT product_code, product_name, size, price, img, quantity FROM products WHERE (quantity &gt;= 0.1) ORDER BY product_name" />
    </div>
</asp:Content>
