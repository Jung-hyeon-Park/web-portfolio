<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="/resources/bootstrap/js/jquery.flexisel.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/style.css">

<style>
.product-text {
	height: 96px;
}
</style>
</head>
<body style="width:880px; margin: 0 auto;">
	<c:import url="/header.do"></c:import>
	<c:import url="/nav.do"></c:import>
	<div class="row">
	<c:forEach var="consoleVO" items="${consoleVOs}">
		<div>
		<a href="/game/gameList.do?console=${consoleVO.idx}"><img style="width:200px; height: 100px;" src="/resources/uploadFile/image/${consoleVO.image}"></a>
		</div>
		&nbsp;&nbsp;
	</c:forEach>
		<ul id="flexiselDemo4">
			<c:forEach var="gameVO" items="${gameVOs}">
				<li>
					<div class="col-md-3">
						<%-- <p class="card-text">${gameVO.title}</p> --%>
						<div class="card mb-3 shadow-sm">
							<%-- <img class="card-img-top" src="/resources/uploadFile/image/${gameVO.image}" alt="${gameVO.image}"> --%>
							<div class="card-body">
								<div class="product-text">
									<p class="card-text" style="line-height: 100%;">${gameVO.title}</p>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<%-- <small class="text-muted">${gameVO.viewCount} mins</small> --%>
									<p class="card-text">${gameVO.price}원</p>
								</div>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<p>할인 상품</p>
	
	<div class="row">
		<ul id="flexiselDemo5">
			<c:forEach var="gameVO" items="${gameVOs}">
				<li>
					<div class="col-md-3">
						<p class="card-text">${gameVO.name}</p>
						<div class="card mb-3" style="width: 194.5px;">
							<img class="card-img-top" alt="${gameVO.image}">
							<div class="card-body">
								<div class="product-text">
									<p class="card-text" style="line-height: 100%;">${gameVO.title}</p>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted">${gameVO.viewCount} mins</small>
									<p class="card-text">${gameVO.price}원</p>
								</div>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

	<script type="text/javascript">
		$(window).load(function() {

			$("#flexiselDemo4").flexisel({
				infinite : false
			});
			
			$("#flexiselDemo5").flexisel({
				infinite : false
			});

		});
	</script>
</body>
</html>