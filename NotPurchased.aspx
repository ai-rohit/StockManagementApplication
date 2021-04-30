<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NotPurchased.aspx.cs" Inherits="StockManagementApplication.NotPurchased" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
        <div class="card col-12 table-responsive justify-content-center mt-5 mr-3">
        <h4 class="card-title mt-4">Items not sold in last 31 days</h4>
        <hr />
        <asp:GridView ID="grdNotPurchased" runat="server" CssClass="table table-bordered table=striped" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="notPurchasedDataSource">
            <Columns>
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
        </div>
    </div>
    <asp:SqlDataSource ID="notPurchasedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate], [quantity]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate, @quantity)" SelectCommand="SELECT Items.* FROM [Items] where itemId not in(Select order_details.itemId from order_details join sales on order_details.salesId = sales.salesId where DateDiff(dd, sales.billingDate, Convert(date, getDate()))&lt;=31)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate, [quantity] = @quantity WHERE [itemId] = @itemId">
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
</asp:Content>
