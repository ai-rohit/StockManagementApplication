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
                    <label for="txtPassowrd" class="labels col-9">Password*</label><br />
                    <asp:TextBox ID="txtPassword" runat="server"  class="textInput form-control col-8"></asp:TextBox>
                </div>
                
                <div class="form-group row justify-content-center">
                   <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-block col-8"/>
                </div>
               
                <p id="createAccount"><strong>Not registered yet?</strong><a runat="server" href="~/RegisterUser.aspx"> Create An Account</a></p>
            </div>
            
        </div>

        <div class="side-background col-md-6 d-none d-md-block" style="background-color:blue; height:100vh">

        </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
