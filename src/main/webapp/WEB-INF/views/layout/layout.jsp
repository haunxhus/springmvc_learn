<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglib.jsp"%>
<%@page session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title><tiles:insertAttribute name="title" ignore="true" /></title>  
<link href="<c:url value="/resources/assets/css/bootstrap-united.css"/>" rel="stylesheet" />
</head>  
<body>  
		<script src="<c:url value="/resources/jquery/jquery-1.8.3.js"/>"></script>
		<script src="<c:url value="/resources/bootstrap/js/bootstrap.js"/>"></script>
        <div><tiles:insertAttribute name="header" /></div>  
        <div style="float:left;padding:10px;width:15%;"><tiles:insertAttribute name="menu" /></div>  
        <div style="float:left;padding:10px;width:80%;border-left:1px solid pink;">  
        <tiles:insertAttribute name="body" /></div>  
        <div style="clear:both"><tiles:insertAttribute name="footer" /></div>  
</body>  
</html>  