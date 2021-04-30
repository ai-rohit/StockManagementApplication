<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StockUser.aspx.cs" Inherits="StockManagementApplication.StockUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="row">

             <div class="form-container col-12 card mt-5" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
                 <h5 class="card-title mt-4">Add New User</h5>
                 <hr />
                 <div class="align-middle" style="display:flex; flex-direction: column;">
               
                 <div class="form-group row justify-content-center">
                     <label for="txtEmail" class="labels col-8">Email</label>
                     <asp:TextBox ID="txtEmail" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtUserName" class="labels col-8">User Name</label>
                     <asp:TextBox ID="txtUserName" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                    
                     <div class="form-group row justify-content-center">
                      <label for="txtUserAddress" class="labels col-8">User Address</label>
                     <asp:TextBox ID="txtUserAddress" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                     <div class="form-group row justify-content-center">
                      <label for="txtMobile" class="labels col-8">Mobile Number</label>
                     <asp:TextBox ID="txtMobile" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtPassword" class="labels col-8">Password</label>
                     <asp:TextBox ID="txtPassword" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtConfirmPassword" class="labels col-8">Confirm Password</label>
                     <asp:TextBox ID="txtConfirmPassword" runat="server" class="textInput form-control col-8"></asp:TextBox>
                 </div>
                 <div>

                   

                 </div>
                 <div class="form-group row justify-content-center">
                     <asp:Button ID="btnRegister" runat="server" Text="Register" class="btn btn-primary btn-block col-8" OnClick="btnRegister_Click"/>
                       <asp:Label ID="errorLabel" CssClass="col-8" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                 </div>
                </div>
              </div>
    
        </div>

    <div class="row justify-content-center">
        <div class="card table-responsive mt-4" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
            <h5 class="card-title mt-5 ml-4">Users</h5>
            <hr />
            <asp:GridView ID="grdUsers" runat="server" CssClass="table align-middle table-bordered col-10 align-self-center" AutoGenerateColumns="False" DataKeyNames="userId" DataSourceID="userDataSource">
            <Columns>
                  <asp:CommandField ItemStyle-HorizontalAlign="Center" ButtonType="Image" CancelImageUrl="~/assets/img/cancel.png" EditImageUrl="~/assets/img/edit.png"
                    ShowEditButton="True" UpdateImageUrl="~/assets/img/confirm.png" DeleteImageUrl="~/assets/img/delete.png" ShowDeleteButton="True"/>
                <asp:BoundField DataField="userId" HeaderText="userId" InsertVisible="False" ReadOnly="True" SortExpression="userId" />
                <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                <asp:BoundField DataField="userEmail" HeaderText="userEmail" SortExpression="userEmail" />
                <asp:BoundField DataField="userAddress" HeaderText="userAddress" SortExpression="userAddress" />
                <asp:BoundField DataField="userContact" HeaderText="userContact" SortExpression="userContact" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="userType" HeaderText="userType" SortExpression="userType" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users]" DeleteCommand="DELETE FROM [Users] WHERE [userId] = @userId" InsertCommand="INSERT INTO [Users] ([userName], [userEmail], [userAddress], [userContact], [password], [userType]) VALUES (@userName, @userEmail, @userAddress, @userContact, @password, @userType)" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [userEmail] = @userEmail, [userAddress] = @userAddress, [userContact] = @userContact, [password] = @password, [userType] = @userType WHERE [userId] = @userId">
            <DeleteParameters>
                <asp:Parameter Name="userId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userAddress" Type="String" />
                <asp:Parameter Name="userContact" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userAddress" Type="String" />
                <asp:Parameter Name="userContact" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
                <asp:Parameter Name="userId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="filterUserSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE ([userEmail] = @userEmail)" DeleteCommand="DELETE FROM [Users] WHERE [userId] = @userId" InsertCommand="INSERT INTO [Users] ([userName], [userEmail], [userAddress], [userContact], [password], [userType]) VALUES (@userName, @userEmail, @userAddress, @userContact, @password, @userType)" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [userEmail] = @userEmail, [userAddress] = @userAddress, [userContact] = @userContact, [password] = @password, [userType] = @userType WHERE [userId] = @userId">
            <DeleteParameters>
                <asp:Parameter Name="userId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userAddress" Type="String" />
                <asp:Parameter Name="userContact" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtEmail" Name="userEmail" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userAddress" Type="String" />
                <asp:Parameter Name="userContact" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
                <asp:Parameter Name="userId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <script>
         function ShowProfileAlert(title, message, icon) {
             swal({
                 title: title,
                 text: message,
                 icon: icon,
             }).then(function () {
                     window.location = "https://localhost:44344/User.aspx";
             });
         }
     </script>
</asp:Content>
