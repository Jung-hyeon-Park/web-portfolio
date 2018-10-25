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
<body style="width: 1000px;">
	<div class="nav-scroller py-1 mb-2" style="background:black;">
		<nav class="nav d-flex justify-content-around">
		<c:forEach var="postCategoryVO" items="${postCategoryVOs}">
			<c:if test="${postCategoryVO.idx != 5}">
				<a class="p-2 text-muted" style= "justify-content: center; align-items: center;" href="/board/listAll.do?post=${postCategoryVO.idx}">${postCategoryVO.name}</a>
			</c:if>
			<c:if test="${postCategoryVO.idx == 5}">
			<a class="p-2 text-muted" style= "justify-content: center; align-items: center;" href="/game/gameAll.do?console=0&console2=0">${postCategoryVO.name}</a>
			</c:if>
		</c:forEach>
		<a class="p-2 text-muted" style= "justify-content: center; align-items: center; background-color: blue;" href="/board/insertBoard.do?post=5">중고상품 팔기</a>
		</nav>
	</div>
</body>
</html>