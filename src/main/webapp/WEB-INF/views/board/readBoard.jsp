<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
	var text = document.querySelector("textarea");
	var result2 = text.value.replace(/\n|\r\n/g, '<br>');
</script>
</head>
<body>

	<form role="form" method="POST">
	
	
	<div class="row">
    	<div class="col-xs-2 col-md-2"></div>
   		<div class="col-xs-8 col-md-8">
    		<h2 class="text-center">게시글 보기</h2>
    		<p>&nbsp;</p>
    		<div class="table table-responsive">
       			<table class="table">
	        		<tr>
	            		<th class="success">글번호</th>
	            		<td>${boardVO.idx}</td>
	            		<th class="success">조회수</th>
	            		<td>${boardVO.viewCount}</td>
	        		</tr>
	        		<tr>
	            		<th class="success">작성자</th>
	            		<td>${boardVO.name}</td>
	            		<th class="success">작성일</th>
	            		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" /></td>
	        		</tr>
	         
	        		<tr>
	            		<th class="success">제목</th>
	            		<td colspan="3">${boardVO.title}</td>
	        		</tr>
	         
	        		<tr>
	            		<th class="success">글 내용</th>
	            		<td colspan="7">${boardVO.content}<br><br>
	            			<c:if test="${boardVO.img != null}"><img src="/resources/uploadFile/image/${boardVO.image}"></div>
	            			</c:if>
	            		</td>
	       		 	</tr>
	       		 </table>
	       		</div>
	       	</div>
		<input type="hidden" name="boardIdx" value="${boardVO.idx}">
	</div>
	</form>
	
	<div>
		<div>
			<div>제목 : <input type="text" name="title" value="${boardVO.title}" readonly="readonly"></div>
		</div>
		<div>
			<div>조회수 : ${boardVO.viewCount}</div>
		</div>
		<div>
			<div>
				작성일 :
				<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" />
			</div>
		</div>
		<div>
			<div>작성자 : ${boardVO.name}</div>
		</div>
		<div>
			<div>내용 :<textArea name="content" readonly="readonly">${boardVO.content}</textArea></div>
		</div>
		<c:if test="${boardVO.image != null}">
			<div>
				<div>이미지 : <img src="/resources/uploadFile/image/${boardVO.image}"></div>
			</div>
		</c:if>
	</div>
	<div>
		<button type="button" class="btn-warning">수정</button>
		<button type="button" class="btn-danger">삭제</button>
		<button type="button" class="btn-primary">리스트로</button>
	</div>
	
	<form role="form" action="/board/listAll.do?postCategoryIdx=${postCategoryIdx}", method="GET">
		<input type="hidden" name="postCategoryIdx" value="${postCategoryIdx}">
		<input type="hidden" name="boardIdx" value="${boardVO.idx}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	</form>
	
	<script>
		$(document).ready(function() {
			
			var formObj = $("form[role='form']");
	
			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/board/updateBoard.do");
				formObj.attr("method", "GET");
				formObj.submit();
			});
			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/board/deleteBoard.do");
				formObj.submit();
			});
			$(".btn-primary").on("click", function() {
				self.location = "/board/listAll.do?postCategoryIdx=${postCategoryIdx}";
			});
		});
	</script>
	
	<div>
		<%@include file="../comment/comment.jsp" %>
	</div>
	
</body>
</html>