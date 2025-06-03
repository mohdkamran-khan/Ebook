<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<style>
a:hover{
font-size:110%;
}
.hv:hover{
font-size:110%;
}
</style>

<div class="container-fluid" style="height: 7px;background-color: #009688"></div>
<div class="container-fluid p-3">
<div class="row d-flex">
<div class="ebookcolor col-md-3 mx-3">
<a style="text-decoration: none; color:#009688;" href="index.jsp"><h3 class="ml-2"><i class="hv fa-solid fa-book-open-reader"></i> eBooks</h3></a>
</div>
<div class="col-md-3 mx-2">
<form class="form-inline my-2 ml-3 my-lg-1" action="search.jsp" method="post">
      <input class="form-control mr-sm-2" type="search" name="ch" placeholder="Search" aria-label="Search">
      <button class="hv btn submit my-2 my-sm-0 text-white"style="background-color: #009688;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
    </form>
</div>

<div class="col-md-5 ml-5 d-flex justify-content-end">
<c:if test="${not empty userobj}">
   <div class="dropdown my-1">
  <a class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 40px; background-color: #009688; color: white;"><i class="fas fa-user"></i> Hello, ${userobj.fullName}</a>
  <div class="dropdown-menu p-2 text-center" aria-labelledby="dropdownMenuButton">
    <a href="setting.jsp" class="btn btn-secondary my-2 my-sm-0" type="submit" style="height:40px;"><i class="fa-solid fa-user-gear"></i> Settings</a>
     <div class="dropdown-divider"></div>
    <a data-toggle="modal" data-target="#exampleModal" class="btn btn-danger" style="height: 40px; width:107px; color: white;"><i class="fas fa-sign-in-alt"></i> Logout</a>

  </div>
</div>    
    <!-- logout modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h4 style="color: #009688;">Do You Really Want To Logout?</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout" type="button" class="btn btn-danger">Yes, Logout</a>
      </div>
    </div>
  </div>
</div>
<!-- end logout modal -->

  
    <span style="padding:0px; font-size:25px;" class="my-0 ml-3">|</span>
  
  <div class="d-flex">
    <!-- > <span style="padding:8px; font-size:30px;">|</span> -->
   <a href="cart.jsp"><i style="color: #009688; padding:4px;" class="fa-solid fa-cart-shopping fa-xl my-3 ml-2"></i></a>
 </div>
 </c:if>
 
 <c:if test="${empty userobj}">
<div class=" d-flex justify-content-end">
<a href="login.jsp"  class="btn btn-success mx-2" style="height:40px;"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
<a href="register.jsp" class="btn btn-primary" style="height:40px;"><i class="fa-solid fa-user-plus"></i> Register</a>
</div>
</c:if>
</div>
</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
 <!-- <a class="navbar-brand" href="#"></a> --> 
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link ml-0" href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="all_recent_books.jsp"><i class="fa-solid fa-book"></i> Recent Books</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="all_new_books.jsp"><i class="fa-solid fa-book"></i> New Books</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link disabled" href="all_old_books.jsp"><i class="fa-solid fa-book"></i> Old Books</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="contact.jsp" class="btn btn-light " style="height:40px;"><i class="fa-solid fa-at"></i> Contact Us</a>
      
    </form>
  </div>
</nav>