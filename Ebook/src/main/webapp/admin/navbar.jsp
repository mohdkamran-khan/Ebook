<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<style>
.hv:hover{
font-size:110%;
}
</style>

<div class="container-fluid" style="height: 7px;background-color: #009688"></div>
<div class="container-fluid p-3">
<div class="row">
<div class="ebookcolor col-md-3 mx-4">
<a style="text-decoration: none; color:#009688;" href="../index.jsp"><h3><i class="hv fa-solid fa-book-open-reader"></i> eBooks</h3></a>
</div>
<div class="col-md-6 mx-5">
<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn submit my-2 my-sm-0 text-white"style="background-color: #009688;" type="submit"><i class="hv fa-solid fa-magnifying-glass"></i></button>
    </form>
</div>
<div class="col-md-1 ml-5 d-flex justify-content-end">
<c:if test="${not empty userobj}">
  <a href="#" class="btn mx-1" style="height: 40px; background-color: #009688; color: white;"><i class="fas fa-user"></i> Hello, ${userobj.fullName}</a>
 <a data-toggle="modal" data-target="#exampleModal" class="btn btn-danger ml-1" style="height: 40px; color: white;"><i class="fas fa-sign-in-alt"></i> Logout</a>
 </c:if>
</div>
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
        <a href="../logout" type="button" class="btn btn-danger">Yes, Logout</a>
      </div>
    </div>
  </div>
</div>
<!-- end logout modal -->

<nav class="navbar navbar-dark bg-custom">
  <a class="navbar-brand" href="admin-home.jsp"><i class="hv fa-solid fa-house-chimney"></i> Home</a>
</nav>