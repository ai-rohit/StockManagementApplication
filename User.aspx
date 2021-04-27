<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="StockManagementApplication.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-around">
    <div class="card col-4 shadow p-3 mb-5 bg-white rounded">
        <h4 class="card-title">Add New Customer</h4>
        <hr/>
        <div class="form-group row justify-content-center">
            <asp:Label ID="nameLabel" CssClass="col-9" runat="server" Text="Full Name"></asp:Label>
            <asp:TextBox ID="txtCustomerName" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelEmail" CssClass="col-9" runat="server" Text="Customer Email"></asp:Label>
            <asp:TextBox ID="txtCustomerEmail" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelAddress" CssClass="col-9" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txtCustomerAddress" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelContact" CssClass="col-9" runat="server" Text="Mobile Number"></asp:Label>
            <asp:TextBox ID="txtCustomerContact" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelMemberType" CssClass="col-9" runat="server" Text="MemberType"></asp:Label>
            <asp:TextBox ID="txtMemberType" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
             
            <asp:Button ID="btnAddCustomer" CssClass="btn btn-primary btn-block col-9" style="margin-top:20px" runat="server" Text="Add Customer" />
        
        </div>
       
    </div>
    <div class="card col-7 shadow p-3 mb-5 bg-white rounded">
    <div class="card-body">
        <h4>List of Users</h4>
    <asp:GridView ID="usersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="userId" DataSourceID="userDataSource">
        <Columns>
            <asp:BoundField DataField="userId" HeaderText="userId" ReadOnly="True" SortExpression="userId" InsertVisible="False" />
            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
            <asp:BoundField DataField="userEmail" HeaderText="userEmail" SortExpression="userEmail" />
            <asp:BoundField DataField="userAddress" HeaderText="userAddress" SortExpression="userAddress" />
            <asp:BoundField DataField="userContact" HeaderText="userContact" SortExpression="userContact" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="userType" HeaderText="userType" SortExpression="userType" />
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    </div>
    <div class=" row">
        <h4 class="card-title">List of Customers</h4>
        <asp:GridView ID="customerGrid" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="customerId" DataSourceID="customerDataSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="customerId" HeaderText="customerId" InsertVisible="False" ReadOnly="True" SortExpression="customerId" />
                <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                <asp:BoundField DataField="customerEmail" HeaderText="customerEmail" SortExpression="customerEmail" />
                <asp:BoundField DataField="customerAddress" HeaderText="customerAddress" SortExpression="customerAddress" />
                <asp:BoundField DataField="customerContact" HeaderText="customerContact" SortExpression="customerContact" />
                <asp:BoundField DataField="memberType" HeaderText="memberType" SortExpression="memberType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="customerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerId] = @customerId" InsertCommand="INSERT INTO [Customers] ([customerName], [customerEmail], [customerAddress], [customerContact], [memberType]) VALUES (@customerName, @customerEmail, @customerAddress, @customerContact, @memberType)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerEmail] = @customerEmail, [customerAddress] = @customerAddress, [customerContact] = @customerContact, [memberType] = @memberType WHERE [customerId] = @customerId">
            <DeleteParameters>
                <asp:Parameter Name="customerId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memberType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memberType" Type="String" />
                <asp:Parameter Name="customerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        </div>
        </div>
</asp:Content>
