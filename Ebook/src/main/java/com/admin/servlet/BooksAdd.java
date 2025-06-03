package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7056115986768638012L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			Part part= req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			BookDetails b= new BookDetails(bookName,author,price,category,status,fileName,"admin@gmail.com");

			BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
			
			int i=dao.addBooks(b);
			
			HttpSession session=req.getSession();
      		if(i>0) {
				
      			String path=getServletContext().getRealPath("")+"books";

    			File fl= new File(path);
    			part.write(path+ File.separator+fileName);
				
				session.setAttribute("succMsg", "Book Added Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}else {
				session.setAttribute("failMsg", "Failed To Add Book");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
