<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBook : Contact Us</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.navbar{
	background-color: #009688;
	color:white;
}
.inc{
position:fixed;
bottom:0px;
width:100%;
}
.mail{
color:#009688;
}
a:hover{
text-decoration: none;
color: white;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-custom">

  <div class="container-fluid">
    <a href="index.jsp" class="navbar-brand mb-0 h1"><i class="fa-solid fa-book-open-reader"></i> EBooks : Contact Us</a>
  </div>
</nav>

<div class="text-dark text-center mt-5">
<h4>Send All Your Queries To : <span class="mail"><i class="fa-solid fa-envelope"></i> <u>admin@gmail.com</u></span></h4>
</div>

<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card mt-4 mb-4">
<div class="card-body">

<div class="input-group">
  <textarea class="form-control" aria-label="With textarea" placeholder="Enter your query"></textarea>
</div>
  <div class="text-center mt-2">
     <a data-toggle="modal" data-target="#exampleModal" class="btn" style="background-color: #009688; color: white;">Send Message</a>
  </div>
  <!-- contact modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h4 style="color: #009688;">Your Message Has Been Sent!</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- contact modal -->
</div>
</div>
</div>
</div>
</div>

<div class="text-dark text-center mt-3">
<h4>Helpline No : <span class="mail"><i class="fa-solid fa-headset"></i> <u>1800-202-9797</u></span></h4>
</div>

<div class="inc">
<%@include file="all_component/footer.jsp"%>
</div>

</body>
</html>