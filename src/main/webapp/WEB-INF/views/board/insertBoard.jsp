<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body style="width: 1000px; margin: auto;">
	<form role="form1" method="POST" enctype="multipart/form-data">

		<h3>게시글 작성</h3>
		

		<div class="form-group">
			<label>게시판 선택</label>
			<select name="postCategoryIdx">
				<c:forEach var="postVO" items="${postVOs}">
					<option value="${postVO.idx}" <c:if test="${postVO.idx eq postIdx}">selected</c:if>>${postVO.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" placeholder="제목을 입력하세요." name="title" class="form-control" />
		</div>
		<div>
			<label>파일첨부</label> <input type="file" name="image" />
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea cols="10" rows="7" placeholder="내용을 입력하세요." name="content" class="form-control"></textarea>
		</div>

		<input type="submit" class="btn btn-default" value="작성">
	</form>
	<a href="/main.do">메인으로</a>
</body>
</html>