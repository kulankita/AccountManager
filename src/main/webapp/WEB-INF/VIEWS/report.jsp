<%@page import="com.accountmanager.entities.ExpenseCategory"%>
<%@page import="com.accountmanager.entities.Income"%>
<%@page import="com.accountmanager.entities.IncomeCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Monthly Report</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fyiSzp0aqRO1uYmdE9Lv/32WmXTsKXIJSKwJ8W" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	
	<style type="text/css">
		.container {
			margin-top: 50px;
		}
		h3 {
			font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
			
		}
	</style>

</head>
<body>
    <header>
        <%@ include file="menubar.jsp"%>
    </header>
    <br>
    <br>
    <h3 style="margin-left: 500px; color: green;">Income Report</h3>
   <form method="post" action="/incomes/export/pdf" style="margin-left: 500px; margin-top: 10px;">
    <button type="submit"  class="btn btn-primary">Incomes - Export to PDF</button>
</form>
<br>
<h3 style="margin-left: 500px; color: green;">Expense Report</h3>
<form method="post" action="/expenses/export/pdf" style="margin-left: 500px; margin-top: 10px;">
    <button type="submit"  class="btn btn-primary">Expenses - Export to PDF</button>
</form>   
<br>
<h3 style="margin-left: 450px; color: green;">Date-wise Income Report</h3>
<form action="incomeDate" method="post" style="margin-left: 325px;">
			<div class="form-group row">
				<label for="startDate" class="col-sm-2 col-form-label">Start Date:</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="startDate" name="startDate">
				</div>
			</div>
			<div class="form-group row">
				<label for="endDate" class="col-sm-2 col-form-label">End Date:</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="endDate" name="endDate">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					<button type="submit" class="btn btn-primary">Date-wise Report of Income</button>
				</div>
			</div>
		</form>
		<br>
		<h3 style="margin-left: 450px; color: green;">Date-wise Expense Report</h3>
		<form action="expenseDate" method="post" style="margin-left: 325px;">
			<div class="form-group row">
				<label for="startDate" class="col-sm-2 col-form-label">Start Date:</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="startDate" name="startDate">
				</div>
			</div>
			<div class="form-group row">
				<label for="endDate" class="col-sm-2 col-form-label">End Date:</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="endDate" name="endDate">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					<button type="submit" class="btn btn-primary">Date-wise Report of Expense</button>
				</div>
			</div>
		</form> 
		<br>
		 <h3 style="margin-left: 450px; color: green;">Category and Date-wise Income Report</h3>
		<form action="categoryreport" method="post" style="margin-left: 325px;">
			<div class="form-group row">
				<label for="category" class="col-sm-2 col-form-label">Category:</label>
				<div class="col-sm-4">
					<select name="category" class="form-control">
						<option value="" disabled selected>Select Income Category</option>
				<%
				List<IncomeCategory> incomes = (List<IncomeCategory>) request.getAttribute("incomes");
				for (IncomeCategory ic : incomes) {
				%>
				<option value="<%=ic.getId()%>"><%=ic.getName()%></option>
				<%
				}
				%>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="startDate" class="col-sm-2 col-form-label">Start Date:</label>
				<div class="col-sm-4">
					<input type="date" name="startDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label for="endDate" class="col-sm-2 col-form-label">End Date:</label>
				<div class="col-sm-4">
					<input type="date" name="endDate" class="form-control">
				</div>
			</div>
			<div class="form-group row ">
				<div class="col-sm-4">
					<button type="submit" class="btn btn-primary">Category-wise Income Report</button>
				</div>
			</div>
		</form> 
		
		<h3 style="margin-left: 450px; color: green;">Category and Date-wise Expense Report</h3>
		<form action="expensecategory" method="post" style="margin-left: 325px;">
			<div class="form-group row ">
				<label for="category" class="col-sm-2 col-form-label">Category:</label>
				<div class="col-sm-4">
					<select name="category" class="form-control">
						<option value="" disabled selected>Select Expense Category</option>
				<%
				List<ExpenseCategory> expenses = (List<ExpenseCategory>) request.getAttribute("expenses");
				for (ExpenseCategory ic : expenses) {
				%>
				<option value="<%=ic.getId()%>"><%=ic.getName()%></option>
				<%
				}
				%>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="startDate" class="col-sm-2 col-form-label">Start Date:</label>
				<div class="col-sm-4">
					<input type="date" name="startDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label for="endDate" class="col-sm-2 col-form-label">End Date:</label>
				<div class="col-sm-4">
					<input type="date" name="endDate" class="form-control">
				</div>
			</div>
			<div class="form-group row ">
				<div class="col-sm-4">
					<button type="submit" class="btn btn-primary">Category-wise Income Report</button>
				</div>
			</div>
		</form> 
 </body>
    </html>

  
