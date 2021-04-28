<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="StockManagementApplication.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblSelectedItem" runat="server" Text="SelectedItem" Visible="false"></asp:Label>
        <asp:Label ID="lblItemCategory" runat="server" Text="Category" Visible="false"></asp:Label>
        <asp:Label ID="lblItemPrice" runat="server" Text="ItemPrice" Visible="false"></asp:Label>
    </div>
    <div class="row justify-content-center">
        <div class="card col-10" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
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
            <asp:Label ID="lblCartMessage" CssClass="labels col-9 mt-2" ForeColor="Red" runat="server" Text="ErrorCart" Visible="false"></asp:Label>
        </div>
       
      
            <asp:Label ID="lblCustomer" runat="server" Text="Customer Id" Visible="False"></asp:Label>
        
        </div>
        <div class="card col-10" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-bottom: 30px;">
            <h4 class="card-title mt-4"> Items Cart</h4>
            <hr />
        
            <asp:GridView ID="grdCart" runat="server" CssClass="table table-bordered table-striped col-12" OnRowDataBound="grdCart_RowDataBound" OnSelectedIndexChanged="grdCart_SelectedIndexChanged" OnRowCommand="grdCart_RowCommand">

                <Columns>
                    <asp:ButtonField CommandName="RemoveCart" ControlStyle-CssClass="btn btn-danger" Text="Remove" ItemStyle-HorizontalAlign="Center"/>
                </Columns>
            </asp:GridView>
            <div class="form-group row justify-content-end">
                <asp:Label ID="total" Font-Bold="true" CssClass="mr-5" Font-Size="Larger" runat="server" Text="Total"></asp:Label>
                <asp:Label ID="lblTotalValue" CssClass="col-2 mr-2" Font-Size="Large" runat="server" Text="0"></asp:Label>
            </div>
        
        <div class="form-group row justify-content-center">
            <label id="lblBillingDate" for="txtBillingDate" class="labels col-9">Select Billing Date</label>
            <asp:TextBox ID="txtBillingDate" class="textInput form-control col-9" type="Date" runat="server"></asp:TextBox>
            
             <asp:Button ID="btnPurchase" CssClass="btn btn-block btn-primary col-9 mt-4" runat="server" Text="Make Purchase" OnClick="btnPurchase_Click" />
        </div>
        <div>
           <asp:Label ID="msgLabel" runat="server" Text="Error Message" ForeColor="Red" Visible="False"></asp:Label>
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
            <asp:SqlDataSource ID="OrderDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Order_Details] WHERE [orderId] = @orderId" InsertCommand="INSERT INTO [Order_Details] ([itemId], [quantity], [salesId], [lineTotal]) VALUES (@itemId, @quantity, @salesId, @lineTotal)" SelectCommand="SELECT * FROM [Order_Details]" UpdateCommand="UPDATE [Order_Details] SET [itemId] = @itemId, [quantity] = @quantity, [salesId] = @salesId, [lineTotal] = @lineTotal WHERE [orderId] = @orderId">
                <DeleteParameters>
                    <asp:Parameter Name="orderId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="itemId" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="salesId" Type="Int32" />
                    <asp:Parameter Name="lineTotal" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="itemId" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="salesId" Type="Int32" />
                    <asp:Parameter Name="lineTotal" Type="Decimal" />
                    <asp:Parameter Name="orderId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
       </div>
       <div>
            
            <asp:SqlDataSource ID="itemDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [itemId], [itemName], [itemPrice], [quantity] FROM [Items]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="itemDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Items] join [Category] on Items.category = Category.id WHERE ([itemId] = @itemId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDnItem" Name="itemId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="customerDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT [customerId], [customerName] FROM [Customers]"></asp:SqlDataSource>
       </div>
    </div>
</asp:Content>
