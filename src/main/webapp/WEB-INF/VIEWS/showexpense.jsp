<%@page import="com.accountmanager.entities.Expense"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
   
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expenses Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}
</style>
</head>
<body>
<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<div class="container">
	<h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Expense Details</h1>
		<form method="get" action="showallexp">
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
	</div>
</body>
</html>
