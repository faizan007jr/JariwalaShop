<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JariwalaShop.Login" ClientIDMode="Static" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="login-page">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 m-auto col-sm-8 col-12">
                    <div class="log-box">
                        <div class="row">
                            <div class="col-xl-6 col-sm-6 col-12">
                                <div class="logo-back"></div>
                            </div>
                            <div class="col-xl-6 col-sm-6 col-12">
                                <div class="log-content">
                                    <h2>LOGIN</h2>
                                    <div class="log-body">
                                        <div class="form-group">
                                            <label>Username:</label>
                                            <asp:TextBox ID="txtUsername" runat="server"
                                                CssClass="form-control"
                                                Placeholder="Username"
                                                TextMode="Email" />
                                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                                CssClass="text-danger"
                                                ErrorMessage="*Required"
                                                ControlToValidate="txtUsername"
                                                Display="Dynamic" />
                                        </div>
                                        <div class="form-group">
                                            <label>Password:</label>
                                            <asp:TextBox ID="txtPassword" runat="server"
                                                CssClass="form-control"
                                                Placeholder="Password"
                                                TextMode="Password" />
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                                CssClass="text-danger"
                                                ErrorMessage="*Required"
                                                ControlToValidate="txtPassword"
                                                Display="Dynamic" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblError" runat="server"
                                                CssClass="text-danger" />
                                        </div>
                                        <div class="form-group text-center">
                                            <div class="custom-control custom-switch">
                                                <input runat="server" type="checkbox" 
                                                    class="custom-control-input" 
                                                    id="ckbAdmin" 
                                                    style="cursor: pointer;" />
                                                <label class="custom-control-label" 
                                                    for="ckbAdmin" 
                                                    style="cursor: pointer;">
                                                    Admin?
                                                </label>
                                            </div>
                                        </div>
                                        <div class="log-btn">
                                            <asp:Button ID="btnLogin" runat="server"
                                                CssClass="btn btn-primary btn-block"
                                                Text="Login"
                                                OnClick="btnLogin_Click" />
                                        </div>
                                        <div class="log-bottom-cotent text-center">
                                            <p>
                                                Create an account <a href="/reg">Sign Up</a><br />
                                                <a href="#">Forgot Password?</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sqlDSUserLogin" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
        SelectCommand="SELECT COUNT(email) AS count FROM customers WHERE (email = @email) AND (pwd = @pwd)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUsername" Name="email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="pwd" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSAdminLogin" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
        SelectCommand="SELECT COUNT(email) AS count FROM admins WHERE (email = @email) AND (pwd = @pwd)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtUsername" Name="email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtPassword" Name="pwd" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
