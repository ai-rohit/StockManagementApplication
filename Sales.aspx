<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="StockManagementApplication.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Make Sale</h2>
    <div class="row justify-content-center">
        <div class="card col-10">
            <h4 class="card-title mt-4">Select Items To Purchase</h4>
            <hr />
        <div class="row col-9 align-self-center justify-content-lg-between" style="margin-right: 35px;">
            <div class="form-group row col-6">
            <asp:Label ID="lblItemName" CssClass="labels col-9" runat="server" Text="Item"></asp:Label>
            <asp:DropDownList ID="dropDnItem" class="btn btn-primary dropdown-toggle col-12" runat="server" DataSourceID="itemDataSource1" DataTextField="itemName" DataValueField="itemId" AutoPostBack="True" OnSelectedIndexChanged="dropDnItem_SelectedIndexChanged">
            </asp:DropDownList>
            </div>
            <div class="form-group row col-6">
           <asp:Label ID="lblCustomerName" CssClass="labels col-9" runat="server" Text="Customer Name"></asp:Label>
             <asp:DropDownList ID="dropDnCustomer" class="btn btn-primary dropdown-toggle col-12" runat="server" DataSourceID="customerDataSource1" DataTextField="customerName" DataValueField="customerId">
         </asp:DropDownList>
             
             </div>
        </div>
        
        <div class="form-group row justify-content-center">
            <asp:Label ID="lblItemQuantity" CssClass="labels col-9" runat="server" Text="Quantity"></asp:Label>
                 <asp:TextBox ID="txtQuantity" class="textInput form-control col-9" type="number" value="1" min="1" runat="server" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
        </div>
       
            <asp:Label ID="lblQuantity" runat="server" Text="quantity checker" Visible="False"></asp:Label>
        <div class="form-group row justify-content-center">
            <asp:Label ID="lblLineTotal" CssClass="labels col-9" runat="server" Text="Total Price for Item"></asp:Label>
             <asp:TextBox ID="txtLineTotal"  class="textInput form-control col-9" runat="server" AutoPostBack="True"></asp:TextBox>
             <asp:Button ID="btnAddToCart" CssClass="btn btn-block btn-primary col-9 mt-4" runat="server" Text="Add To Cart" OnClick="btnAddToCart_Click" />
        </div>
       
      
            <asp:Label ID="lblCustomer" runat="server" Text="Customer Id"></asp:Label>
        
        </div>
        <div class="card col-10">
        <div>
            <asp:GridView ID="grdCart" runat="server" OnRowDataBound="grdCart_RowDataBound" OnSelectedIndexChanged="grdCart_SelectedIndexChanged"></asp:GridView>
        </div>
        <div>
            
            <asp:TextBox ID="txtBillingDate" type="Date" runat="server"></asp:TextBox>
            <asp:Label ID="msgLabel" runat="server" Text="Error Message" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div>
            <asp:Button ID="btnPurchase" runat="server" Text="Make Purchase" OnClick="btnPurchase_Click" />
            <asp:SqlDataSource ID="salesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Sales] WHERE [salesId] = @salesId" InsertCommand="INSERT INTO [Sales] ([customerId], [billingDate], [totalAmount]) VALUES (@customerId, @billingDate, @totalAmount)" SelectCommand="SELECT * FROM [Sales]" UpdateCommand="UPDATE [Sales] SET [customerId] = @customerId, [billingDate] = @billingDate, [totalAmount] = @totalAmount WHERE [salesId] = @salesId">
                <DeleteParameters>
                    <asp:Parameter Name="salesId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="customerId" Type="Int32" />
                    <asp:Parameter Name="billingDate" DbType="Date" />
                    <asp:Parameter Name="totalAmount" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="customerId" Type="Int32" />
                    <asp:Parameter Name="billingDate" DbType="Date" />
                    <asp:Parameter Name="totalAmount" Type="Decimal" />
                    <asp:Parameter Name="salesId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
       </div>
       <div>
            
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
