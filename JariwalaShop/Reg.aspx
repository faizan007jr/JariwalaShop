<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="JariwalaShop.Reg" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="contentMain" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <fieldset>
            <legend>Registration</legend>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">E-mail:</label>
                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Email Address"
                    TextMode="Email" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtEmail" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">Password:</label>
                <asp:TextBox ID="txtPwd" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Password"
                    TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtPwd" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">Confirm Password:</label>
                <asp:TextBox ID="txtCPwd" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Confirm Password"
                    TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvCPwd" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtCPwd" 
                    Display="Dynamic" />
                <asp:CompareValidator ID="cvPwd" runat="server"  
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="Password must match"
                    Display="Dynamic" 
                    ControlToValidate="txtCPwd" 
                    ControlToCompare="txtPwd" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">First Name:</label>
                <asp:TextBox ID="txtFname" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="First Name" />
                <asp:RequiredFieldValidator ID="rfvFname" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtFname" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">Last Name:</label>
                <asp:TextBox ID="txtLname" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Last Name" />
                <asp:RequiredFieldValidator ID="rfvLname" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtLname" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">Phone:</label>
                <asp:TextBox ID="txtPhone" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Phone Number"
                    TextMode="Number" />
            </div>
            <h5>Address</h5>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">line1:</label>
                <asp:TextBox ID="txtLine1" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Line1" />
                <asp:RequiredFieldValidator ID="rfvLine1" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtLine1" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">City:</label>
                <asp:TextBox ID="txtCity" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="City" />
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtCity" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">State:</label>
                <asp:TextBox ID="txtState" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="State" />
                <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtState" />
            </div>
            <div class="form-group row">
                <label class="col-form-label col-sm-2 offset-sm-1">ZipCode:</label>
                <asp:TextBox ID="txtZipCode" runat="server"
                    CssClass="col-sm-4 form-control"
                    PlaceHolder="Zip Code" />
                <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" 
                    CssClass="col-sm-3 text-danger"
                    ErrorMessage="*Required" 
                    ControlToValidate="txtZipCode" />
            </div>
            <div class="row">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
            </div>
            <div class="form-group row">
                <asp:Button ID="btnRegister" runat="server"
                    CssClass="btn btn-primary offset-sm-1"
                    Text="Register" 
                    OnClick="btnRegister_Click" />
            </div>
        </fieldset>
    </div>
    <asp:SqlDataSource ID="sqlDSAddress" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
        InsertCommand="INSERT INTO [addresses] ([line], [city], [state], [zipcode]) VALUES (@line, @city, @state, @zipcode)"
        SelectCommand="SELECT * FROM [addresses]">
        <InsertParameters>
            <asp:ControlParameter Name="line" ControlID="txtLine1" Type="String" />
            <asp:ControlParameter Name="city" ControlID="txtCity" Type="String" />
            <asp:ControlParameter Name="state" ControlID="txtState" Type="String" />
            <asp:ControlParameter Name="zipcode" ControlID="txtZipCode" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDSCustomer" runat="server"
        ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ShopConnection %>"
        InsertCommand="INSERT INTO [customers] ([email], [pwd], [fname], [lname], [phone], [bill_address_id], [ship_address_id]) VALUES (@email, @pwd, @fname, @lname, @phone, @bill_address_id, @ship_address_id)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [customers]">
        <InsertParameters>
            <asp:ControlParameter Name="email" ControlID="txtEmail" Type="String" />
            <asp:ControlParameter Name="pwd" ControlID="txtPwd" Type="String" />
            <asp:ControlParameter Name="fname" ControlID="txtFname" Type="String" />
            <asp:ControlParameter Name="lname" ControlID="txtLname" Type="String" />
            <asp:ControlParameter Name="phone" ControlID="txtPhone" Type="Int64" />
            <asp:Parameter Name="bill_address_id" Type="Int32" />
            <asp:Parameter Name="ship_address_id" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
