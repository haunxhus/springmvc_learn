<%@ include file="/WEB-INF/views/includes/taglib.jsp"%>
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
			<li><a href="/StudentEnrollmentWithMyBatis"><spring:message code="header.home"/></a></li>
			<li><a href="signup.html"><spring:message code="header.signup"/></a></li>
			<li class="active"><a href="login.html"><spring:message code="header.login"/></a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><spring:message code="header.explore"/><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><spring:message code="header.contactus"/></a></li>
					<li class="divider"></li>
					<li><a href="#"><spring:message code="header.furtheractions"/></a></li>
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
					<a href="javascript:formSubmit()"><spring:message code="header.logout"/></a>
				</c:if></li>
		</ul>
	</div>
</div>