<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp" %>
<% 
 HttpSession s  = request.getSession();
s.getAttribute("user");
out.println("You Are Logged In As "+user);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<br><br><br>
	<div class="row justify-content-center">
		<div class="col-sm-8"><a  class="btn btn-primary" href="add.jsp">Add</a>
	<table class="table">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
      <th scope="col">Designation</th>
      <th scope="col">Salary</th>
       <th scope="col">Update</th>
       <th scope="col">Delete</th>
       
    </tr>
  </thead>
  <tbody>
    <tr>
    <% 
    if(user==null){
    	response.sendRedirect("login.jsp");
    	out.println("Log in To System First ");
    }else{
try{
	Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
	String sql ="select * from employees";
	Statement stmt =con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
	//	out.println(""+rs.getString("Name"));
	
	
 %>   
      <td><% out.println(rs.getString("Name"));%></td>
      <td><% out.println(rs.getString("Email"));%></td>
      <td><% out.println(rs.getString("Mobile"));%></td>
      <td><% out.println(rs.getString("Desg"));%></td>
      <td><% out.println(rs.getString("Salary")+"<br>");%></td>
      <td><a href="edit.jsp?emp_id=<%= rs.getInt("e_id") %>">Update</a></td>
      <td><a href="delete?emp_id=<%= rs.getInt("e_id") %>">Delete</a></td>
	
    </tr>
<%
}
}catch(Exception e){
	out.println(""+e);
}
    }
%>
    
  </tbody>
</table>
</div>
</div>	
</body>
</html>