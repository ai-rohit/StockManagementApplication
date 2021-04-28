<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StockManagementApplication.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>
       * {
            box-sizing: border-box;
       }
       .card {
    border-radius: 4px;
    background: #fff;
    box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
    transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
    padding: 14px 80px 18px 36px;
    cursor: pointer;
    margin: 0px 5px 0px 5px;
    }

   .card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
    }
   </style>
    <div class="row justify-content-around">
        <asp:Label ID="lblUserEmail" CssClass="col-12" runat="server" Text="Label"></asp:Label>
        <div class="card col-3" style="box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <h5 class="card-title">Total Items Available</h5>
            <div class="card-body">
                <img src="assets/img/items-chart.png"/>
            </div>
        </div>
         <div class="card col-3" style="box-shadow:  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <h5 class="card-title">Total Items Available</h5>
            <div class="card-body">
                <img src="assets/img/items-chart.png"/>
            </div>
        </div>
         <div class="card col-3">
             <h5 class="card-title">Total Number of Users</h5>

        </div>
         <div class="card col-3">
              
             <h5 class="card-title">Total Number of Sales</h5>
             
        </div>
        <div class="card col-11 justify-content-center mt-4">

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select * from Items where quantity&lt;=10"></asp:SqlDataSource>
    </div>
    <div id="MyPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-dismiss="modal"></button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
     
    
</asp:Content>
