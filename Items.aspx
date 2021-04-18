<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="StockManagementApplication.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Hello</p>
    <div>
        <label  class="labels">Item Name*</label>
        <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
    </div>

    <div>
        <label  class="labels">Item Description*</label>
        <asp:TextBox ID="txtItemDesc" runat="server"></asp:TextBox>
    </div>

    <div>
        <label  class="labels">Item Price*</label>
        <asp:TextBox ID="txtItemPrice" runat="server"></asp:TextBox>
    </div>

    <div>
        <label  class="labels">Purchased Date*</label>
        <asp:TextBox type="Date" ID="txtPurchaseDate" runat="server"></asp:TextBox>
    </div>
    <div>
        <label  class="labels">Category</label>
        <asp:DropDownList ID="dropCategory" runat="server" AutoPostBack="True" DataSourceID="itemDataSource1" DataTextField="Name" DataValueField="id">
        </asp:DropDownList> 
    </div>

      <div>
          <label class="labels">Manufactured Date</label>
        <asp:TextBox type="Date" ID="txtManufactured" runat="server"></asp:TextBox>
    </div>

    <div>
          <label class="labels">Expiry Date</label>
        <asp:TextBox type="Date" ID="txtExpiry" runat="server"></asp:TextBox>
    </div>
    <div>

        <asp:Button ID="btnAddItems" runat="server" OnClick="btnAddItems_Click" Text="Add Items" />
        <asp:SqlDataSource ID="itemDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [Category]"></asp:SqlDataSource>

    </div>

    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="itemDataSource3">
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
        <asp:SqlDataSource ID="itemDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>

    </div>
    
    <asp:SqlDataSource ID="itemDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate)" SelectCommand="SELECT * FROM [Items] WHERE ([itemName] = @itemName)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate WHERE [itemId] = @itemId">
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
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtItemName" Name="itemName" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="itemName" Type="String" />
            <asp:Parameter Name="itemDesc" Type="String" />
            <asp:Parameter Name="itemPrice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="purchaseDate" />
            <asp:Parameter Name="category" Type="Int32" />
            <asp:Parameter DbType="Date" Name="manufacturedDate" />
            <asp:Parameter DbType="Date" Name="expiryDate" />
            <asp:Parameter Name="itemId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
