<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="StockManagementApplication.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-around">
    <div class="card col-12 mr-3 mt-4" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
        <h4 class="card-title mt-4">Add New Customer</h4>
        <hr/>
        <div class="form-group row justify-content-center">
            <asp:Label ID="nameLabel" CssClass="col-9" runat="server" Text="Full Name"></asp:Label>
            <asp:TextBox ID="txtCustomerName" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelEmail" CssClass="col-9" runat="server" Text="Customer Email"></asp:Label>
            <asp:TextBox ID="txtCustomerEmail" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelAddress" CssClass="col-9" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txtCustomerAddress" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelContact" CssClass="col-9" runat="server" Text="Mobile Number"></asp:Label>
            <asp:TextBox ID="txtCustomerContact" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label ID="labelMemberType" CssClass="col-9" runat="server" Text="MemberType"></asp:Label>
            <asp:TextBox ID="txtMemberType" CssClass="textInput form-control col-9" runat="server"></asp:TextBox>
             
            <asp:Button ID="btnAddCustomer" CssClass="btn btn-primary btn-block col-9" style="margin-top:20px" runat="server" Text="Add Customer" OnClick="btnAddCustomer_Click" />
        
        </div>
        <div>
             <asp:Label ID="msgLabel" runat="server" Text="ErrorMsg" Visible="false" ForeColor="Red"></asp:Label>
        </div>
       
    </div>
    <div class="card col-12 mr-3 mt-4" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
    <div class="card-body">
        <h4>List of Customers</h4>
        <asp:GridView ID="customerGrid" CssClass="table table-responsive table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="customerId" DataSourceID="customerDataSource">
            <Columns>
               <asp:CommandField ItemStyle-HorizontalAlign="Center" ButtonType="Image" CancelImageUrl="~/assets/img/cancel.png" EditImageUrl="~/assets/img/edit.png"
                    ShowEditButton="True" UpdateImageUrl="~/assets/img/confirm.png" DeleteImageUrl="~/assets/img/delete.png" ShowDeleteButton="True"/>

                <asp:BoundField DataField="customerId" HeaderText="customerId" InsertVisible="False" ReadOnly="True" SortExpression="customerId" />
                <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                <asp:BoundField DataField="customerEmail" HeaderText="customerEmail" SortExpression="customerEmail" />
                <asp:BoundField DataField="customerAddress" HeaderText="customerAddress" SortExpression="customerAddress" />
                <asp:BoundField DataField="customerContact" HeaderText="customerContact" SortExpression="customerContact" />
                <asp:BoundField DataField="memberType" HeaderText="memberType" SortExpression="memberType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="customerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerId] = @customerId" InsertCommand="INSERT INTO [Customers] ([customerName], [customerEmail], [customerAddress], [customerContact], [memberType]) VALUES (@customerName, @customerEmail, @customerAddress, @customerContact, @memberType)" SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerEmail] = @customerEmail, [customerAddress] = @customerAddress, [customerContact] = @customerContact, [memberType] = @memberType WHERE [customerId] = @customerId">
            <DeleteParameters>
                <asp:Parameter Name="customerId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memberType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memberType" Type="String" />
                <asp:Parameter Name="customerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="filterCustomerSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [customerId] = @customerId" InsertCommand="INSERT INTO [Customers] ([customerName], [customerEmail], [customerAddress], [customerContact], [memberType]) VALUES (@customerName, @customerEmail, @customerAddress, @customerContact, @memberType)" OnSelecting="filterCustomerSource_Selecting" SelectCommand="SELECT * FROM [Customers] WHERE (([customerEmail] = @userEmail) OR ([customerName] = @userName))" UpdateCommand="UPDATE [Customers] SET [customerName] = @customerName, [customerEmail] = @customerEmail, [customerAddress] = @customerAddress, [customerContact] = @customerContact, [memberType] = @memberType WHERE [customerId] = @customerId">
            <DeleteParameters>
                <asp:Parameter Name="userId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memberType" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCustomerEmail" Name="userEmail" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCustomerName" Name="userName" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="customerName" Type="String" />
                <asp:Parameter Name="customerEmail" Type="String" />
                <asp:Parameter Name="customerAddress" Type="String" />
                <asp:Parameter Name="customerContact" Type="String" />
                <asp:Parameter Name="memebrType" Type="String" />
                <asp:Parameter Name="customerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
        </div>
        </div>
</asp:Content>
