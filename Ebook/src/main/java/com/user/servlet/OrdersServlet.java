package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrders;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			HttpSession session= req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name= req.getParameter("username");
			String email= req.getParameter("email");
			String phno= req.getParameter("phno");
			String address= req.getParameter("address");
			String landmark= req.getParameter("landmark");
			String city= req.getParameter("city");
			String state= req.getParameter("state");
			String pincode= req.getParameter("pincode");
			String paymentType= req.getParameter("payment");		
			
			String fullAddress=address+","+landmark+","+city+","+state+","+pincode;
			
//			System.out.println(name+" "+email+" "+phno+" "+fullAddress+". "+paymentType);
			
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist= dao.getBookByUser(id);
			
		    if(blist.isEmpty()) {
				session.setAttribute("failMsg", "Please Add Items To Your Cart");
		    	resp.sendRedirect("cart.jsp");    	
		    }else {
		    	BookOrderImpl dao2= new BookOrderImpl(DBConnect.getConn()); 
				
				BookOrders o= null;

				ArrayList<BookOrders> orderList= new ArrayList<BookOrders>();
				Random r= new Random();
				for(Cart c:blist) {
					o=new BookOrders();
					o.setOrderId("BOOK-ODR-00"+ r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladdress(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					
//					System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
				}
				
				if("notselected".equals(paymentType)) {
					session.setAttribute("failMsg", "Please Choose A Payment Method");
					resp.sendRedirect("cart.jsp");
				}else {
					boolean f= dao2.saveOrders(orderList);
					
					if(f) {
						resp.sendRedirect("order_success.jsp");
						//System.out.println("Order Success");
					}else {
						session.setAttribute("failMsg", "Sorry! Your Order Cannot Be Placed");
						resp.sendRedirect("cart.jsp");
						//System.out.println("Error");
					}
				}		

		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private CartDAOImpl CartDAOImpl(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

}
