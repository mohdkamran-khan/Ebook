<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Settings</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<style>
.hello{
color: #009688;
}
a{
text-decoration: none;
color: black;
}
a:hover{
font-size:110%;
text-decoration:none;
color: black;
}
.txt{
color: #009688;
}
.logo{
color: #009688;
}
</style>
<body>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_component/navbar.jsp" %>

<p></p>
 <u class="hello"><h3 class="hello text-center">Hello, ${userobj.getFullName()}</h3></u>
 
<div class="container">
<div class="row p-3">
<div class="col-md-6">
<a href="sell_books.jsp" >
<div class="card">
<div class="card-body text-center p-2">
<i class="logo fa-solid fa-book-open fa-3x p-2"></i>
<h3 class="txt">Sell Old Books</h3>
</div>
</div>
</a> 
</div>

<div class="col-md-6">
<a href="edit_profile.jsp" >
<div class="card">
<div class="card-body text-center p-2">
<i class="logo fa-solid fa-address-card fa-3x p-2"></i>
<h3 class="txt"> Edit Profile </h3>
</div>
</div>
</a> 
</div>

<div class="col-md-6 p-3">
<a href="old_book.jsp" >
<div class="card">
<div class="card-body text-center p-2">
<i class="logo fa-solid fa-swatchbook fa-3x p-2"></i>
<h3 class="txt"> Manage Books</h3>
</div>
</div>
</a> 
</div>

<div class="col-md-6 p-3">
<a href="order.jsp" >
<div class="card">
<div class="logo card-body text-center p-2 fa-3x p-2">
<i class="fa-solid fa-gifts"></i><h3 class="txt">My Orders</h3>
</div>
</div>
</a> 
</div>

</div>
</div>
 
 <%@include file="all_component/footer.jsp"%>
 
</body>
</html>