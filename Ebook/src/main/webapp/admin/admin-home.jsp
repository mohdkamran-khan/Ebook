<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Home</title>

<%@include file="allCss.jsp" %>
<style type="text/css">
.navbar{
	background-color: #009688;
	color: white;
}
.hello{
color: #009688;
padding:10px;
}
a{
color: black; 
text-decoration:none;
}
a:hover{
font-size:115%;
color: black; 
text-decoration:none;
}
.ad:hover{
font-size:115%;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

<h2 class="hello text-center">eBook Management System</h2>

<div class="container">
<div class="row" style="justify-content: space-between;">
<div class="col-md-6 p-3">
<a href="add_books.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-square-plus fa-3x" style="color: #009688;"></i>
<h4>Add Books</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6 p-3">
<a href="all_books.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-swatchbook fa-3x" style="color: #009688;"></i>
<h4>All Books</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-2 mb-2">
<a href="all_users.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-users fa-3x" style="color: #009688;"></i>
<h4>All Users</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-2 mb-2">
<a href="orders.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-truck-fast fa-3x" style="color:#009688;"></i>
<h4>All Orders</h4>
</div>
</div>
</a>
</div>

</div>
</div>

 <%@include file="footer.jsp"%>

</body>
</html>