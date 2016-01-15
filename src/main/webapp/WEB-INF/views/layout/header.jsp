<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li><c:url value="/j_spring_security_logout" var="logoutUrl" />
				<!-- csrt for log out-->
				<form action="${logoutUrl}" method="post" id="logoutForm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form> <script>
					function formSubmit() {
						document.getElementById("logoutForm").submit();
					}
				</script> <c:if test="${pageContext.request.userPrincipal.name != null}">
					<a href="javascript:formSubmit()">Logout</a>
				</c:if></li>
		</ul>
	</div>
	<!-- /.nav-collapse -->
</div>