<%@page import="com.accountmanager.entities.Income"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Income Details</title>
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
<%@include file="menubar.jsp" %>
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
	</div>
</body>
</html>
