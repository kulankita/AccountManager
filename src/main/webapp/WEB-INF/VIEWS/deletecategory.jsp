<%@page import="com.accountmanager.entities.ExpenseCategory"%>
<%@page import="com.accountmanager.entities.IncomeCategory"%>
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
<title>Delete Category  Record</title>
</head>
<body>
<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<br>
	<div class="container">
	<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Income Category Details</h1>
	<form method="get" action="delete">
			<table class="table table-striped-columns">
				<thead class="table-dark">
					<tr >
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				 <% List<IncomeCategory> listCat=(List<IncomeCategory>) request.getAttribute("incomeCat");
        for(IncomeCategory e: listCat){
        %>
		<tr> 
			<td> <%=e.getId() %></td>
			<td> <%=e.getName() %></td>
			<td> <%=e.getDescription() %></td>	
		</tr>	
			       
        <%
        }
        %>
		</tbody>
			</table>
		</form>
		<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Delete Income Category Record</h1>
		<form action="deleteIncomeCat" method="post">
			<div class="form-group">
				<label for="incomeId">Income Category ID:</label> <input type="text"
					class="form-control" id="incomeId" name="incomeCId"
					placeholder="Enter income Category ID">
			</div>
			<button type="submit" class="btn btn-danger">Delete</button>
			<!-- <a href="viewIncome" class="btn btn-default">Cancel</a> -->
		</form>
		<br>
		<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Expense Category Details</h1>
		<form method="get" action="delete">
			<table class="table table-striped-columns">
				<thead class="table-dark">
					<tr >
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				 <% List<ExpenseCategory> list=(List<ExpenseCategory>) request.getAttribute("expenseCat");
        for(ExpenseCategory i: list){
        %>
		<tr> 
			<td> <%=i.getId() %></td>
			<td> <%=i.getName() %></td>
			<td> <%=i.getDescription() %></td>	
		</tr>	
			       
        <%
        }
        %>
		</tbody>
			</table>
		</form>
		<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Delete Expense Category Record</h1>
		<form action="deleteExpenseCat" method="post">
			<div class="form-group">
				<label for="expenseId">Expense ID:</label> <input type="text"
					class="form-control" id="expenseId" name="expenseCId"
					placeholder="Enter Expense Category ID">
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
