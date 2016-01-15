<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@	taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<div class="panel panel-success">
	<div class="panel-heading">
		<h3 class="panel-title">Home Page</h3>
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
	<sec:authorize access="isRememberMe()">
	<h2># This user is login by "Remember Me Cookies".</h2>
	</sec:authorize>
	<sec:authorize access="isFullyAuthenticated()">
		<h2># This user is login by username / password.</h2>
	</sec:authorize>
</div>
<div>
	<a href="<c:url value="/admin"/>">Admin Page</a>
	<br/>
	<br/>
	<br/>
	<a href="<c:url value="/common"/>">Regular User Page</a>
</div>
<a class="btn btn-primary" href="<spring:url value="login.html"/>">Login
	as different user?</a>
