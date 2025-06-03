<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Address</title>
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
<div class="container p-4">
<div class="row">
<div class="col-md-8 offset-md-2">
<div class="card">
<div class="card-body">

<h3 class="add text-center">Add Address</h3>

<form action="">

  <div class="form-row p-3">
    <div class="col-md-6">
      <label for="validationCustom01">Address<sup class="sup">*</sup></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Enter Your Address" required>
    </div>
    <div class="col-md-6">
      <label for="validationCustom02">Landmark</label>
      <input type="text" class="form-control" id="validationCustom02" placeholder="Enter Landmark">
    </div>
  </div>
  
  <div class="form-row p-2">
    <div class="col-md-6 mb-3">
      <label for="validationCustom03">City<sup class="sup">*</sup></label>
      <input type="text" class="form-control" id="validationCustom03" placeholder="City" required>
    </div>
    
    <div class="col-md-3 mb-3">
      <label for="validationCustom04">State<sup class="sup">*</sup></label>
      <input type="text" class="form-control" id="validationCustom04" placeholder="State" required>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom05">Pincode<sup class="sup">*</sup></label>
      <input type="text" class="form-control" id="validationCustom05" placeholder="Pincode" required>
    </div>
  </div>
  
    	<p class="sup"><sup>*</sup>indicates required fields.</p>
  
  <div class="text-center">
  <button class="btn" type="submit" style="background-color: #009688; color: white;">Add Address</button>
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