<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Success</title>
<link href="<c:url value="/resources/assets/css/bootstrap-united.css"/>" rel="stylesheet" />

</head>
<body>
	<script src="<c:url value="/resources/jquery/jquery-1.8.3.js"/>">
		
	</script>

	<script src="<c:url value="/resources/bootstrap/js/bootstrap.js"/>">
		
	</script>

	<div class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>

		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search">
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/StudentEnrollmentWithMyBatis">Home</a></li>
				<li><a href="signup.html">Signup</a></li>
				<li class="active"><a href="login.html">Login</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Explore<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Contact us</a></li>
						<li class="divider"></li>
						<li><a href="#">Further Actions</a></li>
					</ul></li>
				<li>
					<c:url value="/j_spring_security_logout" var="logoutUrl" />
					<!-- csrt for log out-->
					<form action="${logoutUrl}" method="post" id="logoutForm">
					  <input type="hidden" 
						name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</form>
					<script>
						function formSubmit() {
							document.getElementById("logoutForm").submit();
						}
					</script>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
							<a href="javascript:formSubmit()">Logout</a>
					</c:if>
				</li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<!-- 
	<legend>Student Enrollment Login Success</legend>
	 -->
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Student Enrollment Login success</h3>
		</div>
		<div class="panel-body">
			<div class="alert alert-dismissable alert-success">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<strong>Well done!</strong> You successfully logged-into the system.
				Now you can explore the complete features!
			</div>
		</div>
	</div>
	<div>
		<a href="<c:url value="/admin"/>">Admin Page</a>
		<br/>
		<br/>
		<br/>
		<a href="<c:url value="/common"/>">Regular User Page</a>
	</div>
	<div></div>
	<a class="btn btn-primary" href="<spring:url value="login.html"/>">Login
		as different user?</a>
</body>
</html>