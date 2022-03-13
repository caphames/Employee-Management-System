<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Page</title>
</head>
<body>
	<div class="row justify-content-center">
		<div class="col-sm-8">
			<h1> Add New Employee </h1>  
			<br><br>
			<form class="form-group" action="AddEmployee" method="post">
    			<label  class="form-label" for="name" >Enter Name </label>
    				<input name="emp_name" type="text" class="form-control mb-3" >
    			<label class="form-label" for="email">Enter Email </label>
    				<input name="emp_email" type="email" class="form-control mb-3" >
    			<label class="form-label" for="mobile" >Enter Mobile</label>
    				<input name="emp_mobile" type="text" class="form-control mb-3" >
    			<label class="form-label" for="desg">Designation</label>
    				<input name="emp_desg" type="text" class="form-control mb-3">
    			<label class="form-label" for="salary">Salary</label>
    				<input name="emp_salary" type="text" class="form-control mb-3">
    			
    			<button class="btn btn-primary mb-4" type="submit">Add To Database</button>
    		</form>
			
		</div>
	</div>
</body>
</html>