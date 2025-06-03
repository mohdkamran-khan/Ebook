package com.DAO;

import java.security.PublicKey;
import java.util.List;

import com.entity.BookOrders;

public interface BookOrderDAO {
	
	public boolean saveOrders(List<BookOrders> b); 
	
	public List<BookOrders> getBook(String email); 
	
	public List<BookOrders> getAllOrders();
}
