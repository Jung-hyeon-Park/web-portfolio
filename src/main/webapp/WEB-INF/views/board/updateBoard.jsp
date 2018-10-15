<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	var text = document.querySelector("textarea");
	var result2 = text.value.replace(/\n|\r\n/g, '<br>');
</script>
</head>
<body>
	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			$(".btn-warning").on("click", function() {
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
				self.location = "/board/listAll.do?postCategoryIdx=${postCategoryIdx}";
			});
		});
	</script>
	<form role="form" method="POST">
		<input type="hidden" name="postCategoryIdx" value="${postCategoryIdx}">
		<input type="hidden" name="idx" value="${boardVO.idx}">
		<div>
			<div>
				<div>제목 : <input type="text" name="title" value="${boardVO.title}"></div>
			</div>
			<div>
				<div>조회수 : ${boardVO.viewCount}</div>
			</div>
			<div>
				<div>작성일 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" />
				</div>
			</div>
			<div>
				<div>작성자 : ${boardVO.name}</div>
			</div>
			<div>
				<div>
					내용 :
					<textArea name="content">${boardVO.content}</textArea>
				</div>
			</div>
			<div>
				<div>이미지 : ${boardVO.image}</div>
			</div>
		</div>
	</form>
	<div>
		<button type="button" class="btn-warning">수정완료</button>
		<button type="button" class="btn-primary">취소</button>
	</div>
</body>
</html>