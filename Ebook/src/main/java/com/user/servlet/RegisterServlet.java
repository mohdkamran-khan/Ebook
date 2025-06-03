package com.user.servlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2055534062912073388L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String name= req.getParameter("fname");
			String phno= req.getParameter("phno");
			String email= req.getParameter("email");
			String password= req.getParameter("password");
			String check= req.getParameter("check");
			
		//System.out.println(name+" "+phno+" "+email+" "+password+" "+check);
			User us= new User();
			us.setFullName(name);
			us.setPhoneNo(phno);
			us.setEmail(email);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null) {
				UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
				boolean f2= dao.checkUser(email);
				if(f2) {
					boolean f= dao.userRegister(us);
					if(f){
						//System.out.println("User Successfully Registered");
						session.setAttribute("succMsg", "Registration Successful!");
						resp.sendRedirect("register.jsp");
					}else {
						//System.out.println("Something Went Wrong");
						session.setAttribute("failMsg", "Something Went Wrong!");
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("failMsg", "User Already Exists. Please Try Again.");
					resp.sendRedirect("register.jsp");
				}		
			}else {
				//System.out.println("Please Agree To The Terms & Conditions");
				session.setAttribute("failMsg", "Please Agree To The Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
		 e.printStackTrace();   		
		 }
	}
}
