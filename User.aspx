<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="StockManagementApplication.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userId" DataSourceID="userDataSource">
        <Columns>
            <asp:BoundField DataField="userId" HeaderText="userId" ReadOnly="True" SortExpression="userId" InsertVisible="False" />
            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
            <asp:BoundField DataField="userEmail" HeaderText="userEmail" SortExpression="userEmail" />
            <asp:BoundField DataField="userAddress" HeaderText="userAddress" SortExpression="userAddress" />
            <asp:BoundField DataField="userContact" HeaderText="userContact" SortExpression="userContact" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="userType" HeaderText="userType" SortExpression="userType" />
            <asp:BoundField DataField="joinedDate" HeaderText="joinedDate" SortExpression="joinedDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    </div>
</asp:Content>
