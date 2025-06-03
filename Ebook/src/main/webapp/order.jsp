<%@page import="com.entity.BookOrders"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Orders</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.hed{
color: #009688;
}
.inc{
bottom:0px;
width:100%;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect> 
</c:if>

<div class="container p-3">
<div class="card">
<h3 class="hed text-center mt-2">All Orders</h3>

<table class="table table-striped mt-2">
  <thead>
    <tr class="hed">
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price (in₹)</th>
      <th scope="col">Payment Type</th>
      <th scope="col">Order Status</th>
    </tr>
  </thead>
  
  <tbody>
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderImpl dao= new BookOrderImpl(DBConnect.getConn());
  List<BookOrders> blist=dao.getBook(u.getEmail());

  for(BookOrders b:blist){%>
	 <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUsername()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>      
      <td><%=b.getPaymentType() %></td>     
      <td> In Transit</td> 
    </tr>  
  <%}
  %> 

  </tbody>
</table>
</div>
</div>

<div class="inc">
<%@include file="all_component/footer.jsp"%>
</div>

</body>
</html>