﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerPurchases.aspx.cs" Inherits="StockManagementApplication.CustomerPurchases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="customerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [customerId], [customerName] FROM [Customers]"></asp:SqlDataSource>
    <div>
        <asp:DropDownList ID="drpDownCustomer" runat="server" AutoPostBack="True" DataSourceID="customerDataSource" DataTextField="customerName" DataValueField="customerId"></asp:DropDownList>
    </div>
    <div class="card">
        <asp:GridView ID="grdPurchases" runat="server" AutoGenerateColumns="False" DataSourceID="recentPurchaseDataSource">
            <Columns>
                <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                <asp:BoundField DataField="purchasedDate" HeaderText="purchasedDate" SortExpression="purchasedDate" />
                <asp:BoundField DataField="totalAmount" HeaderText="totalAmount" SortExpression="totalAmount" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="lineTotal" HeaderText="lineTotal" SortExpression="lineTotal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="recentPurchaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Sales] WHERE [salesId] = @salesId" InsertCommand="INSERT INTO [Sales] ([customerId], [billingDate], [totalAmount]) VALUES (@customerId, @billingDate, @totalAmount)" SelectCommand="SELECT customers.customerName, sales.billingDate as purchasedDate, sales.totalAmount, items.ItemName, order_details.quantity, order_details.lineTotal FROM [Sales] join customers on sales.customerId = customers.customerId join order_details on sales.salesId = order_details.salesId join items on items.itemId = order_details.itemId where sales.customerId = @customerId and DateDiff(dd, Sales.billingDate, Convert(date, getDate())) &lt; 31" UpdateCommand="UPDATE [Sales] SET [customerId] = @customerId, [billingDate] = @billingDate, [totalAmount] = @totalAmount WHERE [salesId] = @salesId">
            <DeleteParameters>
                <asp:Parameter Name="salesId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customerId" Type="Int32" />
                <asp:Parameter DbType="Date" Name="billingDate" />
                <asp:Parameter Name="totalAmount" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drpDownCustomer" Name="customerId" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="customerId" Type="Int32" />
                <asp:Parameter DbType="Date" Name="billingDate" />
                <asp:Parameter Name="totalAmount" Type="Decimal" />
                <asp:Parameter Name="salesId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>