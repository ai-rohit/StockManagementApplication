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
      
    </div>
        <div class =" justify-content-center card row col-8 mt-4" style="display:flex; flex-direction: column; width:50%; box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <h4 class="card-title mt-4">Available Categories</h4>
            <hr />
           <asp:GridView ID="grdCategory" class="table table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="categoryDataSource">
            <Columns>
                 <asp:CommandField ControlStyle-CssClass="btn btn-primary" ItemStyle-HorizontalAlign="Center" ButtonType="Image" CancelImageUrl="~/assets/img/cancel.png" EditImageUrl="~/assets/img/edit.png"
                    ShowEditButton="True" UpdateImageUrl="~/assets/img/confirm.png" DeleteImageUrl="~/assets/img/delete.png" ShowDeleteButton="True"/>
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
