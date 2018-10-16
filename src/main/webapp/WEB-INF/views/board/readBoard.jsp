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
	            			<c:if test="${boardVO.image != null}"><img src="/resources/uploadFile/image/${boardVO.image}">
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
		<button type="button" class="btn-warning">수정</button>
		<button type="button" class="btn-danger">삭제</button>
		<button type="button" class="btn-primary">리스트로</button>
	</div>
	
	<form role="form" action="/board/listAll.do?post=${post}", method="GET">
		<input type="hidden" name="post" value="${post}">
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
				
				var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g,"");
				
				if(replyCnt > 0) {
					alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
					return;
				}
				
				var arr = [];
				$(".uploadedList li").each(function(index) {
					arr.push($(this).attr("data-src"));
				});
				
				if(arr.length > 0) {
					$.post("/upload/deleteAllFiles.do", {files:arr}, function() {
						
					});
				}
				
				
				formObj.attr("action", "/board/deleteBoard.do");
				formObj.submit();
			});
			$(".btn-primary").on("click", function() {
				self.location = "/board/listAll.do?post=${post}";
			});
		});
	</script>
	
	<div>
		<%@include file="../comment/comment.jsp" %>
	</div>
	
</body>
</html>