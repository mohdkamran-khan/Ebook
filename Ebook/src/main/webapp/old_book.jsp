<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Manage Books</title>
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

<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session"/>
						</c:if>

<div class="container p-3">
<div class="card">
<h3 class="hed text-center mt-2">All Old Books</h3>

<table class="table table-striped mt-2">
  <thead>
    <tr class="hed">
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Condition</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  User u=(User)session.getAttribute("userobj");
  String email= u.getEmail();
  BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
  List <BookDetails> list= dao.getBookByOld(email, "Old"); 
  for(BookDetails b: list){%>
	   <tr>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-danger" style="color: white;"><i class="fa-solid fa-trash"></i> Remove</a> </td>
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