<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="StockManagementApplication.RegisterUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/CSS/Styles.css" />
        <title>You Stock Manager</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
             <div class="form-container col-md-6" style="height:100vh">
                 <h2 style="text-align:center; margin-top: 80px; margin-right:20px;"><img src="https://img.icons8.com/color/48/000000/login-rounded-right.png"/>Register</h2>
                <h6 style="text-align:center;">Manage your stock faster and easier!</h6>
                <hr /><p style="margin-left:100px;"></p><hr />
                 <div class="align-middle" style="display:flex; flex-direction: column;">
               
                 <div class="form-group row justify-content-center">
                     <label for="txtEmail" class="labels col-9">Email</label>
                     <asp:TextBox ID="txtEmail" runat="server" class="textInput form-control col-8"></asp:TextBox>
                     <div class="col-12" style="margin-left:195px;">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Email Address" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                     </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtUserName" class="labels col-9">User Name</label>
                     <asp:TextBox ID="txtUserName" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                    
                     <div class="form-group row justify-content-center">
                      <label for="txtUserAddress" class="labels col-9">User Address</label>
                     <asp:TextBox ID="txtUserAddress" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                     <div class="form-group row justify-content-center">
                      <label for="txtMobile" class="labels col-9">Mobile Number</label>
                     <asp:TextBox ID="txtMobile" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtPassword" class="labels col-9">Password</label>
                     <asp:TextBox ID="txtPassword" type="password" runat="server" class="textInput form-control col-8"></asp:TextBox>

                 </div>
                  <div class="form-group row justify-content-center">
                      <label for="txtConfirmPassword" class="labels col-9">Confirm Password</label>
                     <asp:TextBox ID="txtConfirmPassword"  type="password" runat="server" class="textInput form-control col-8"></asp:TextBox>
                      
                 </div>
                 <div>

                     

                 </div>
                 <div class="form-group row justify-content-center">
                     <asp:Label ID="errorLabel" style="margin-left:150px;" runat="server" ForeColor="Red" CssClass="col-8" Text="Label" Visible="False"></asp:Label>
                     <asp:Button ID="btnRegister" runat="server" Text="Get Registered" class="btn btn-primary btn-block col-8" OnClick="btnRegister_Click"/>
                 </div>
                 <p id="createAccount"><strong>Already registered?</strong><a runat="server" href="~/Login.aspx"> Sign in</a></p>
                </div>
              </div>

             <div class="side-background col-md-6 d-none d-md-block" style="background-color:blue; height:135vh">
                  <h2 style="color:white; margin-top:150px; font-weight:bold; margin-left:200px;">Get Registered In </h2>
            <h3  style="color:white; margin-top:10px; font-weight:bold; margin-left:100px;">Your Stock Management Application</h3>
            <img src="../assets/img/register.svg" style="width:70%; margin-top:120px; margin-left:70px;"/>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <asp:SqlDataSource ID="registrationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [userId] = @userId" InsertCommand="INSERT INTO [Users] ([userName], [userEmail], [userAddress], [userContact], [password], [userType]
            ) VALUES (@userName, @userEmail, @userAddress, @userContact, @password, @userType)" SelectCommand="SELECT * FROM [Users] WHERE ([userEmail] = @userEmail)" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [userEmail] = @userEmail, [userAddress] = @userAddress, [userContact] = @userContact, [password] = @password, [userType] = @userType WHERE [userId] = @userId">
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
    </form>
    </body>
</html>
