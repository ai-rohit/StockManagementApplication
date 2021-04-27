<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StockManagementApplication.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Hello</p>
    <div>
        <asp:Label ID="lblUserEmail" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select * from Items where quantity&lt;=10"></asp:SqlDataSource>
    </div>    
</asp:Content>
