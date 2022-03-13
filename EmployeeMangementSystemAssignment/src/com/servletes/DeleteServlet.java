package com.servletes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		int emp_id = Integer.parseInt(req.getParameter("emp_id"));
		PrintWriter out = res.getWriter();
		//out.println(""+emp_id);
		try {
			Class.forName("com.mysql.jdbc.Driver");//Register the Driver 
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/crudwebapp","root","");
			String sql ="delete  from employees where e_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, emp_id);
			ps.executeUpdate();
			
			out.println("<html><head><script>alert('Employee is Deleted Succefully !!!!');</script></head></html>");
			res.sendRedirect("index.jsp");
			
			}catch(Exception e) {
				out.println(""+e);
			}
				
	}

}
