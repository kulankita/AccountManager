<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login-page {
	
	padding: 8% 0 0;
	/* margin: auto; */
}

.form {
	position: relative;
	z-index: 1;
	background-color: rgb(234, 231, 231, 0.9);
	max-width: 360px;
	margin-left: 450px;
	margin-top: 80px;
	/* margin: 60px auto 100px; */
	padding: 45px;
	text-align: center;
}

.form img {
	padding: 15px;
	margin: 0 0 15px;
}

.form .txt {
	outline: 0;
	background-color:rgb(255, 255, 255, 0.5);
    color: #000000;
	width: 100%;
	border: 1px solid black;
    border-radius: 10px;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 20px;
}

.form .btn  {
	font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
	text-transform: uppercase;
	outline: 0;
	background: #029cf4;
    color: #ffffff;
	width: 100%;
	border: 0;
	padding: 10px;
	font-size: 15px;
    cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #000000;
	font-size: 18px;
    font-weight: bolder;
}

.form .message a {
	color: #ff0062;
	text-decoration: none;
    font-size: 18px;
    font-weight: bolder;
}

.form .register-form {
	display: none;
}

body {
	background-image: url("loginbg.png");	
	background-size:cover;
	background-repeat: no-repeat;
  background-position-x: center;
}
</style>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="login-page">
	<div class="form">
		<form class="login-form" action="save" method="post">
			<input type="text" name="unm" placeholder="username" class="txt" pattern="^[a-zA-Z0-9._-]{3,}$" />
			<input type="password" name="pass" placeholder="password" class="txt"  pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"/>
			 <input type="submit" value="login" class="btn"/>
			<p class="message">
				Not registered? <a href="register" >Create an account</a>
			</p>		
			<%
			if (request.getAttribute("message") != null) {
			%>
			<p><%=request.getAttribute("message")%></p>
			<%
			}
			%>
		</form>
	</div>
	</div>
</body>
</html>