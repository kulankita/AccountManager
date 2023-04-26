<%@page import="com.accountmanager.entities.Expense"%>
<%@page import="com.accountmanager.entities.Income"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Expense Details</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
	<div class="container">
		<h1>Edit Expense Details</h1>
		 <form action="expe" method="post">
                <label for="categoryId">Expense ID:</label>
                <select class="form-control" id="id" name="id" required>
							<option value="" disabled selected>Select Expense</option>
							<%
							List<Expense> incomes = (List<Expense>) request.getAttribute("incomes");
							for (Expense ic : incomes) {
							%>
							<option value="<%=ic.getId()%>"><%=ic.getDescription()%></option>
							<%
							}
							%>
						</select>
						<br>
						<input type="submit" value="show">
						 </form>
				<%
				Expense e = (Expense)request.getAttribute("a");
				if(e != null) {      
            %>		 
						 
		<form method="post" action="expe2">
			<input type="hidden" name="id" value="<%= e.getId() %>">
			<div class="form-group">
				<label for="date">Date:</label>
				<input type="date" class="form-control" id="dateInput" name="date" value="<%= e.getDate() %>" onchange="validateDate()">
			</div>
			<div class="form-group">
				<label for="name">Name:</label>
				<input type="text" class="form-control" id="name" name="name" value="<%= e.getName() %>" >
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<input type="text" class="form-control" id="description" name="description" value="<%= e.getDescription() %>" >
			</div>
			<div class="form-group">
				<label for="amount">Amount:</label>
				<input type="number" class="form-control" id="amount" name="amount" value="<%= e.getAmount() %>" >
			</div>
			<div class="form-group">
				<label for="mode">Mode:</label>
				<input type="text" class="form-control" id="mode" name="mode" value="<%= e.getMode() %>" >
							</div>
			<div class="form-group">
				<label for="transactionId">Transaction ID:</label>
				<input type="text" class="form-control" id="transactionId" name="transactionId" value="<%= e.getTransactionId() %>">
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
		 <% } %>
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
