<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
		<link href="<c:url value='/resources/static/css/bootstrap.css' />"  rel="stylesheet"></link>
		<link href="<c:url value='/resources/static/css/app.css' />" rel="stylesheet"></link>
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
		<%-- <link href="<c:url value="/resources/assets/css/bootstrap-united.css"/>" rel="stylesheet" /> --%>
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
	</head>

	<body>
		<script src="<c:url value="/resources/jquery/jquery-1.8.3.js"/>"></script>
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js"/>"></script>
		<div id="mainWrapper">
			<div class="login-container">
				<div class="login-card">
					<div class="login-form">
						<form action="<c:url value='/j_spring_security_check' />" method="POST" class="form-horizontal">
							<c:if test="${not empty error}">
								<div class="error">${error}</div>
							</c:if>
							<c:if test="${not empty msg}">
								<div class="msg">${msg}</div>
							</c:if>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
								<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
							</div>
							<div class="input-group input-sm">
								<label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
								<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
							</div>
							<c:if test="${empty loginUpdate}">
	                            <div class="input-group input-sm">
	                              <div class="checkbox">
	                                <label><input type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
	                              </div>
								</div>
							</c:if>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
								
							<div class="form-actions">
								<input type="submit"
									class="btn btn-block btn-primary btn-default" value="Log in">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>