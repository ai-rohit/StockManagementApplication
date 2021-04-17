<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StockManagementApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="assets/CSS/Styles.css" />
    <title>You Stock Manager</title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div class="row" style="height: 100vh">
        <div class="form-container col-md-6" style="height: 100vh">
             <h4>Login</h4>
                <h6>Manage your stock faster and easier!</h6>
                <hr /><p>Sign in with email</p><hr />
            <div class="align-middle" style="display:flex; flex-direction: column;">
               
                <div class="form-group row justify-content-center">
                    <label for="txtEmail" class="labels col-9" >Email*</label><br />
                    <asp:TextBox ID="txtEmail" runat="server" class="textInput form-control col-8"></asp:TextBox>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="txtPassword" class="labels col-9">Password*</label><br />
                    <asp:TextBox ID="txtPassword" runat="server"  class="textInput form-control col-8"></asp:TextBox>
                </div>
                
                <div class="form-group row justify-content-center">
                    <asp:Label ID="errorLabel" class="col-8" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>

                   <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-block col-8" OnClick="btnLogin_Click"/>
                </div>
               
                <p id="createAccount"><strong>Not registered yet?</strong><a runat="server" href="~/Registration/RegisterUser.aspx"> Create An Account</a></p>
            </div>
            
        </div>

        <div class="side-background col-md-6 d-none d-md-block" style="background-color:blue; height:100vh">

        </div>
        </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <asp:SqlDataSource ID="loginDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([userEmail] = @userEmail) AND ([password] = @password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtEmail" Name="userEmail" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPassword" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

    </body>
</html>
