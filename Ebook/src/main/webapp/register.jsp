<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
 
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>eBook : Register</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.navbar {
	background-color: #009688;
	color: white;
}
.sup {
	color: red;
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
	<%-- <%@include file="all_component/navbar.jsp" %>--%>

	<!-- As a heading -->
	<nav class="navbar navbar-expand-lg bg-custom">
		<div class="container-fluid">
			<a href="index.jsp" class="navbar-brand mb-0 h1 rd">
					<i class="hv fa-solid fa-book-open-reader"></i> EBooks : Registration
				</a>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<a href="contact.jsp" class="hv btn btn-light " style="height: 40px;"><i
				class="fa-solid fa-at"></i> Contact Us</a>
		</form>
	</nav>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-0">
				<div class="card mt-4 mb-4">
					<div class="card-body">

<h4 class="rp text-center">Registration Page</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>

						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg}</p>
							<c:remove var="failMsg" scope="session"/>
						</c:if>

<form action="register" method="post"> 
							<div class="mb-3">
								<label for="InputName" class="form-label">Name<sup
									class="sup">*</sup></label> <input type="text" class="form-control"
									id="InputName" aria-describedby="nameHelp"
									placeholder="Enter Full Name" required="required" name="fname">
							</div>
							<div class="mb-3">
								<label for="InputName" class="form-label">Phone Number<sup class="sup">*</sup></label> <input
									type="tel" class="form-control" id="phone"
									aria-describedby="numberHelp" placeholder="10 digits"
									name="phno" pattern="\d{10}" required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									Address<sup class="sup">*</sup>
								</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password<sup
									class="sup">*</sup></label> <input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password"
									required="required" name="password">
								<div id="passwordHelpBlock" class="text-muted">Password must be
									8-20 characters long, alphanumeric, and must not
									contain any spaces, special characters, or emoji.</div>
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions<sup
									class="sup">*</sup></label>
							</div>
							<p class="sup">
								<sup>*</sup>indicates required fields.
							</p>
							<div class="text-center">
								<button type="submit" class="hv btn btn-primary"
									style="background-color: #009688;">Register</button>
							</div>
</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="text-center mt-0">
		<a class="link p-2" href="login.jsp">Already Have an Account? Login Instead</a>
	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>