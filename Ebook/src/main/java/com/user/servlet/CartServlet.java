package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -230569923062403934L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			int bid=Integer.parseInt(req.getParameter("bid")); 
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
			BookDetails b= dao.getBookById(bid);
			
			Cart c= new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
			Boolean f= dao2.addCart(c);
			
			HttpSession session= req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book Added To Cart");
				resp.sendRedirect("index.jsp");
				
			}else {
				session.setAttribute("failed", "Could Not Add To Cart");
				resp.sendRedirect("index.jsp");			
				}			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
