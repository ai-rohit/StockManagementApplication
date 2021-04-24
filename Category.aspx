<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StockManagementApplication.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>This is category page</h1>
    
    <div class="row align-middle" style="align-self: center; display: flex; justify-content: center">
    <div class ="align-middle row col-8" style="display:flex; flex-direction: column; width:50%;">
    <div class="form-group row justify-content-start" style="display:flex">
        <label for="txtCategoryName" class="labels col-9">Category Name</label>
        <asp:TextBox ID="txtCategoryName" class="textInput form-control col-8" runat="server"></asp:TextBox>
    </div>
   
    <div class="form-group row justify-content-start" style="display:flex">
        <label for="txtCategoryDescription" class="labels col-9">Category Description</label>
        <asp:TextBox ID="txtCategoryDescription" class="textInput form-control col-8" runat="server"></asp:TextBox>
    </div>
    <div class="form-group row"> 
        <asp:Button ID="btnAddCategory" runat="server" OnClick="btnAddCategory_Click" class="btn btn-primary btn-block col-8" Text="Add Category" />  
    </div>
      
    </div>
        <div class ="align-middle row col-8" style="display:flex; flex-direction: column; width:50%; margin-top: 10px;">
           <asp:GridView ID="GridView1" class="table table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="categoryDataSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="Category Id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="Name" HeaderText="Category Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Category Description" SortExpression="Description" />
            </Columns>
           </asp:GridView>
        </div>
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
<asp:SqlDataSource ID="categoryDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [id] = @id" InsertCommand="INSERT INTO [Category] ([id], [Name], [Description]) VALUES (@id, @Name, @Description)" SelectCommand="SELECT * FROM [Category] WHERE ([Name] = @Name)" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [id] = @id" OnSelecting="categoryDataSource2_Selecting">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id" Type="Int32" />
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
<br />
</asp:Content>
