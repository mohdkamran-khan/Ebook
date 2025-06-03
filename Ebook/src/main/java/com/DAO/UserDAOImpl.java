package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.User;

public class UserDAOImpl implements UserDAO{

	@Override
	public boolean checkPassword( int id, String ps) {
		
		boolean f=false;
		try {
			String sql= "select * from user where ID=? and Password=?";
			PreparedStatement pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public boolean updateProfile(User us) {
		
        boolean f=false;
		
		try {
			String sql="update user set FullName=?, Email=?, PhoneNo=? where ID=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getFullName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneNo());
			ps.setInt(4, us.getId());
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	private Connection conn;
	public UserDAOImpl(Connection conn) {
		super();
		this.conn=conn;
		}
	
	public boolean userRegister(User us) {
		boolean f=false;
		
		try {
			String sql="insert into user(FullName, PhoneNo, Email, Password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getFullName());
			ps.setString(2, us.getPhoneNo());
			ps.setString(3, us.getEmail());
			ps.setString(4, us.getPassword());
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		
		User us= null;
		
		try {
			String sql= "select * from user  where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				us= new User();
				us.setId(rs.getInt(1));
				us.setFullName(rs.getString(2));
				us.setPhoneNo(rs.getString(3));
				us.setEmail(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setCity(rs.getString(7));
				us.setState(rs.getString(8));
				us.setPincode(rs.getInt(9));
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return us;
	}
	@Override
	public List<User> getAllUsers() {
		
		List<User> list=new ArrayList<User>();
		User b= null;
		try {
		 String sql="select * from user";
		 PreparedStatement ps= conn.prepareStatement(sql);
		 ResultSet rs= ps.executeQuery();
		 while(rs.next()){
			 b=new User();
			 b.setId(rs.getInt(1));
			 b.setFullName(rs.getString(2));
			 b.setPhoneNo(rs.getString(3));
			 b.setEmail(rs.getString(4));
			 list.add(b);
		 }
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean deleteUser(int id) {
		boolean f= false;
		try {
			String sql= "delete from user where ID=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}
		
		} catch (Exception e) {
			e.printStackTrace();
        }
		return f;
	}
	@Override
	public boolean checkUser(String em) {
        boolean f= true;
        
        try {
    			String sql="select * from user where Email=?";
    			PreparedStatement ps=conn.prepareStatement(sql);
    			ps.setString(1, em);
    		
    			ResultSet rs= ps.executeQuery();
    			while(rs.next()) {
    				f=false;
    			}
    			
        } catch (Exception e) {
			e.printStackTrace();
        }
		return f;
	}	
}
