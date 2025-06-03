package com.DAO;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

import javax.swing.table.TableStringConverter;

import com.entity.BookDetails;

public interface BookDAO {
	
	public int addBooks (BookDetails b);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBoooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getAllOldBooks();

	public List<BookDetails> getBookByOld(String email, String cate);
	
	public boolean oldBookDelete(String email, String cat, int id);
	
	public List<BookDetails> getBookBySearch(String ch);
}
