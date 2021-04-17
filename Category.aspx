<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StockManagementApplication.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>This is category page</h1>
    <div>
        <asp:TextBox ID="txtcategoryId" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:TextBox ID="txtCategoryDescription" runat="server"></asp:TextBox>
    </div>
    <div>
        
        <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" />
        
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
</asp:Content>
