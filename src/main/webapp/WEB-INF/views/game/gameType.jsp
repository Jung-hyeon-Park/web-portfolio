<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" method="GET">
	<div style="position: fixed; right: 50%; margin-right:470px;">
		<c:forEach var="gameType" items="${gameTypes}">
			<div>
				<a href="/game/gameList.do?category1=${gameType.idx}&category2=0">
				<img src="/resources/uploadFile/image/${gameType.image}" style="width: 150px; height: 60px;"></a>
			</div>
		</c:forEach>
	</div>
</form>
</body>
</html>