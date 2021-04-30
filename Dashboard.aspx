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
    margin: 30px 5px 0px 5px;

    }

   .card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
    }
   .modal-wrapper {
			position: absolute;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
			overflow-y: auto;
			-webkit-box-shadow: 0px 6px 30px rgba(0, 0, 0, 0.4);
			box-shadow: 0px 6px 30px rgba(0, 0, 0, 0.4);
			-webkit-transition: all 0.2s ease-in-out;
			transition: all 0.2s ease-in-out;
			z-index: 10;
			background-color: var(--popup-bg);
			width: 500px;
			visibility: hidden;
			opacity: 0;
			border-radius: 6px;
			display: -webkit-box;
			display: -ms-flexbox;
			display: flex;
			-webkit-box-orient: vertical;
			-webkit-box-direction: normal;
			-ms-flex-direction: column;
			flex-direction: column;
			white-space: normal;
		}

		.modal-wrapper.visible {
			opacity: 1;
			visibility: visible;
		}

		.modal-window {
			background-color: white;
			border-radius: 5px;
			box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
			padding: 20px;
			transform: scale(0);
			transition: 0.2s ease-in-out all;
		}

		.modal-wrapper.visible .modal-window {
			transform: scale(1);
		}

		.modal-header {
			align-items: center;
			border-bottom: 2px solid black;
			display: flex;
			justify-content: space-between;
			padding: 0px;
		}

		.close-modal-button {
			border: none;
			background-color: transparent;
			color: rgb(112, 112, 112);
			cursor: pointer;
			font-size: 1rem;
			padding: 0.2em;
		}

		.close-modal-button:hover {
			color: black;
		}

		.modal-trigger {
			color: rgb(10, 47, 255);
			cursor: pointer;
			text-decoration: underline;
		}

		@media screen and (max-width: 570px) {
			.modal-wrapper {
				width: 90%;
			}
		}

		.modal-wrapper.visible {
			visibility: visible;
			opacity: 1;
		}

		.overlay-app {
			width: 100%;
			height: 100%;
			position: fixed;
			left: 0;
			top: 0;
			pointer-events: all;
			background-color: rgba(36, 39, 59, 0.8);
			opacity: 0;
			visibility: hidden;
			-webkit-transition: all 0.2s ease-in-out;
			transition: all 0.2s ease-in-out;
		}

		.overlay-app.is-active {
			visibility: visible;
			opacity: 1;
		}
   </style>
   
       
       <div class="row">
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Total Sales Made</h5>
        <asp:Label ID="lblNumSales" Font-Bold="true" Font-Size="Larger" CssClass="card-text" runat="server" Text="Label"></asp:Label>
		  <asp:Label ID="Label2" Font-Bold="true" Font-Size="Large" CssClass="card-text" runat="server" Text="Sales has been made in app."></asp:Label>
        <a href="CustomerPurchases.aspx" class="btn btn-primary col-12">View Purchases</a>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Items in stock</h5>
         <asp:Label ID="lblNumItems" Font-Bold="true" Font-Size="Larger" CssClass="card-text" runat="server" Text="Label"></asp:Label>
		 <asp:Label ID="Label1" Font-Bold="true" Font-Size="Large" CssClass="card-text" runat="server" Text="Items are present in stock currently"></asp:Label>
        <a href="Items.aspx" class="btn btn-primary col-12">View All Items</a>
      </div>
    </div>
  </div>
	<div class="col-sm-4">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">No. of Customers</h5>
         <asp:Label ID="lblNumCustomers" Font-Bold="true" Font-Size="Larger" CssClass="card-text" runat="server" Text="Label"></asp:Label>
		   <asp:Label ID="Label3" Font-Bold="true" Font-Size="Large" CssClass="card-text" runat="server" Text="Customers registered in app."></asp:Label>

        <a href="User.aspx" class="btn btn-primary col-12">View All Customers</a>
      </div>
    </div>
  </div>
		   <div class="col-12">
			<div class="card mt-3 mb-4">
			  <div class="card-body">
				 <h5 class="card-title">Inactive Users (No Purchase in Last 31 days)<asp:SqlDataSource ID="numCustDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select COUNT(*) as numCustomer from customers"></asp:SqlDataSource>
                  <asp:SqlDataSource ID="itemNumDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select count(*) as numItems from items"></asp:SqlDataSource>
                  <asp:SqlDataSource ID="salesNumDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select count(*) as numSales from sales"></asp:SqlDataSource>
                  <hr /></h5>
            <asp:GridView ID="grdInactiveUsers" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="customerId" DataSourceID="inactiveUserDataSource">
                <Columns>
                    <asp:BoundField DataField="customerId" HeaderText="Customer Id" InsertVisible="False" ReadOnly="True" SortExpression="customerId" />
                    <asp:BoundField DataField="customerName" HeaderText="Customer Name" SortExpression="customerName" />
                    <asp:BoundField DataField="customerEmail" HeaderText="Customer Email" SortExpression="customerEmail" />
                    <asp:BoundField DataField="customerAddress" HeaderText="Customer Address" SortExpression="customerAddress" />
                    <asp:BoundField DataField="customerContact" HeaderText="Customer Contact" SortExpression="customerContact" />
                    <asp:BoundField DataField="memberType" HeaderText="Member Type" SortExpression="memberType" />
                </Columns>
            
            </asp:GridView>
			  </div>
			</div>
		  </div>
		</div>   
        <asp:SqlDataSource ID="inactiveUserDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select * from Customers where customerId not in (Select customerId from sales where DateDiff(dd, billingDate, Convert(date, getDate()))&lt;=31)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="itemStockDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockConnectionString %>" SelectCommand="Select * from Items where quantity&lt;=10"></asp:SqlDataSource>
    
   <div class="modal-wrapper" id="modal">
		<section class="modal-window">
			<header class="modal-header">
				<h3 class="modal-title"></h3>
				<button type="button" class="close-modal-button btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
			</header>
			<div class="modal-body">
				<span>Some items are low on stocks! They are:</span><br />
				<ul>
					<li class="stock-lists"></li>
				</ul>
			</div>
			<div class="content-button-wrapper" style="text-align:center;">
				<button class="btn btn-primary continue" >Close</button>
			</div>
		</section>
	</div>
	<div class="overlay-app"></div>
    <script>
		
        const overlay = document.querySelector(".overlay-app");
        const modalWrapper = document.getElementById('modal');

        function ShowUp(title, body) {
            modalWrapper.classList.add("visible");
            overlay.classList.add("is-active");
            var a = document.querySelector(".modal-title");
            var b = document.querySelector(".stock-lists");
            a.innerHTML = title;
            const array1 = body.split(',');
            const array2 = [array1]
            console.log(array2);
            var output = '';
            for (var i in array1) {
                output += '<li>' + array1[i] + '</li>';

            }
            b.innerHTML = output;
        }

        document.querySelectorAll(".continue").forEach(continueButtons => {
            continueButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });

        document.querySelectorAll(".close").forEach(closeModalButtons => {
            closeModalButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });

        document.querySelectorAll(".overlay-app").forEach(closeModalButtons => {
            closeModalButtons.addEventListener("click", () => {
                overlay.classList.remove("is-active");
                modalWrapper.classList.remove("visible");
            });
        });
    </script>
</asp:Content>
