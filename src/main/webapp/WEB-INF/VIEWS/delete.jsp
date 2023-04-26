<%@page import="com.accountmanager.entities.Income"%>
<%@page import="java.util.List"%>
<%@page import="com.accountmanager.entities.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Delete  Record</title>
</head>
<body>
<header>
<%@ include file="menubar.jsp" %>
</header>

	<div class="container">
	<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Income Details</h1>
		<form method="get" action="showallinc">
			<table class="table table-striped-columns">
				<thead class="table-dark">
					<tr>
						<th>Id</th>
						<th>Date</th>
						<th>Name</th>
						<th>Description</th>
						<th>Amount</th>
						<th>Mode</th>
						<th>Transaction Id</th>
						
					</tr>
				</thead>
				 <% List<Income> li=(List<Income>) request.getAttribute("incomes");
        for(Income i: li){
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
		<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Delete Income Record</h1>
		<form action="deleteIncome" method="post">
			<div class="form-group">
				<label for="incomeId">Income ID:</label> <input type="text"
					class="form-control" id="incomeId" name="incomeId"
					placeholder="Enter income ID">
			</div>
			<button type="submit" class="btn btn-danger">Delete</button>
			<!-- <a href="viewIncome" class="btn btn-default">Cancel</a> -->
		</form>
		<br>
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
		<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Delete Expense Record</h1>
		<form action="deleteExpense" method="post">
			<div class="form-group">
				<label for="incomeId">Expense ID:</label> <input type="text"
					class="form-control" id="incomeId" name="expenseId"
					placeholder="Enter income ID">
			</div>
			<button type="submit" class="btn btn-danger">Delete</button>
			<!-- <a href="viewIncome" class="btn btn-default">Cancel</a> -->
		</form>
		<br>
		<br>
	</div>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfUVOyCtT+a0PxERCE8VwoKk65XVnFh/0N0TK35K2"
		crossorigin="anonymous"></script>
</body>
</html>
