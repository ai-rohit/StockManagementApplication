<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OutOfStock.aspx.cs" Inherits="StockManagementApplication.OutOfStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Hello</p>
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="0">Sort By Number of Stock</asp:ListItem>
            <asp:ListItem Value="1">Sort By Item Name</asp:ListItem>
            <asp:ListItem Value="2">Sort By Purchased (Stocked) Date</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([quantity] &lt; @quantity) ORDER BY [itemName], [quantity] DESC, [purchaseDate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="10" Name="quantity" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
