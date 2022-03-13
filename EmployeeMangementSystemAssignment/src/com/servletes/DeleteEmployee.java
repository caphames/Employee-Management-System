package com.servletes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class DeleteEmployee extends HttpServlet{
	String emp_name;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		emp_name= req.getParameter("empname");
		
		
		
		
		//Connetion Of Database Code 
		try {
		Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
		String sql ="delete  from employees where Name=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, emp_name);
		ps.executeUpdate();
		
		out.println("<html><head><script>alert('Employee is Deleted Succefully !!!!');</script></head></html>");
		
		
		}catch(Exception e) {
			out.println(""+e);
		}
		
	}

}
