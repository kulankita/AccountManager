
<%@page import="com.accountmanager.entities.Expense"%>
<%@page import="com.accountmanager.entities.ExpenseCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
*{
	font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}
.container {
	margin-top: 50px;
}

form {
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
}
</style>
</head>
<body>
<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Expense Details</h1>
		<form method="get" action="delete">
			<table class="table table-striped-columns">
				<thead class="table-dark">
					<tr >
						<th>Id</th>
						<th>Date</th>
						<th>Name</th>
						<th>Description</th>
						<th>Amount</th>
						<th>Mode</th>
						<th>Transaction Id</th>
						
					</tr>
				</thead>
				 <% List<Expense> list=(List<Expense>) request.getAttribute("expenses");
        for(Expense i: list){
        %>
		<tr> 
			<td> <%=i.getId() %></td>
			<td> <%=i.getDate() %></td>
			<td> <%=i.getName() %></td>
			<td> <%=i.getDescription() %></td>
			<td> <%=i.getAmount() %></td>
			<td> <%=i.getMode() %></td>
			<td> <%=i.getTransactionId() %></td>		
		</tr>	
			       
        <%
        }
        %>
		</tbody>
			</table>
		</form>
	<div class="container">
		<h1>Add Expense</h1>
		<form action="expense" method="post">
			<label for="categoryId">Expense Category:</label> <select
				class="form-control" id="id" name="id" required>
				<option value="" disabled selected>Select Expense Category</option>
				<%
				List<ExpenseCategory> expensecat = (List<ExpenseCategory>) request.getAttribute("expenscat");
				for (ExpenseCategory ic : expensecat) {
				%>
				<option value="<%=ic.getId()%>"><%=ic.getName()%></option>
				<%
				}
				%>
			</select> <br> <input type="submit" value="Add">
		</form>
		<%
		ExpenseCategory e = (ExpenseCategory) request.getAttribute("a");
		if (e != null) {
		%>

		<form method="post" action="addexpense">
			<input type="hidden" name="id" value="<%=e.getId()%>"> <input
				type="hidden" name="name" value="<%=e.getName()%>"
				readonly="readonly"> <input type="text" name="desc" class="form-control"
				value="<%=e.getDescription()%>" >
			<div class="form-group row">
				<label for="date">Date:</label> <input type="date"
					class="col-sm-4" id="dateInput" name="date" onchange="validateDate()">
			</div>

			<div class="form-group">
				<label for="amount">Amount:</label> <input type="number"
					class="form-control" id="amount" name="amount">
			</div>
			<div class="form-group">
				<label for="mode">Mode:</label>
				 <select
					class="form-control" id="mode" name="mode" required>
					<option value="" disabled selected>Select Mode</option>
					<option value="Cash" name="cash">Cash</option>
					<option value="Online" name="online">Online</option>
				</select>
			</div>
			<div class="form-group">
				<label for="transactionId">Transaction ID:</label> <input
					type="text" class="form-control" id="transactionId"
					name="transactionId"">
			</div>
			<button type="submit" class="btn btn-primary">Add</button>
		</form>
		<%
		}
		%>
		<script type="text/javascript">
		function validateDate() {
			  var dateInput = document.getElementById("dateInput");
			  var selectedDate = new Date(dateInput.value);
			  var currentDate = new Date();
			  if (selectedDate > currentDate) {
			    alert("Please select a date on or before today.");
			    dateInput.value = "";
			  }
			}
		</script>
		
		
	</div>
</body>
</html>
