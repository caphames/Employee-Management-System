package com.servletes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class AddEmployee extends HttpServlet{
	String Emp_name,Emp_email,Emp_mobile,Emp_desg,Emp_salary;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		Emp_name= req.getParameter("emp_name");
		Emp_email= req.getParameter("emp_email");
		Emp_mobile= req.getParameter("emp_mobile");
		Emp_desg= req.getParameter("emp_desg");
		Emp_salary= req.getParameter("emp_salary");
		
		
		//out.println(""+user_name);
		//out.println(""+user_email);
		//out.println(""+user_pass1);
		//out.println(""+user_pass2);
		
		
		//Connetion Of Database Code 
		try {
		Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
		String sql ="insert into employees(Name,Email,Mobile,Desg,Salary) values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, Emp_name);
		ps.setString(2, Emp_email);
		ps.setString(3, Emp_mobile);
		ps.setString(4, Emp_desg);
		ps.setString(5, Emp_salary);
		
		
		ps.executeUpdate();
		
		out.println("<html><head><script>alert('Your Data is inserted Succefully !!!!');</script></head></html>");
		res.sendRedirect("index.jsp");
		
		}catch(Exception e) {
			out.println(""+e);
		}
		
	}

}
