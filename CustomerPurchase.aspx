<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerPurchase.aspx.cs" Inherits="StockManagementApplication.CustomerPurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="grdOldStock" runat="server" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="oldStockSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="itemId" HeaderText="itemId" InsertVisible="False" ReadOnly="True" SortExpression="itemId" />
                <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                <asp:BoundField DataField="itemPrice" HeaderText="itemPrice" SortExpression="itemPrice" />
                <asp:BoundField DataField="purchaseDate" HeaderText="purchaseDate" SortExpression="purchaseDate" />
                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                <asp:BoundField DataField="manufacturedDate" HeaderText="manufacturedDate" SortExpression="manufacturedDate" />
                <asp:BoundField DataField="expiryDate" HeaderText="expiryDate" SortExpression="expiryDate" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="oldStockSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate], [quantity]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate, @quantity)" SelectCommand="SELECT * FROM [Items] where DateDiff(dd, purchaseDate, Convert(date, getDate())) &gt; 365" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate, [quantity] = @quantity WHERE [itemId] = @itemId">
            <DeleteParameters>
                <asp:Parameter Name="itemId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="itemName" Type="String" />
                <asp:Parameter Name="itemDesc" Type="String" />
                <asp:Parameter Name="itemPrice" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="purchaseDate" />
                <asp:Parameter Name="category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="manufacturedDate" />
                <asp:Parameter DbType="Date" Name="expiryDate" />
                <asp:Parameter Name="quantity" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="itemName" Type="String" />
                <asp:Parameter Name="itemDesc" Type="String" />
                <asp:Parameter Name="itemPrice" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="purchaseDate" />
                <asp:Parameter Name="category" Type="Int32" />
                <asp:Parameter DbType="Date" Name="manufacturedDate" />
                <asp:Parameter DbType="Date" Name="expiryDate" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="itemId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
