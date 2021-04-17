<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StockManagementApplication.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>This is category page</h1>
    <div>
        <asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
    </div>
    <div>
        <asp:TextBox ID="txtCategoryDescription" runat="server"></asp:TextBox>
    </div>
    <div>
        
        <asp:Button ID="btnAddCategory" runat="server" OnClick="btnAddCategory_Click" Text="Add Category" />
        
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="categoryDataSource">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Columns>
    </asp:GridView>
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
    <asp:SqlDataSource ID="categoryDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [id] = @id" InsertCommand="INSERT INTO [Category] ([id], [Name], [Description]) VALUES (@id, @Name, @Description)" SelectCommand="SELECT * FROM [Category] WHERE ([Name] = @Name)" UpdateCommand="UPDATE [Category] SET [Name] = @Name, [Description] = @Description WHERE [id] = @id">
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
