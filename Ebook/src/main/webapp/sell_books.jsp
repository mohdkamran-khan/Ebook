<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Sell Old Books</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.add{
color:#009688;
}
</style>
</head>
<body>
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_component/navbar.jsp" %>

<div class="container p-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h3 class="add text-center">Sell Book</h3>

<c:if test="${not empty succMsg}">
<p class="text-center text-success">${succMsg}</p>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failMsg}">
<p class="text-center text-danger">${failMsg}</p>
<c:remove var="failMsg" scope="session"/>
</c:if>

<form action="add_old_books" method="post" enctype="multipart/form-data">

<input type="hidden" value="${userobj.email}" name="user">

  <div class="form-group">
    <label for="addbooks" class="form-label">Book Name</label>
    <input name="bname" type="text" class="form-control" id="addbooks" placeholder="Enter Book Name" required="required" aria-describedby="addbookshelp">
  </div>
  
    <div class="form-group">
    <label for="authorname" class="form-label">Author Name</label>
    <input name="author" type="text" class="form-control" id="addbooks" placeholder="Enter Author Name" aria-describedby="authorhelp">
  </div>
    <div class="form-group">
    <label for="pricebbooks" class="form-label">Price</label>
    <input name="price" type="tel" class="form-control" id="addbooks" placeholder="In ₹" required="required" aria-describedby="pricehelp">
  </div>
  
    <div class="form-group">
    <label for="inputState" class="form-label">Book Categories</label>
    <select name="category" class="form-control" id="inputState"> 
    <option value="Old">Old Book</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="inputState" class="form-label">Book Status</label>
    <select name="status" class="form-control" id="inputState"> 
    <option selected>--select--</option>
    <option value="Active">Active</option>
    <option value="InActive">InActive</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="bookimg" class="form-label">Upload Photo</label>
    <input name="bimg" type="file" class="form-control-file" id="booksimg" required="required" aria-describedby="addbookshelp">
  </div>
  
	<div class="text-center">  
    <button type="submit" class="btn" style="background-color: #009688; color: white;">Post</button>
    </div>
</form>


</div>
</div>
</div>
</div>
</div>


<%@include file="all_component/footer.jsp"%>

</body>
</html>