package com.servletes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet{
	String email,password;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		
		email = req.getParameter("uemail");
		password = req.getParameter("upass");
		
		//out.println(""+email);
		//out.println(""+password);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
			
			Statement stmt = con.createStatement();
			
			String sql = "select * from users where email='"+email+"' and password1='"+password+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				HttpSession session = req.getSession();
				session.setAttribute("user", email);
				res.sendRedirect("index.jsp");
				//out.println("Login Succefully !!!");
			}
			else {
				out.println("Login Failed !!!");
			}
			
				
		}catch(Exception e) {
			out.println(""+e);
		}
		
		
		
	}

}
