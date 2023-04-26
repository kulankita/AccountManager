<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
    
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
function showForm(){
	document.getElementbyId("display").style.display = "block";
} 
</script>
-->
<style type="text/css">
body{
	background-image: url("bg.png");
	background-repeat: no-repeat;
  background-attachment: fixed;
	background-position: 500px 160px;
	background-size: 60%;
	
}
</style>
</head>
<body>
	<header>
		<%@ include file="menubar.jsp"%>
	</header>
	<br>
	<br>
	<h2 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">Let's Get To Know Your Updated Balance  <%=session.getAttribute("uname") %> !!!</h2>

	<form action="getbalance" method="post">
		<input type="submit" value="Show Balance" onclick="showForm()"
			class="btn btn-primary">
	</form>
	<%
		Double totalIncomeAmount = (Double) request.getAttribute("totalIncomeAmount");
		if (totalIncomeAmount == null) {
			totalIncomeAmount = 0.0;
		}
		%>
	<%
		Double totalExpenseAmount = (Double) request.getAttribute("totalExpenseAmount");
		if (totalExpenseAmount == null) {
			totalExpenseAmount = 0.0;
		}
		%>
	<%
		Double balance = (Double) request.getAttribute("balance");
		if (balance == null) {
			balance = 0.0;
		}
		%>
		<%
		Double debt = (Double) request.getAttribute("debt");
		if (debt == null) {
			debt = 0.0;
		}
		%>

	<form action="getbalance" method="post" id="display"
		style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; margin-left: 30px; margin-top: 20px;">
				
		<h3>
			Your Current Total Income is
			<%-- <%=request.getAttribute("totalIncomeAmount")%> --%>
			<%=totalIncomeAmount %>
			</h3>
		
		<h3>
			Your Current Total Expenses are
			
			<%=totalExpenseAmount%> </h3>
		
		<h3>
			Total Balance =
			<%=balance%></h3>
			
			<h3 style="color: crimson;">
			Your Debt =
			<%=debt%></h3>
	</form>
	
	

	
</body>