<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%--<meta http-equiv="refresh" content="3">--%>
<title>eBooks : Home</title>

<%@include file="all_component/allCss.jsp"%> <%--link css--%>

<style type= "text/css"> 
.bg-img{
background: url("img/bookbg.png");
height: 60vh;
width: 100%;
background-repeat: no-repeat;
background-size: cover;
}
.crd:hover{
background-color: #a8e6c4;
}
.txt{
color:#009688;
}
.view{
margin-left:537px;
margin-top:10px;
background-color: #009688;
border-radius: 4px;
}
#toast {
min-width: 300px;
position: fixed;
bottom: 30px;
left: 50%;
margin-left: -125px;
background: #333;
padding: 10px;
color: white;
text-align: center;
z-index: 1;
font-size: 18px;
visibility: hidden;
box-shadow: 0px 0px 100px #000;
}

#toast.display {
visibility: visible;
animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from {bottom:0;
opacity: 0;
}

to{
bottom: 30px;
opacity: 1;
}
}
@keyframes fadeOut {form { bottom:30px;
opacity: 1;
}

to {
bottom: 0;
opacity: 0;
}
}
</style>
</head>

<body>

<c:if test="${not empty addCart}">

<div id="toast"> ${addCart} </div>
<script type="text/javascript">
     showToast();
     function showToast(content)
     {
        $('#toast').addClass("display");	
		$('#toast').html(content);
		setTimeout(()=>{
		    $("#toast").removeClass("display");
		},2000)
	 }
</script>

<c:remove var="addCart" scope="session"/>
</c:if>

<%User u=(User)session.getAttribute("userobj");%>
<div class="container-fluid text-center" style="background-color: #009688; color: white;">
<i class="fa-solid fa-user-tag"></i> <span>Flat 10% Off On First Order | No Coupon Needed </span>
</div>
<%@include file="all_component/navbar.jsp" %>
<div class= "contgainer-fluid bg-img">
<h1 class="management">E-Books Store</h1>
</div>

<!-- Start Recent Books -->
<div class="container">
<h3 class="text-center mt-3 txt">Recent Books</h3>
<div class="row">
<%
BookDAOImpl dao2= new BookDAOImpl(DBConnect.getConn());
List<BookDetails> list2= dao2.getRecentBoooks();
for(BookDetails b: list2){%>
<div class="col-md-3">
<div class="card crd">
<div class="card-body text-center">
<p><a href="view_books.jsp?bid=<%=b.getBookId()%>"><img alt="1984" src="books/<%=b.getPhotoName() %>" style="width:150px; height: 200px" class="img-thumblin"></a></p>
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>Category: <%=b.getBookCategory() %></p>
<div class="btn">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm text-white">View Details</a>
<a class="btn btn-danger btn-sm ml-1 text-white">₹<%=b.getPrice()%></a>
<% if(u==null){%>
	<a href="login.jsp" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}else{%>
	<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}%></div>
</div>
</div>
</div>
<%}
%>
<div class="view">
<a href="all_recent_books.jsp" class="btn btn-sm text-white">View All</a>
</div>
</div>
</div>
<hr>
<!-- End Recent Books -->

<!-- Start New Books -->
<div class="container">
<h3 class="text-center mt-2 txt">New Books</h3>
<div class="row">
<% 
BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
List<BookDetails> list=dao.getNewBook();
for(BookDetails b:list){%>
<div class="col-md-3">
<div class="card crd">
<img alt="rel" src="books/new_edition.png" style="width:110px; height:110px; padding:0px; z-index:1; position: absolute;">
<div class="card-body text-center">
<p><a href="view_books.jsp?bid=<%=b.getBookId()%>"><img alt="1984" src="books/<%=b.getPhotoName()%>" style="width:150px; height: 200px" class="img-thumblin"></a></p>
<p><%=b.getBookName()%></p>
<p><%=b.getAuthor()%></p>
<p>Category: <%=b.getBookCategory() %></p>
<div class="btn">

<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm text-white">View Details</a>
<a class="btn btn-danger btn-sm ml-1 text-white">₹<%=b.getPrice()%></a>
<% if(u==null){%>
	<a href="login.jsp" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}else{%>
	<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}%>
</div>
</div>
</div>
</div>
<%}
%>
<div class="view" style="height: 32px;">
<a href="all_new_books.jsp" class="btn btn-sm text-white">View All</a>
</div>
</div>
</div>
<hr>
<!-- End New Books -->

<!-- Start Old Books -->
<div class="container">
<h3 class="text-center mt-2 txt">Old Books</h3>
<div class="row">
<%
BookDAOImpl dao3= new BookDAOImpl(DBConnect.getConn());
List<BookDetails> list3= dao3.getOldBooks();
for(BookDetails b: list3){%>
<div class="col-md-3">
<div class="card crd">
<div class="card-body text-center">
<p><a href="view_books.jsp?bid=<%=b.getBookId()%>"><img alt=" " src="books/<%=b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin"></a></p>
<p><%=b.getBookName() %></p>
<p><%=b.getAuthor() %></p>
<p>Category: <%=b.getBookCategory() %></p>
<div class="btn">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm text-white">View Details</a>
<a class="btn btn-danger btn-sm ml-1 text-white">₹<%=b.getPrice()%></a>
<% if(u==null){%>
	<a href="login.jsp" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}else{%>
	<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-success btn-sm ml-2 text-white"><i class="fa-solid fa-cart-plus"></i></a>
<%}%>

</div>
</div>
</div>
</div>
<%}
%>
<div class="view">
<a href="all_old_books.jsp" class="btn btn-sm text-white">View All</a>
</div>
</div>
</div>
<!-- End Old Books -->

<%@include file="all_component/footer.jsp" %>

</body>
</html>