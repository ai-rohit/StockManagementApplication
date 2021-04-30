<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OutOfStock.aspx.cs" Inherits="StockManagementApplication.OutOfStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="card col-11 mt-5 ml-5">
            <h4 class="card-title mt-4">Items Out Of Stock</h4>
            <hr />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" CssClass="table table-bordered table-striped col-9" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="outOfStockSource">
            <Columns>
                <asp:BoundField DataField="itemId" HeaderText="Item Id" InsertVisible="False" ReadOnly="True" SortExpression="itemId" />
                <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                <asp:BoundField DataField="itemDesc" HeaderText="Item Desc" SortExpression="itemDesc" />
                <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                <asp:BoundField DataField="purchaseDate" HeaderText="Purchase Date" SortExpression="purchaseDate" />
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="manufacturedDate" HeaderText="Manufactured Date" SortExpression="manufacturedDate" />
                <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="outOfStockSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([quantity] &lt; @quantity)">
            <SelectParameters>
                <asp:Parameter DefaultValue="10" Name="quantity" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
