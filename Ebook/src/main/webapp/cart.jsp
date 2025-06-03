<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Cart</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.color{
color: #009688;
font-size: 22px;
font-weight: bold;
}
.clr{
color: grey;
}
.sup {
	color: red;
}
</style>

</head>
<body>

<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect> 
</c:if>

<c:if test="${not empty succMsg}">
<div class="alert alert-success text-center" role="alert">${succMsg }</div>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failMsg}">
<div class="alert alert-danger text-center" role="alert"> ${failMsg } </div>
<c:remove var="failMsg" scope="session"/>
</c:if>

<div class="container p-3">
<div class="row p-2">
<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center" style="color: #009688;">Cart Items</h3>
<table class="table table-striped">
  <thead>
    <tr class="clr">
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col"><sup>*</sup>Price(in₹)</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userobj");
  
  CartDAOImpl dao= new CartDAOImpl(DBConnect.getConn());
  List<Cart> cart= dao.getBookByUser(u.getId());
  Double totalPrice=0.00;
  for(Cart c:cart){
	  totalPrice = c.getTotalPrice();
  %>
	  <tr>
      <th scope="row"><%=c.getBookName() %></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" class="btn btn-danger" style="color: white;"><i class="fa-solid fa-trash"></i> Remove</a></td>
    </tr>  
  <%}
  %>
  <tr>
  <p> </p>
  <td class="color mt-4">Total Price:</td>
  <td> </td>
  <td> </td>
  <td class="color">₹ <%=totalPrice %></td>
  </tr>
  </tbody>
</table>
    <span class="cp text-success"><i class="fa-solid fa-tag"></i>10% Off Coupon Applied</span><br>
    <span class="text-muted"><sup>*</sup>All Prices Are Inclusive Of Taxes</span>
</div>
</div>
</div>

<div class="col-md-6">
<div class="card">
<div class="card-body">
<h3 class="text-center" style="color: #009688;">User Details</h3><hr>
<form action="orders" method="post">
<input type="hidden" value="${userobj.id}" name="id"/>

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputName4">Name<sup class="sup">*</sup></label>
      <input type="text" name="username" class="form-control" id="inputName4" value="<%=u.getFullName() %>" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" name="email" class="form-control" id="inputEmail4" value="<%=u.getEmail() %>" readonly="readonly">
    </div>
  </div><div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputTel4">Mobile No<sup class="sup">*</sup></label>
      <input type="tel" name="phno" class="form-control" id="inputTel4" value="<%=u.getPhoneNo() %>" placeholder="Enter Phone No" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputAddress4">Address<sup class="sup">*</sup></label>
      <input type="text" name="address" class="form-control" id="inputAddress4" placeholder="Enter Your Delivery Address" required>
    </div>
  </div><div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputLandmark4">Landmark</label>
      <input type="text" name="landmark" class="form-control" id="inputLandmark4" placeholder="Enter Nearest Landmark">
    </div>
    <div class="form-group col-md-6">
      <label for="inputCity4">City<sup class="sup">*</sup></label>
      <input type="text" name="city" class="form-control" id="inputCity4" placeholder="Enter Your City" required>
    </div>
  </div><div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputState4">State<sup class="sup">*</sup></label>
      <input type="text" name="state" class="form-control" id="inputText4" placeholder="Enter Your State" required>
    </div>
    <div class="form-group col-md-6">
      <label for="inputPin4">Pin Code<sup class="sup">*</sup></label>
      <input type="tel" name="pincode" class="form-control" id="inputPin4" placeholder="Pin Code" required>
    </div>
  </div>
  <div class="form-group">
      <label for="inputPayment">Payment Type<sup class="sup">*</sup></label>
      <select id="inputPayment" class="form-control" name="payment">
        <option value="notselected" selected>Select Payment Type...</option>
        <option value="COD">Pay On Delivery</option>
        <option value="UPI">UPI</option>
      </select>
    </div>
     <p class="sup">
       <sup>*</sup>indicates required fields.
	</p>
    <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">Save Details For Faster Checkout</label>
    </div>
  </div>
  <div class="text-center">
  <button type="submit" class="hv btn mr-2" style="background-color: #009688; color: white;">Order Now</button>
  <a href="index.jsp" class="btn btn-warning">Continue Shopping</a>
  </div>
</form>
</div>
</div>
</div>

</div>
</div>
 
<div class="inc">
 <%@include file="all_component/footer.jsp"%>
</div> 
 
</body>
</html>