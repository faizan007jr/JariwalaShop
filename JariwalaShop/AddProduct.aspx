<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="JariwalaShop.AddProduct" ClientIDMode="Static" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <fieldset>
            <legend>Enter New Product:</legend>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Category:</label>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ddlCategory" runat="server"
                        CssClass="dropdown form-control"
                        DataSourceID="sqlDSCategory"
                        DataTextField="category_name"
                        DataValueField="category_id" />
                    <asp:TextBox ID="txtCategory" runat="server"
                        CssClass="form-control"
                        PlaceHolder="New Category Name"
                        Visible="false" />
                </div>
                <div class="form-check col-sm-3">
                    <div class="custom-control custom-switch">
                        <asp:CheckBox runat="server" type="checkbox"
                            ID="Checkcategory"
                            OnCheckedChanged="Checkcategory_CheckedChanged"
                            AutoPostBack="True"
                            Text="New?"
                            Style="cursor: pointer;" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                        ErrorMessage="Required"
                        CssClass="text-danger"
                        ControlToValidate="ddlCategory" />
                </div>
                <asp:SqlDataSource ID="sqlDSCategory" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
                    InsertCommand="INSERT INTO categories(category_name) VALUES (@category_name)"
                    SelectCommand="SELECT category_id, category_name FROM categories ORDER BY category_name">
                    <InsertParameters>
                        <asp:Parameter Name="category_name" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Name:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Product Name" />
                </div>
                <div class="col-sm-3">
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ErrorMessage="Required"
                        CssClass="text-danger"
                        Display="Dynamic"
                        ControlToValidate="txtName" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Size:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtSize" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Size"
                        TextMode="Number" />
                </div>
                <div class="col-sm-3">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Shape:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtShape" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Shape" />
                </div>
                <div class="col-sm-3">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Colour:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtColour" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Colour" />
                </div>
                <div class="col-sm-3">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Quantity:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtQuantity" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Quantity Available in Kg"
                        TextMode="Number" />
                </div>
                <div class="col-sm-3">
                    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server"
                        ErrorMessage="Required"
                        CssClass="text-danger"
                        ControlToValidate="txtQuantity" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Price:</label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtPrice" runat="server"
                        CssClass="form-control"
                        PlaceHolder="Price($) per kg"
                        TextMode="Number" />
                </div>
                <div class="col-sm-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage="Required"
                        CssClass="text-danger"
                        ControlToValidate="txtPrice" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-form-label col-sm-3">Image:</label>
                <div class="col-sm-4">
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control-file" />
                </div>
                <div class="col-sm-3">
                    <asp:RequiredFieldValidator ID="rfvImage" runat="server"
                        ErrorMessage="Required"
                        CssClass="text-danger"
                        ControlToValidate="fuImage" />
                </div>
            </div>

            <div class="form-group row offset-sm-1">
                <asp:Label ID="lblError" runat="server"
                    CssClass="text-danger" />
            </div>

            <div class="row">
                <div class="form-group offset-md-3 col-md-2 offset-sm-3 col-sm-4">
                    <asp:Button ID="btnAdd" runat="server"
                        CssClass="btn btn-primary btn-block btn-lg"
                        Text="Add"
                        OnClick="btnAdd_Click" />
                </div>
                <div class="form-group col-md-2 col-sm-4">
                    <input type="button" value="Clear" 
                        class="btn btn-warning btn-block btn-lg"
                        onclick="onClear()"/>
                    <script src="/Scripts/OnClear.js"></script>
                </div>
            </div>

            <asp:SqlDataSource ID="sqlDSProduct" runat="server"
                ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
                InsertCommand="INSERT INTO products(product_name, category_id, size, shape, colour, quantity, price, img) VALUES (@product_name, @category_id, @size, @shape, @colour, @quantity, @price, @img)"
                SelectCommand="SELECT products.* FROM products">
                <InsertParameters>
                    <asp:Parameter Name="product_name" Type="String" />
                    <asp:Parameter Name="category_id" Type="Int32" />
                    <asp:Parameter Name="size" Type="Int32" />
                    <asp:Parameter Name="shape" Type="String" />
                    <asp:Parameter Name="colour" Type="String" />
                    <asp:Parameter Name="quantity" Type="Decimal" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="img" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </fieldset>
    </div>
</asp:Content>
