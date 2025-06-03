<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All eBooks</title>
<%@include file="allCss.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

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

<h3 class="all text-center">All Books List</h3>

<c:if test="${not empty succMsg}">
<h5 class="text-center text-success">${succMsg}</h5>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failMsg}">
<h5 class="text-center text-danger">${failMsg}</h5>
<c:remove var="failMsg" scope="session"/>
</c:if>

<table class="table table-striped">
  <thead class="bg">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price (in ₹)</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
   List<BookDetails> list= dao.getAllBooks();
   for(BookDetails b:list){
	%>   
   <tr>
      <td><%=b.getBookId() %></td>
      <td><img src="../books/<%=b.getPhotoName()%>" style="width:50px; height:60px;"></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus()%></td>
      
      <td> 
      <a href="edit_books.jsp?id=<%= b.getBookId()%>" class="btn btn-sm mr-2" style="background-color: #009688; color: white;"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
      <a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
      </td>
    </tr>
   <%}
  %>
  
  </tbody>
</table>

 <%@include file="footer.jsp"%>

</body>
</html>