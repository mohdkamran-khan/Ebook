package com.entity;

public class User {

	private int id;
	private String fullname;
	private String phoneno;
	private String email;
	private String password;
	private String address;
	private String city;
	private String state;
	private int pincode;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullname;
	}
	public void setFullName(String fullname) {
		this.fullname = fullname;
	}
	public String getPhoneNo() {
		return phoneno;
	}
	public void setPhoneNo(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", phoneno=" + phoneno + ", email=" + email + ", password="
				+ password + ", address=" + address + ", city=" + city + ", state=" + state + ", pincode=" + pincode
				+ "]";
	}
}
