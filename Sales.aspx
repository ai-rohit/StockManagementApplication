<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="StockManagementApplication.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Make Sale</h2>
    <div>
        <div>
            <asp:DropDownList ID="dropDnItem" runat="server" DataSourceID="itemDataSource1" DataTextField="itemName" DataValueField="itemId" AutoPostBack="True" OnSelectedIndexChanged="dropDnItem_SelectedIndexChanged">
        </asp:DropDownList>
        </div>
        <div>
                 <asp:TextBox ID="txtQuantity" type="number" value="1" min="1" runat="server" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
        </div>
       <div>
             <asp:DropDownList ID="dropDnCustomer" runat="server" DataSourceID="customerDataSource1" DataTextField="customerName" DataValueField="customerId">
        </asp:DropDownList>
       </div>
       <div>
            <asp:TextBox ID="txtLineTotal" runat="server" AutoPostBack="True"></asp:TextBox>
            <asp:SqlDataSource ID="itemDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [itemId], [itemName], [itemPrice], [quantity] FROM [Items]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="itemDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items] WHERE ([itemId] = @itemId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDnItem" Name="itemId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="customerDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [customerId], [customerName] FROM [Customers]"></asp:SqlDataSource>
       </div>
       

    </div>
</asp:Content>
