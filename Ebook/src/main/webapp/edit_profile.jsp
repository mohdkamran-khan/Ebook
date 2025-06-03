<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Edit Profile</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.add{
color:#009688;
}
.sup {
	color: red;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect> 
</c:if>

<div class="container p-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h3 class="add text-center">Edit Profile</h3>

<c:if test="${not empty failMsg}">
 <h5 class="text-center text-danger">${failMsg}</h5>
 <c:remove var="failMsg" scope="session"/>
 </c:if>
 
  <c:if test="${not empty succMsg}">
 <h5 class="text-center text-success">${succMsg}</h5>
 <c:remove var="succMsg" scope="session"/>
 </c:if>

<form action="edit_profile" method="post" >

  <div class="form-group">
    <label for="addbooks" class="form-label">Edit Name<sup class="sup">*</sup></label>
    <input name="fname" type="text" class="form-control" id="addbooks" value="${userobj.fullName}" placeholder="Enter Full Name" required="required" aria-describedby="addbookshelp">
  </div>
    
    <div class="form-group">
    <label for="authorname" class="form-label">Edit Email<sup class="sup">*</sup></label>
    <input name="email" type="text" class="form-control" id="email" value="${userobj.email}" placeholder="Enter New Email" aria-describedby="authorhelp">
  </div>
  
    <div class="form-group">
    <label for="pricebbooks" class="form-label">Phone No</label>
    <input name="phno" type="tel" class="form-control" id="phone" value="${userobj.phoneNo}" placeholder="Enter Phone no" aria-describedby="pricehelp">
  </div>
  
 <div class="form-group">
    <label for="pricebbooks" class="form-label">Password<sup class="sup">*</sup></label>
    <input name="password" type="tel" class="form-control" id="password" placeholder="Enter Password" required="required" aria-describedby="pricehelp">
  </div>
  
  	<p class="sup"><sup>*</sup>indicates required fields.</p>
  
	<div class="text-center">  
    <button type="submit" class="btn" style="background-color: #009688; color: white;">Update</button>
    </div>
     <input type="hidden" value='${userobj.id}' name="id">
</form>

</div>
</div>
</div>
</div>
</div>

<%@include file="all_component/footer.jsp"%>
</body>
</html>