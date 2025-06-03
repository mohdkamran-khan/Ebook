package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/allusers")
public class UserDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
		try {
			int id= Integer.parseInt(req.getParameter("id"));
			
			UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
		boolean f=dao.deleteUser(id);
			
		HttpSession session= req.getSession();
		
		if(f==true) {
			session.setAttribute("succMsg", "User Deleted Successfully");
			resp.sendRedirect("admin/all_users.jsp");
		}else {
			session.setAttribute("failMsg", "User Deletion Failed");
			resp.sendRedirect("admin/all_users.jsp");
		}					
		} catch (Exception e) {
	     e.printStackTrace(); 
		}
	}	
	
}
