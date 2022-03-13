<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Page</title>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-sm-6">
	<div class="card">
			<div class="card-title text-center"><h1>Delete Record Page </h1></div>
	
	<div class="card-body">
	<form class="form-group" action="delete" method="post">
		<input class="form-control" type="text" name="empname" placeholder="Enter Name To Delete">
	<button type="submit" class="btn btn-danger mt-3">Delete</button>
	</form>
	</div>
		</div>
	</div>
</div>
</body>
</html>