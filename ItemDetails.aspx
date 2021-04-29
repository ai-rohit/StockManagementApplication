<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="StockManagementApplication.ItemDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row align-self-center justify-content-center" style="width:90%">
        <div class="card col-9 mt-5 p-2 ml-5" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
            <h5 class="card-title">Details of Selected Item</h5>
            <hr />
      <div class="col-12 mt-4">
        <asp:Label ID="lblItemId" runat="server" Text="Item Id" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:TextBox ID="txtItemId" runat="server" ReadOnly="true" CssClass="textInput form-control mt-2"></asp:TextBox>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblItemName" runat="server" Text="Item Name:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="itemName" runat="server" Text="Item Name" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblCategory" runat="server" Text="Category:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="category" runat="server" Text="Category" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblAvailableQuantity" runat="server" Text="Available Quantity:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="availableQuantity" runat="server" Text="Available Quantity" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>

    <div class="col-12 mt-4">
        <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="unitPrice" runat="server" Text="Unit Price" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>

        <div class="col-12 mt-4">
        <asp:Label ID="lblPurchasedDate" runat="server" Text="Purchased Date:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="purchasedDate" runat="server" Text="Purchased Date" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
     </div>
        <asp:SqlDataSource ID="itemDetailsSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate], [quantity]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate, @quantity)" SelectCommand="SELECT * FROM [Items] join [Category] on Items.category = category.id WHERE ([itemId] = @itemId)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate, [quantity] = @quantity WHERE [itemId] = @itemId">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="txtItemId" Name="itemId" PropertyName="Text" Type="Int32" />
            </SelectParameters>
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
