<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String user=(String)session.getAttribute("user");
session.invalidate();
response.sendRedirect("login.jsp");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogOut Page </title>
</head>
<body>

</body>
</html>