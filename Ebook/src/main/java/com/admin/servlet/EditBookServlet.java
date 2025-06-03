package com.admin.servlet;

import java.awt.image.DataBuffer;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_books")
public class EditBookServlet extends jakarta.servlet.http.HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     try {
    	    int id=Integer.parseInt(req.getParameter("id"));
    	    String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			
			BookDetails b= new BookDetails();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setBookCategory(category);
			b.setStatus(status);
			
			BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session= req.getSession();
			
			if(f==true) {
				session.setAttribute("succMsg", "Book Updated Successfully");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failMsg", "Book Updation Failed");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

}
