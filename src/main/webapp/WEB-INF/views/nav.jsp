<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/bootstrap.css">
</head>
<body>
	<div class="nav-scroller py-1 mb-2" style="background:black;">
		<nav class="nav d-flex justify-content-between">
		<c:forEach var="postCategoryVO" items="${postCategoryVOs}">
			<a class="p-2 text-muted" href="/board/listAll.do?post=${postCategoryVO.idx}">${postCategoryVO.name}</a>
		</c:forEach>
		</nav>
	</div>