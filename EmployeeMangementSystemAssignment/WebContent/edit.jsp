<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
</head>
<body>
<%@include file="navbar.jsp" %>

	<% int up_id =Integer.parseInt(request.getParameter("emp_id"));
	   //out.println(""+up_id);
	   try{
		   Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
		   String sql ="select * from employees where e_id="+up_id;
		   Statement stmt =con.createStatement();
		   ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
		%>	
			<div class="row justify-content-center">
		<div class="col-sm-8">
			<h1> Edit Employee Details</h1>  
			<br><br>
			<form class="form-group" action="update" method="post">
			<input type="hidden" name="edit_id" value="<%= rs.getInt("e_id")%>">
    			<label  class="form-label" for="name">Enter Name </label>
    				<input name="emp_name" type="text" value="<%= rs.getString("Name")%>" class="form-control mb-3" >
    			<label class="form-label" for="email">Enter Email </label>
    				<input name="emp_email" type="email" value="<%= rs.getString("Email")%>" class="form-control mb-3" >
    			<label class="form-label" for="mobile" >Enter Mobile</label>
    				<input name="emp_mobile" type="text" value="<%= rs.getString("Mobile")%>" class="form-control mb-3" >
    			<label class="form-label" for="desg">Designation</label>
    				<input name="emp_desg" type="text" value="<%= rs.getString("Desg")%>" class="form-control mb-3">
    			<label class="form-label" for="salary">Salary</label>
    				<input name="emp_salary" type="text" value="<%= rs.getString("Salary")%>" class="form-control mb-3">
    			
    			<button class="btn btn-success mb-4" type="submit">Update </button>
    		</form>
			
		</div>
	</div>
		<%}
			
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	%>
</body>
</html>