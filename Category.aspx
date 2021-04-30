<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StockManagementApplication.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row align-middle" style="align-self: center; display: flex; justify-content: center">  
         <h1 style="margin-top:20px" class="col-12">Category<hr /></h1>
         
    <div class ="card align-middle row col-8" style="display:flex; flex-direction: column; width:50%; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" >
        <h4 class="card-title mt-4">Add new catrgories here!</h4>
         <hr />
        <div class="form-group row justify-content-center" style="display:flex">
        <label for="txtCategoryName" class="labels col-9">Category Name</label>
        <asp:TextBox ID="txtCategoryName" class="textInput form-control col-9" runat="server"></asp:TextBox>
    </div>
   
    <div class="form-group row justify-content-center" style="display:flex">
        <label for="txtCategoryDescription" class="labels col-9">Category Description</label>
        <asp:TextBox ID="txtCategoryDescription" class="textInput form-control col-9" runat="server"></asp:TextBox>
        
        <asp:Button ID="btnAddCategory" runat="server" OnClick="btnAddCategory_Click" class="btn btn-primary btn-block col-9 mt-4" Text="Add Category" />  
    </div>
        <asp:Label ID="errorMsg" style="margin-left:100px;" runat="server" ForeColor="red" Text="Error" Visible="false"></asp:Label>
      
    </div>
        <div class =" justify-content-center card row col-8 mt-4" style="display:flex; flex-direction: column; width:50%; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <h4 class="card-title mt-4">Available Categories</h4>
            <hr />
           <asp:GridView ID="grdCategory" class="table table-striped table-bordered" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="categoryDataSource" OnRowCommand="grdCategory_RowCommand">
            <Columns>
                <asp:ButtonField CommandName="ViewItems" Text="View Items" ControlStyle-CssClass="btn btn-primary" />
                <asp:CommandField ItemStyle-HorizontalAlign="Center" ButtonType="Image" CancelImageUrl="~/assets/img/cancel.png" EditImageUrl="~/assets/img/edit.png"
                    ShowEditButton="True" UpdateImageUrl="~/assets/img/confirm.png" DeleteImageUrl="~/assets/img/delete.png" ShowDeleteButton="True"/>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
           </asp:GridView>
        </div>
        </div>
        <hr />
          <div class =" justify-content-center row col-8 mt-4 ml-5" style="display:flex; flex-direction: column; width:50%;">
              <asp:Label ID="lblItemCategory" runat="server" Font-Bold="true" Font-Size="Larger" Visible="false">Items in Selected Category:<hr /></asp:Label>
              
              <asp:GridView ID="grdCategoryItems" class="table table-striped table-bordered table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="itemId" DataSourceID="itemCategoryDataSource" Visible="False">
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


      
<asp:SqlDataSource ID="categoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [id] = @id" InsertCommand="INSERT INTO [Category] ([id], [Name], [Description]) VALUES (@id, @Name, @Description)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:Label ID="catId" runat="server" Text="categoryId" Visible="False"></asp:Label>
<asp:SqlDataSource ID="categoryDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [id] = @id" InsertCommand="INSERT INTO [Category] ([Name], [Description]) VALUES (@Name, @Description)" SelectCommand="SELECT * FROM [Category] WHERE ([Name] = @Name)" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [id] = @id" OnSelecting="categoryDataSource2_Selecting">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="txtCategoryName" Name="Name" PropertyName="Text" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="itemCategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([category] = @category)">
        <SelectParameters>
            <asp:ControlParameter ControlID="catId" Name="category" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />
</asp:Content>
