<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/assets/css/bootstrap-united.css"/>" rel="stylesheet" />

<style>
.error {
	color: #ff0000;
	font-size: 0.9em;
	font-weight: bold;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<title>Student Enrollment Login</title>
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
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>

	<div class="container">
		<div class="jumbotron">
			<div>
				<h1>Welcome to Online Student Enrollment Login</h1>
				<p>Login to explore the complete features!</p>
			</div>
		</div>

		<div></div>
	</div>

	<div class="col-lg-6 col-lg-offset-3">
		<div class="well">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<c:if test="${not empty error}">
							<div class="error">${error}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="msg">${msg}</div>
						</c:if>
						<form id="myForm" action="<c:url value='/j_spring_security_check' />"  method="POST"
							class="bs-example form-horizontal" >
							<fieldset>
								<legend>Student Enrollment Login Form</legend>

								<div class="form-group">
									<label for="username" class="col-lg-3 control-label">User
										Name</label>
									<div class="col-lg-9">
										<input type="text" class="form-control"
											id="username" name="username" placeholder="User Name" />
										<%-- <form:errors path="j_username" cssClass="error" /> --%>
									</div>
								</div>

								<div class="form-group">
									<label for="password" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-9">
										<input type="password" class="form-control"
											name="password" id="password" />
										<%-- <form:errors path="j_password" cssClass="error" /> --%>
									</div>
								</div>

								<div class="col-lg-9 col-lg-offset-3">
									<button class="btn btn-default">Cancel</button>

									<button class="btn btn-primary">Login</button>
								</div>
							</fieldset>
							<!-- enable csrf protection -->
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>