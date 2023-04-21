<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TODO</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.container {
	border-radius: 20px;
	background-color: #3c86d5;
	padding: 60px;
	margin-top: 80px;
	border-bottom-style: solid;
	border-color: #50e54b;	
 }
}
</style>
<style>
.alert-success {
	color: #337ab7;
	background-color: #fff;
}
</style>
<style>
.btn-info {
	color: #337ab7;
	background-color: #fff;
	border-color: #2e6da4;
	font-size: 20px;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container" style="overflow: auto">
	<h2 align = "center"> Register Form</h2>
			<form action="<%=request.getContextPath()%>/register" method="post">
				<div class="form-group">
						<label for="uname">First Name:</label>
						 <input type="text"	class="form-control" id="uname" placeholder="First Name" name="firstName" required>
				</div>
				<div class="form-group">
					<label for="uname">Last Name:</label> 
					<input type="text" class="form-control" id="uname" placeholder="last Name" name="lastName" required>
				</div>
				<div class="form-group">
					<label for="uname">User Name:</label> 
					<input type="text" class="form-control" id="username" placeholder="User Name" name="username" required>
				</div>
				<div class="form-group">
					<label for="uname">Password:</label>
					 <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
				</div>
				<center>
				<button type="submit" class="btn btn-info">Submit</button>
				</center>
				
				<a href="login.jsp" style="color:#fff;">Click Me For Login</a>
				
				<div class="alert-success" role="alert">
					<p>${NOTIFICATION}</p>
				</div>
			</form>
			</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>