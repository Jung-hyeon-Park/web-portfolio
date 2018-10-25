<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/bootstrap/js/upload.js"></script>

<style>
.product-text {
	height: 96px;
}

.dlk-radio input[type="radio"] {
	margin-left: -99999px;
	display: none;
}

.dlk-radio input[type="radio"]+.fa {
	opacity: 0.15
}

.dlk-radio input[type="radio"]:checked+.fa {
	opacity: 1
}
</style>
</head>
<body style="width: 880px; margin: 0 auto;">

	<c:import url="/header.do"></c:import>
	<c:import url="/nav.do"></c:import>

	<div class="container">
		<div class="well well-sm text-center" style="margin: 0 auto; margin-top: 30px;">
			<div class="dlk-radio btn-group">
				<c:forEach var="console2VO" items="${console2VOs}">
					<label class="btn btn-info"> <input name="choices[1]" class="form-control" type="radio" value="${console2VO.category2Idx}" defaultchecked="checked">
						<i class="fa fa-check glyphicon glyphicon-ok"></i>${console2VO.name2}
					</label>
				</c:forEach>
			</div>
		</div>
		<br />
		<div class="well well-sm text-center" style="margin: 0 auto;">
			<div class="dlk-radio btn-group">
				<c:forEach var="console3VO" items="${console3VOs}">
					<label class="btn btn-info"> <input name="choices[2]" class="form-control" type="radio" value="${console3VO.category3Idx}" defaultchecked="checked">
						<i class="fa fa-check glyphicon glyphicon-ok"></i>${console3VO.name3}
					</label>
				</c:forEach>
			</div>
		</div>
		<br />
	</div>

	<div class="row">
		<ul id="flexiselDemo4" style="width: 880px;">
			<c:forEach var="gameVO" items="${gameVOs}">
				<div class="col-md-3">
					<p class="card-text">${gameVO.email}</p>
					<a href="#" style="text-decoration: none">
						<div class="card mb-3 shadow-sm" style="width: 194.5px;">
							<img class="card-img-top"
								src="/upload/displayFile.do?fileName=${gameVO.fullName}"
								alt="image">
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

	<script>
		$('input[name="choices[1]"]').change(function() {
			/* alert("YES!!"); */
		});
	</script>
</body>
</html>