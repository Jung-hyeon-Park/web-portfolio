<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/jquery.flexisel.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/style.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<style>
.product-text {
	height: 96px;
}
</style>
</head>
<body style="width:880px; margin: 0 auto;">
	<c:import url="/header.do"></c:import>
	<c:import url="/nav.do"></c:import>
	<div style="float: center; margin-top: 30px;">
		<c:forEach var="consoleVO" items="${consoleVOs}">
		<c:if test="${consoleVO.category2Idx eq 0 }">
			<div style= "display: inline-block; margin-left: 63px;">
				<a href="/game/gameAll.do?console=${consoleVO.categoryIdx}&console2=${consoleVO.category2Idx}">
				<img style="width:200px; height: 100px;" src="/resources/uploadFile/image/${consoleVO.image}"></a>
			</div>
		</c:if>
		<c:if test="${consoleVO.category2Idx ne 0 }">
			<div style= "display: inline-block; margin-left: 63px;">
				<a href="/game/gameList.do?console=${consoleVO.categoryIdx}&console2=${consoleVO.category2Idx}">
				<img style="width:200px; height: 100px;" src="/resources/uploadFile/image/${consoleVO.image}"></a>
			</div>
		</c:if>
		&nbsp;&nbsp;
		</c:forEach>
	</div>
	<div class="row">
		<ul id="flexiselDemo4" style= "width: 880px;">
			<c:forEach var="gameVO" items="${gameVOs}">
					<div class="col-md-3">
						<p class="card-text" id="email">${gameVO.email}</p>
						<a href="/game/readGame.do?console=${console}&console2=${console2}&boardIdx=${gameVO.boardIdx}" style="text-decoration: none">
						<div class="card mb-3 shadow-sm" style="width: 194.5px;">
							<img class="card-img-top" src="/upload/displayFile.do?fileName=${gameVO.fullName}" alt="image">
							<div class="card-body">
								<div class="product-text">
									<p class="card-text" style="line-height: 100%;">${gameVO.title}</p>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted">${gameVO.likeCount} mins</small>
									<p class="card-text">${gameVO.price}원</p>
								</div>
							</div>
						</div>
						</a>
					</div>
			</c:forEach>
		</ul>
	</div>
	
</body>
<c:import url="/footer.do"></c:import>
</html>