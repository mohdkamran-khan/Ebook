<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Order Placed Successfully</title>
<%@include file="all_component/allCss.jsp" %>
<style>
.clr{
background-color:#009688;
color:white;
}
a:hover{
font-size: 110%;
text-decoration: none;
color: white;
}
.hd{
color: #009688;
}
.inc{
position: fixed;
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

<div class="container text-center mt-3">
<i class="hd fa-regular fa-circle-check fa-4x"></i>
<h2 class="hd mt-2">Your Order Has Been Placed Successfully</h2>

<h3 class="mt-4">Thank You For Choosing Us!</h3>
<p></p>
<h5>Order Will Be Delivered Within <u>7</u> Working Days.</h5>

<a href="index.jsp" class="clr btn mt-3 mr-2">Home</a>
<a href="order.jsp" class="clr btn mt-3">View Orders</a>
</div>

<div class="inc">
<%@include file="all_component/footer.jsp"%>
</div>
</body>
</html>