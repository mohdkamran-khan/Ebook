<%@page import="com.entity.BookOrders"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Orders</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
.navbar{
	background-color: #009688;
	color: white;
}
.bg{
background-color: black;
color: white;
}
.all{
color: #009688;
padding:10px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

<h3 class="all text-center">All Orders</h3>

<table class="table table-striped">
  <thead class="bg">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Customer Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      <th scope="col">Order Status</th>
    </tr>
  </thead>
  <tbody>
  <%
  BookOrderImpl dao= new BookOrderImpl(DBConnect.getConn());
  List<BookOrders> blist= dao.getAllOrders();
  for(BookOrders b: blist){%>
	    <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladdress() %></td>
      <td><%=b.getPhno() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
      <td>In Transit</td>
    </tr>
 <%}
  
  %>
  
  
  </tbody>
</table>

 <%@include file="footer.jsp"%>

</body>
</html>