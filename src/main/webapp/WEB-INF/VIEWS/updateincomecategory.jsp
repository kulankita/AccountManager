<%@page import="com.accountmanager.entities.IncomeCategory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Income Category</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        *{
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }
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
        <h1>Update Income Category</h1>
            <div class="form-group">
            <form action="abc" method="post">
                <label for="categoryId">Category ID:</label>
                <select class="form-control" id="category" name="category" required>
							<option value="" disabled selected>Select Category ID</option>
							<%
							List<IncomeCategory> categories = (List<IncomeCategory>) request.getAttribute("categories");
							for (IncomeCategory category : categories) {
							%>
							<option value="<%=category.getId()%>"><%=category.getName()%></option>
							<%
							}
							%>
						</select>
						<br>
						<input type="submit" value="show">
						 </form>
            </div>
            <%IncomeCategory ab = (IncomeCategory)request.getAttribute("i");
            if(ab != null){       
            %>
            <form action="nd" method="post">
            <input type="hidden" value="<%=ab.getId() %>" name="id">
            <div class="form-group">
                <label for="categoryName">Category Name:</label>
                <input type="text" class="form-control" id="categoryName" name="newname"  value="<%=ab.getName() %>">  
                
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" class="form-control" id="description" name="newdesc" value="<%=ab.getDescription() %>"></input>
               
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            
        </form>
        <% } %>
    </div>
</body>
</html>
