<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>TODO</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<style>
.container {
border-radius: 25px;
background-color: #3c86d5;
padding: 60px;
margin-top: 80px;
border-bottom-style: solid;
border-color: #50e54b;
  }
}
</style>
<style>
.btn-success
{
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
   font-size: 20px;
}
</style> 
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #3c86d5">
			<div style="color: white">| | TODO Application  | |  </div>

			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><u><a href="<%=request.getContextPath()%>/list" class="nav-link" style="color: white">  Todo List</a></u></li>
				<li><u><a href="<%=request.getContextPath()%>/logout" class="nav-link" style="color: white">Logout</a></u></li>
			</ul>
			 
		</nav>
	</header>
	
	<div class="container" style="overflow: auto">
		<div class="card">
			<div class="card-body">
				<c:if test="${todo != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${todo == null}">
					<form action="insert" method="post">
				</c:if>

				<caption><h2>
				<c:if test="${todo != null}"> Edit Todo </c:if>
				<center>
				<c:if test="${todo == null}"> Add New Todo </c:if>
				</center></h2></caption>

				<c:if test="${todo != null}">
					<input type="hidden" name="id" value="<c:out value='${todo.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Todo Title :</label> <input type="text"
						value="<c:out value='${todo.title}' />" class="form-control"
						name="title" required="required" minlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>Todo Decription :</label> <input type="text"
						value="<c:out value='${todo.description}' />" class="form-control"
						name="description" minlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>Todo Status :</label> <select class="form-control"
						name="isDone">
						<option value="false">Start</option>
						<option value="true">Complete</option>
					</select>
				</fieldset>
				
				<center>
				<button type="submit" class="btn btn-success">Save</button>
				</center>
			
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
