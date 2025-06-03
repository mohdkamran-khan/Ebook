package com.DAO;

import java.util.List;

import org.apache.el.parser.BooleanNode;

import com.entity.BookDetails;
import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);

	public User login(String email, String password);
	
	public boolean checkPassword(int id, String ps); 
	
	public boolean updateProfile(User us);
	
	public List<User> getAllUsers();
	
	public boolean deleteUser(int id);
	
	public boolean checkUser(String em);

}
