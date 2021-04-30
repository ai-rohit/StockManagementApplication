<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerPurchases.aspx.cs" Inherits="StockManagementApplication.CustomerPurchases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4 class="card-title">Purchases By Customers</h4>
    <hr/>
    <asp:SqlDataSource ID="customerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [customerId], [customerName] FROM [Customers]"></asp:SqlDataSource>
    <div class="row">
        <div class="col-6">
               <label style="font-weight:bold;">Select a Customer To See Their Purchases in Last 31 days:</label>
        </div>
        <div class="col-3">
                  <asp:DropDownList ID="drpDownCustomer" CssClass="dropdown mr-5 dropdown-toggle btn btn-primary" runat="server" AutoPostBack="True" DataSourceID="customerDataSource" DataTextField="customerName" DataValueField="customerId" OnSelectedIndexChanged="drpDownCustomer_SelectedIndexChanged">
                   </asp:DropDownList>
        </div>
       
    </div>
     <h5>OR</h5>
    <div class="row">
        <div class="col-6">
               <label style="font-weight:bold;">View all the Sales and Purchase Details:</label>
        </div>
        <div class="col-3">
        <asp:Button ID="btnSeeAllPurchase" CssClass="mr-5 btn btn-primary" runat="server" Text="See All Purchase" style="width: 190px;" OnClick="btnSeeAllPurchase_Click" />
        </div>
        </div>
    <hr />
    <div class="card col-10 mt-4 p-3 table-responsive" style="box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <asp:GridView ID="grdPurchases" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="recentPurchaseDataSource">
            <Columns>
                <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                <asp:BoundField DataField="purchasedDate" HeaderText="Purchased Date" SortExpression="purchasedDate" />
                <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" SortExpression="totalAmount" />
                <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                <asp:BoundField DataField="lineTotal" HeaderText="Line Total" SortExpression="lineTotal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="allPurchaseDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT customers.customerName, sales.billingDate as purchasedDate, sales.totalAmount, items.ItemName, order_details.quantity, order_details.lineTotal FROM [Sales] join customers on sales.customerId = customers.customerId join order_details on sales.salesId = order_details.salesId join items on items.itemId = order_details.itemId"></asp:SqlDataSource>
        <asp:GridView ID="grdAllPurchase" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="allPurchaseDataSource" Visible="False">
            <Columns>
                <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                <asp:BoundField DataField="purchasedDate" HeaderText="Purchased Date" SortExpression="purchasedDate" />
                <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" SortExpression="totalAmount" />
                <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                <asp:BoundField DataField="lineTotal" HeaderText="Line Total" SortExpression="lineTotal" />
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
