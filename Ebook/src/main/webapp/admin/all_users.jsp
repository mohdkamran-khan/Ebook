<%@page import="com.entity.User"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Users</title>
<%@include file="allCss.jsp" %>

<c:if test="${empty userobj}">
<c:redirect url="../login.jsp"/>
</c:if>

<style type="text/css">
.navbar{
	background-color: #009688;
	color: white;
}
.bg{
background-color: black;
color: white;
}
.all{
color: #009688;
padding:10px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<h3 class="all text-center">All Users List</h3>

<c:if test="${not empty succMsg}">
<h5 class="text-center text-success">${succMsg}</h5>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failMsg}">
<h5 class="text-center text-danger">${failMsg}</h5>
<c:remove var="failMsg" scope="session"/>
</c:if>

<table class="table table-striped">
  <thead class="bg">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">User Name</th>
      <th scope="col">Phone No</th>
      <th scope="col">Email</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  UserDAOImpl dao= new UserDAOImpl(DBConnect.getConn());
   List<User> list= dao.getAllUsers();
   for(User b:list){
	%>   
   <tr>
      <td><%=b.getId() %></td>
      <td><%=b.getFullName()%></td>
      <td><%=b.getPhoneNo() %></td>
      <td><%=b.getEmail() %></td>
      
      <td> 
      <a href="../allusers?id=<%=b.getId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
      </td>
    </tr>
   <%}
  %>
  
  </tbody>
</table>

 <%@include file="footer.jsp"%>

</body>
</html>