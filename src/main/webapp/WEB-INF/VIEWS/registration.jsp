<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<style type="text/css">
  *{
            font-family: 'Times New Roman', Times, serif;
        
        }
        
        div{
            border: 2px solid black;
            width: 450px;
            padding: 10px;
            margin-top: 60px;
            margin-left:380px;
           background-color: rgb(234, 231, 231, 0.9);
              font-size: 15px;
        }
        #name{
            height: 25px;
            width: 190px;
            margin: 5px;          
        }
        #code{
            width: 45px;
        }
        #phone{
            margin-bottom: 10px;
        }
        .button{
        	height:30px;
        	width:fit-content;
            margin-left: 180px;
        }
        .error{
        	color:red;
        }
        body {
	background-image: url("regibg.png");	
	background-size:cover;
	background-repeat: no-repeat;
  background-position-x: center;
}
   </style>    
       
</head>
<body>
 <div>
    <p style="font-size: 25px; font-weight: 900; text-align: center; color: rgb(42, 0, 139);"><u>Create New User</u></p>
    <form action="register" method="post" >    
    <label><b>Username: </b>  </label>         
    <input type="text" name="unm" id="name" pattern="^[a-zA-Z0-9._-]{3,}$"  required/> <br>
    <p class="error">(Please enter a valid username (at least 3 characters, letters, numbers, dots, underscores, or dashes only))</p>  
    <label><b>Password: </b>  </label>         
    <input type="password" name="pass"id="name" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required/> <br>
    <p class="error">(Please enter a valid password (at least 8 characters, at least one letter and one number))</p>  
    <label><b>Re-enter Password: </b>  </label>         
    <input type="password" name="repass"id="name"/> <br>  
    <p class="error">(Please enter password same as above)</p>  
    
    <input type="submit" value="Register" class="button"/>
   <p>Already registered? <a href="login" target="_blank">Go to login.</a></p>
   </p>
			<%
			if (request.getAttribute("MessageR") != null) {
			%>
			<p><%=request.getAttribute("MessageR")%></p>
			<%
			}
			%>
    </form>  
    </div>
</body>
</html>