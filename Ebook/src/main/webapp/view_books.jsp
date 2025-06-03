<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBooks : View Book Details</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.dts{
color: #009688;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<%User u=(User)session.getAttribute("userobj");%>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
BookDetails b= dao.getBookById(bid);

%>

<div class="container">
<div class="row p-5">
<div class="col-md-6 text-center">
<img src="books/<%=b.getPhotoName()%>" style="height:170px; width:140px;">
<h4 class="text-dark mt-4">Book Name : <span class="dts"><%=b.getBookName()%></span></h4>
<h4 class="text-dark">Author Name : <span class="dts"><%=b.getAuthor()%></span></h4>
<h4 class="text-dark">Category : <span class="dts"><%=b.getBookCategory() %></span></h4>
</div>

<div class="col-md-6">
<h2 class="dts text-center"><%=b.getBookName() %></h2>
<div class="row mt-5">
<p class="mr-5"><i class="fa-solid fa-money-bills"></i> Cash On Delivery</p>
<p class="mr-5"><i class="fa-solid fa-lock"></i> Secure Transaction</p><br>
<p><i class="fa-solid fa-repeat"></i> Easy Returns</p>
<p class="mr-5"><i class="fa-solid fa-circle-check"></i> Genuine Product</p>
<p class="mr-5 mx-4"><i class="fa-solid fa-truck"></i> Free Delivery</p>
</div>

<div class="text-center mt-3">
<a class="btn btn-danger btn-md ml-2 text-white">₹<%=b.getPrice() %></a>
<% if(u==null){%>
	<a href="login.jsp" class="btn btn-success btn-md ml-2 text-white"><i class="fa-solid fa-cart-plus"></i> Add To Cart</a>
<%}else{%>
	<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-success btn-md ml-2 text-white"><i class="fa-solid fa-cart-plus"></i> Add To Cart</a>
<%}%>
</div>

<div class="mail text-center mt-4">
<h6>Contact Seller : <span style="color: #009688;"><i class="fa-solid fa-envelope"></i> <u><%=b.getEmail()%> </u></span></h6>
</div>

</div>
</div>
</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>