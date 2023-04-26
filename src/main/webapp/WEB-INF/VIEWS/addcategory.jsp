<%@page import="com.accountmanager.entities.ExpenseCategory"%>
<%@page import="com.accountmanager.entities.IncomeCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        *{
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }
        /* Style for the container */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        /* Style for the form */
        form {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
        }
        /* Style for the form input fields */
        input[type=text] {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
        }
        /* Style for the form submit button */
        button[type=submit] {
            background-color: #393E46;
            color: #fff;
            border: none;
            margin-top: 10px;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        /* Style for the section heading */
        h2 {
            margin-top: 0;
            margin-bottom: 20px;
        }
        #incomeBtn{
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<header>
		<%@ include file="menubar.jsp"%>
	</header>
<div class="container mt-5 border rounded">
    <h2 class="text-center">Add Category</h2>
    <div class="row justify-content-center mt-3">
        <button id="incomeBtn" onclick="showIncomeForm()" class="btn btn-primary">Add Income Category</button>
        <button id="expenseBtn" onclick="showExpenseForm()" class="btn btn-primary">Add Expense Category</button>

        <div class="row justify-content-center mt-3"></div>
        <form action="incomecat" method="post" id="incomeForm" style="display: none">
        <h3 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Income Category Details</h3>
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
            <div class="form-group mt-3">
                <label for="incomeCategory">Income Category:</label> <input type="text" class="form-control" id="iname" name="iname" placeholder="name" required>
                <input type="text" class="form-control mt-3" id="idesc" name="idesc" placeholder="description" required>
            </div>
            <button type="submit" class="btn btn-success">Add</button>
        </form>
    </div>

    <div class="row justify-content-center mt-3">
        <form action="expensecat" method="post" id="expenseForm" style="display: none">
         <h3 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; text-align: center;">Expense Category Details</h3>
        <table class="table table-striped-columns">
				<thead class="table-dark">
					<tr >'
						<th>Id</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				 <% List<ExpenseCategory> listExp=(List<ExpenseCategory>) request.getAttribute("expenseCat1");
        for(ExpenseCategory i: listExp){
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
            <div class="form-group mt-3">
                <label for="expenseCategory">Expense Category:</label> <input type="text" class="form-control" id="ename" name="ename" placeholder="name" required>
                <input type="text" class="form-control mt-3" id="edesc" name="edesc" placeholder="description" required>
            </div>
            <button type="submit" class="btn btn-success">Add</button>
        </form>
    </div>
</div>

<script>
    function showIncomeForm() {
        document.getElementById("incomeForm").style.display = "block";
        document.getElementById("expenseForm").style.display = "none";
    }

    function showExpenseForm() {
        document.getElementById("incomeForm").style.display = "none";
        document.getElementById("expenseForm").style.display = "block";
    }
</script>

</body>
</html>
