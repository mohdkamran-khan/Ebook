package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -145895673714076455L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out=resp.getWriter();
		out.print("Hello");
		
		try {	
			UserDAOImpl dao =new UserDAOImpl(DBConnect.getConn());

			HttpSession session= req.getSession();
			
			String email= req.getParameter("email");
			String password= req.getParameter("password");
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us= new User(); 
				us.setFullName("Admin");
				session.setAttribute("userobj", us);
			    resp.sendRedirect("admin/admin-home.jsp");	
			}else {	
				User us= dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failMsg", "Invalid Email or Password");
					resp.sendRedirect("login.jsp");
				}
				//resp.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
		   e.printStackTrace();
		}
	}
}
