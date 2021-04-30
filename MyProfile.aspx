<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="StockManagementApplication.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row align-self-center justify-content-center" style="width:90%">
        <div class="card col-9 mt-5 p-2 ml-5" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
            <h4 class="card-title mt-4">My Profile</h4>
            <hr />
      <div class="col-12 mt-4">
        <asp:Label ID="lblItemId" runat="server" Text="User Id" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:TextBox ID="userId" runat="server" ReadOnly="true" CssClass="textInput form-control mt-2"></asp:TextBox>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblItemName" runat="server" Text="User Name:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="userName" runat="server" Text="Item Name" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="Label1" runat="server" Text="Contact Number:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="contactNumber" runat="server" Text="Contact Number" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblCategory" runat="server" Text="Email:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="email" runat="server" Text="Category" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>
    <div class="col-12 mt-4">
        <asp:Label ID="lblAvailableQuantity" runat="server" Text="Address:" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <asp:Label ID="address" runat="server" Text="Address" Visible="false" Font-Size="Larger" style="margin-left:10px"></asp:Label>
    </div>

     </div>
       </div>

    <div class="row align-self-center justify-content-center" style="width:90%">
        <div class="card col-9 mt-5 p-2 ml-5" style=" box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin: 30px 0px 30px 0px;">
            <h4 class="card-title mt-4">Change Password</h4>
            <hr />
             <div class="col-12 mt-2">
                <asp:Label ID="lblOldPassword" runat="server" Text="Old Password:" Font-Bold="true" Font-Size="Larger"></asp:Label>
                 <asp:TextBox ID="txtOldPassword" type="password" CssClass="textInput form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col-12 mt-2">
                <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" Font-Bold="true" Font-Size="Larger"></asp:Label>
                 <asp:TextBox ID="txtNewPassword" type="password" CssClass="textInput form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col-12 mt-2">
                <asp:Label ID="lblChangePassword" runat="server" Text="Confirm Password:" Font-Bold="true" Font-Size="Larger"></asp:Label>
                 <asp:SqlDataSource ID="passwordDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([password] = @password) AND ([userId] = @userId))">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="txtOldPassword" Name="password" PropertyName="Text" Type="String" />
                         <asp:ControlParameter ControlID="userId" Name="userId" PropertyName="Text" Type="Int32" />
                     </SelectParameters>
                </asp:SqlDataSource>
                 <asp:TextBox ID="txtConfirmPassword" type="password" CssClass="textInput form-control" runat="server"></asp:TextBox>
                <asp:Label ID="msgLabel" runat="server" Text="Label" Visible="false"></asp:Label>
            </div>

             <div class="col-12 mt-4">

                <asp:Button ID="btnChangePassword" style="top: 0px; left: 0px;" runat="server" CssClass="btn btn-primary btn-block form-control" Text="Change Password" OnClick="btnChangePassword_Click" />
            </div>
     </div>
       </div>
</asp:Content>
