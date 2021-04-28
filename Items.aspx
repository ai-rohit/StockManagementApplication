<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="StockManagementApplication.Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Hello</p>
    <div class="row justify-content-center" style="margin-left:100px;">
      <div class="col-6 form-group row">
        <label  class="labels col-4">Item Name*</label>
        <asp:TextBox ID="txtItemName" CssClass="col-9 textInput form-control" style="margin-right: 10px;" runat="server"></asp:TextBox>
    </div>

    <div class="col-6 form-group row" >
        <label  class="labels col-4">Item Description*</label>
        <asp:TextBox ID="txtItemDesc" CssClass="col-9 textInput form-control" style="margin-right: 10px;" runat="server"></asp:TextBox>
    </div>

    <div class="col-6 form-group row" >
        <label  class="labels col-4">Item Price*</label>
        <asp:TextBox ID="txtItemPrice" CssClass="col-9 textInput form-control" runat="server"></asp:TextBox>
    </div>

     <div class="col-6 form-group row">
        <label  class="labels col-4">Category</label>
        <asp:DropDownList ID="dropCategory" CssClass="col-9 textInput form-control" runat="server" AutoPostBack="True" DataSourceID="itemDataSource1" DataTextField="Name" DataValueField="id">
        </asp:DropDownList> 
    </div>

    <div class="col-6 form-group row">
        <label  class="labels col-4">Purchased Date*</label>
        <asp:TextBox type="Date"  CssClass="col-9 textInput form-control" ID="txtPurchaseDate" runat="server"></asp:TextBox>
    </div>
   
    <div  class="col-6 form-group row">
        <label class="labels col-4">Quantity*</label>
        <asp:TextBox type="number" CssClass="col-9 textInput form-control" value="1" min="1" ID="txtQuantity" runat="server"></asp:TextBox>
    </div>

      <div class="col-6 form-group row">
          <label class="labels col-4">Manufactured Date</label>
        <asp:TextBox type="Date" CssClass="col-9 textInput form-control" ID="txtManufactured" runat="server"></asp:TextBox>
    </div>

    <div class="col-6 form-group row">
          <label class="labels col-4">Expiry Date</label>
        <asp:TextBox type="Date" CssClass="col-9 textInput form-control" ID="txtExpiry" runat="server"></asp:TextBox>
    </div>
    <div class="col-12 form-group row">
        <asp:Button ID="btnAddItems" style="margin-left: 25px; top: 0px; left: 0px;" runat="server" CssClass="col-10 btn btn-primary btn-block form-control" OnClick="btnAddItems_Click" Text="Add Items" />
        <asp:SqlDataSource ID="itemDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [id], [Name] FROM [Category]"></asp:SqlDataSource>

    </div>
        
        </div>
     <asp:GridView ID="grdItem" CssClass="table table-striped table-responsive table-bordered mt-4 mr-3" style="margin-right:10px" runat="server" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="itemDataSource3">
            <Columns>
                 <asp:CommandField ItemStyle-HorizontalAlign="Center" ButtonType="Image" CancelImageUrl="~/assets/img/cancel.png" EditImageUrl="~/assets/img/edit.png"
                    ShowEditButton="True" UpdateImageUrl="~/assets/img/confirm.png" DeleteImageUrl="~/assets/img/delete.png" ShowDeleteButton="True"/>
                 <asp:CommandField ControlStyle-CssClass="btn btn-primary btn-sm" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ShowSelectButton="True" />
                <asp:BoundField DataField="itemId" HeaderText="Item Id" InsertVisible="False" ReadOnly="True" SortExpression="itemId" />
                <asp:BoundField DataField="itemName" HeaderText="Item Name" SortExpression="itemName" />
                <asp:BoundField DataField="itemDesc" HeaderText="Item Description" SortExpression="itemDesc" />
                <asp:BoundField DataField="itemPrice" HeaderText="Item Price" SortExpression="itemPrice" />
                <asp:BoundField DataField="purchaseDate" HeaderText="Purchased Date" SortExpression="purchaseDate" />
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="manufacturedDate" HeaderText="Manufactured Date" SortExpression="manufacturedDate" />
                <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
            </Columns>
        </asp:GridView>
    <asp:Button ID="btnOldStock" runat="server" Text="View Old Items On Stock" OnClick="btnOldStock_Click" />
         <div>

       
        <asp:SqlDataSource ID="itemDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items]" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate], [quantity]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate, @quantity)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate, [quantity] = @quantity WHERE [itemId] = @itemId">
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
    
    <asp:SqlDataSource ID="itemDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Items] WHERE [itemId] = @itemId" InsertCommand="INSERT INTO [Items] ([itemName], [itemDesc], [itemPrice], [purchaseDate], [category], [manufacturedDate], [expiryDate], [quantity]) VALUES (@itemName, @itemDesc, @itemPrice, @purchaseDate, @category, @manufacturedDate, @expiryDate, @quantity)" SelectCommand="SELECT * FROM [Items] WHERE ([itemName] = @itemName)" UpdateCommand="UPDATE [Items] SET [itemName] = @itemName, [itemDesc] = @itemDesc, [itemPrice] = @itemPrice, [purchaseDate] = @purchaseDate, [category] = @category, [manufacturedDate] = @manufacturedDate, [expiryDate] = @expiryDate, [quantity] = @quantity WHERE [itemId] = @itemId">
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
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="itemId" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
