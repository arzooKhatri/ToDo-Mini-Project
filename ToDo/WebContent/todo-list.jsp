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
.btn-success
{
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
   font-size: 20px;
}
</style> 
<style>
.container {
border-radius: 25px;
background-color: #3c86d5;
padding: 60px;
margin-top: 30px;
margin-bottom: 50px;
border-bottom-style: solid;
border-color: #50e54b;
  }
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #3c86d5">
						<div style="color: white">| | TODO Application  | |  </div>
			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><u><a href="<%=request.getContextPath()%>/logout" class="nav-link" style="color: white">Logout</a></u></li>
			</ul>
		</nav>
	</header>

	<div class="container" style="overflow: auto">
		<div class="card">
			<div class="card-body">
			<h3 class="text-center">List of Todos</h3>
			<hr>
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add Todo</a>
	
			<br><table class="table table-bordered">
				<thead>
					<tr>
						 <th>Title</th>
						<th>Todo Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="todo" items="${listTodo}">
						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>	&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>