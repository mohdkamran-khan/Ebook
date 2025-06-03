<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBook : Login</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.navbar{
	background-color: #009688;
	color: white;
}
.inc{
position:fixed;
bottom:0px;
width:100%;
}
.rd:hover{
text-decoration: none;
color: white;
}
.hv:hover{
font-size:110%;
}
.rp{
color:#009688;
}
</style>
</head>
<body>

<!-- As a heading -->
<nav class="navbar navbar-expand-lg bg-custom">
  <div class="container-fluid">
    <a href="index.jsp" class="navbar-brand mb-0 h1 rd"><i class="hv fa-solid fa-book-open-reader"></i> EBooks : Login</a>
  </div>
  <form class="form-inline my-2 my-lg-0">
      <!--<button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-user-gear"></i> Setting</button>-->
      <a href="contact.jsp" class="hv btn btn-light " style="height:40px;"><i class="fa-solid fa-at"></i> Contact Us</a>
    </form>
</nav>

<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class=" card mt-4 mb-4">
<div class="card-body">

<h4 class="rp text-center">Login Page</h4>

 <c:if test="${not empty failMsg}">
 <h5 class="text-center text-danger">${failMsg}</h5>
 <c:remove var="failMsg" scope="session"/>
 </c:if>
 
  <c:if test="${not empty succMsg}">
 <h5 class="text-center text-success">${succMsg}</h5>
 <c:remove var="succMsg" scope="session"/>
 </c:if>

<form action="login" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Full Name" required="required" name="email">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" required="required" name="password">
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Remember Me</label>
  </div>
  <div class="text-center ">
    <button type="submit" class="hv btn btn-primary" style="background-color: #009688;">Login</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>

<div class="text-center">
<a class="link p-2" href="register.jsp"> Dont't Have an Account? Create A New Account</a>
</div>

<div class="inc">
<%@include file="all_component/footer.jsp"%>
</div>

</body>
</html>