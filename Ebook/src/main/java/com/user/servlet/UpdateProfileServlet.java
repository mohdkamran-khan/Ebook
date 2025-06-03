package com.user.servlet;

import java.io.IOException;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_profile")
public class UpdateProfileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1081076430921821402L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
			int id= Integer.parseInt(req.getParameter("id"));
			String name= req.getParameter("fname");
			String phno= req.getParameter("phno");
			String email= req.getParameter("email");
			String password= req.getParameter("password");
			
			User us= new User();
			us.setId(id);
			us.setFullName(name);
			us.setEmail(email);
			us.setPhoneNo(phno);
			
			HttpSession session = req.getSession();
			UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
			boolean f= dao.checkPassword(id, password);
			
		    if(f) {
		    	boolean f2= dao.updateProfile(us);
		    	if(f2) {
		    		session.setAttribute("succMsg", "Profile Updated Successfully!");
					resp.sendRedirect("edit_profile.jsp");
		    	}else {
		    		session.setAttribute("failMsg", "Something Went Wrong");
					resp.sendRedirect("edit_profile.jsp");
		    	}
		    }else {
		    	session.setAttribute("failMsg", "Incorrect Password");
				resp.sendRedirect("edit_profile.jsp");
		    }				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}