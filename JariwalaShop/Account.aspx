<%@ Page Title="Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="JariwalaShop.Account" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="form-group">
        <fieldset class="container">
            <legend>Change Password</legend>
            <div class="form-group row">
                <asp:Label ID="lblSuccess" runat="server" 
                    CssClass="text-success"
                    Visible="false"/>
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Username:</label>
                <asp:Label ID="lblUsername" runat="server"
                    CssClass="form-control-plaintext col-sm-4 font-weight-bold" />
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Old Password:</label>
                <asp:TextBox ID="txtOldPwd" runat="server"
                    CssClass="form-control col-sm-4"
                    TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvOldPwd" runat="server"
                    ControlToValidate="txtOldPwd"
                    CssClass="text-danger col-sm-3"
                    Display="Dynamic"
                    ErrorMessage="Required" />
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">New Password:</label>
                <asp:TextBox ID="txtNewPwd" runat="server"
                    CssClass="form-control col-sm-4"
                    TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server"
                    ControlToValidate="txtNewPwd"
                    CssClass="text-danger col-sm-3"
                    Display="Dynamic"
                    ErrorMessage="Required" />
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label">Confirm Password:</label>
                <asp:TextBox ID="txtCPwd" runat="server"
                    CssClass="form-control col-sm-4"
                    TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvCPwd" runat="server"
                    ControlToValidate="txtCPwd"
                    CssClass="text-danger col-sm-3"
                    Display="Dynamic"
                    ErrorMessage="Required" />
                <asp:CompareValidator ID="cvPwd" runat="server"  
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="Password must match!"
                    Display="Dynamic" 
                    ControlToValidate="txtCPwd" 
                    ControlToCompare="txtNewPwd" />
            </div>
            <div class="form-group row">
                <asp:Label ID="lblError" runat="server" 
                    CssClass="text-danger" />
            </div>
            <div class="form-group row">
                <asp:Button ID="btnChange" runat="server"
                    CssClass="btn btn-primary btn-block col-sm-3 offset-sm-3"
                    Text="Change" OnClick="btnChange_Click" />
            </div>
        </fieldset>
    </div>
    <asp:SqlDataSource ID="sqlDSPwd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>" 
        SelectCommand="SELECT * FROM [customers] WHERE ([email] = @email)" 
        UpdateCommand="UPDATE customers SET pwd = @pwd WHERE ([email] = @email)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblUsername" Name="email" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lblUsername" Name="email" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtNewPwd" Name="pwd" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
