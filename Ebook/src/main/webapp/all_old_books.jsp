<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.crd:hover{
background-color: #a8e6c4;
}
.txt{
color:#009688;
}
</style>
<head>
<meta charset="UTF-8">
<title>ebooks : All Old Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<%User u=(User)session.getAttribute("userobj");%>
 
 <div class="text-center mt-3 txt">
 <h2>Old Books</h2>
 </div>
 
<div class="container-fluid mt-2">
<div class="row">
<%
BookDAOImpl dao3= new BookDAOImpl(DBConnect.getConn());
List<BookDetails> list3= dao3.getAllOldBooks();
for(BookDetails b: list3){%>
<div class="col-md-3">
<div class="card crd mt-3">
<div class="card-body text-center">
<p><a href="view_books.jsp?bid=<%=b.getBookId()%>"><img alt="1984" src="books/<%=b.getPhotoName() %>" style="width:150px; height: 200px" class="img-thumblin"></a></p>
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>Category: <%=b.getBookCategory() %></p>
<div class="btn">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm text-white">View Details</a>
<a class="btn btn-danger btn-sm ml-1 text-white">₹<%=b.getPrice()%></a>
<% if(u==null){%>
	<a href="login.jsp" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}else{%>
	<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}%></div>
</div>
</div>
</div>
<%}
%>
</div>
</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>