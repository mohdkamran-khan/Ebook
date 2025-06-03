<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Edit eBooks</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
.navbar{
	background-color: #009688;
	color: white;
}
.add{
color:#009688;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

<div class="container p-2">
<div class="row">
<div class="col-md-4 offset-md-4 p-2">
<div class="card">
<div class="card-body">

<h3 class="add text-center">Edit Book</h3>

<%
int id=Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
BookDetails b=dao.getBookById(id);

%>

<form action="../edit_books" method="post">
<input type="hidden" name="id" value="<%=b.getBookId()%>">

  <div class="form-group">
    <label for="addbooks" class="form-label">Book Name</label>
    <input name="bname" type="text" class="form-control" id="addbooks" placeholder="Enter Book Name" required="required" aria-describedby="addbookshelp" value="<%=b.getBookName()%>">
  </div>
  
    <div class="form-group">
    <label for="authorname" class="form-label">Author Name</label>
    <input name="author" type="text" class="form-control" id="addbooks" placeholder="Enter Author Name" aria-describedby="authorhelp" value="<%=b.getAuthor()%>">
  </div>
    <div class="form-group">
    <label for="pricebbooks" class="form-label">Price</label>
    <input name="price" type="tel" class="form-control" id="addbooks" placeholder="In ₹" required="required" aria-describedby="pricehelp" value="<%=b.getPrice()%>">
  </div>
  
    <div class="form-group">
    <label for="inputState" class="form-label">Book Categories</label>
    <select name="category" class="form-control" id="inputState"> 
    <% if("New".equals(b.getBookCategory())){%>
        <option value="New">New Book</option>
    <option value="Old">Old Book</option>
    <%}else{%>
    <option value="Old" >Old Book</option>
    <option value="New">New Book</option>
    <%}%>
    </select>
  </div>
  
  <div class="form-group">
    <label for="inputState" class="form-label">Book Status</label>
    <select name="status" class="form-control" id="inputState"> 
    <% if("Active".equals(b.getStatus())){%>
        	    <option value="Active">Active</option>
    	    <option value="InActive">InActive</option>
    <%}else{%>
        	    <option value="InActive">InActive</option>
    	    <option value="Active">Active</option>
    <%}%>
    </select>
  </div>
	<div class="text-center">  
    <button type="submit" class="btn" style="background-color: #009688; color: white;">Update</button>
    </div>
</form>
 
</div>
</div>
</div>
</div>
</div>

 <%@include file="footer.jsp"%>

</body>
</html>