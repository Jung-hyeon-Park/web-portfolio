<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/resources/bootstrap/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/resources/bootstrap/js/jquery.flexisel.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/bootstrap/js/upload.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" mintegrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
.popup {
	position: absolute;	
}
.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}
.front {
	z-index: 1110;
	opacity: 1;
	border: 1px;
	margin: auto;
}
.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>
</head>
<body style="width: 880px; margin: 0 auto;">
<c:import url="/header.do"></c:import>

<c:import url="/nav.do"></c:import>

<form role="form" method="POST">
	<div class="row">
   		<div class="col-xs-8 col-md-8">
    		<h4 class="text-center">상세 게시글</h4>
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
	            		<td>${boardVO.email}</td>
	            		<th class="success">작성일</th>
	            		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" /></td>
	        		</tr>
	         
	        		<tr>
	            		<th class="success">제목</th>
	            		<td>${boardVO.title}</td>
	            		<th class="success" colspan="2"></th>
	        		</tr>
	        		<c:if test="${post eq 5}">
		            	<tr>
		            		<th class="success">사용여부</th>
		            		<td>${gameDTO.status}</td>
		            		
		            		<th class="success">상태</th>
		            		<td>${gameDTO.state}</td>
		            	</tr>
		            	<tr>
		            		<th class="success">가격</th>
		            		<td>${gameDTO.price}원</td>
		        		</tr>
	        		</c:if>
	        		<c:if test="${post gt 5 and post lt 9}">
	        		<th class="success">분류</th>
	        			<td>${reviewDTO.name2}</td>
	        		<th class="success">평점</th>
	        			<c:if test="${reviewDTO.grade eq 5}">
	            			<td>★★★★★</td>
	            		</c:if>
	            		<c:if test="${reviewDTO.grade eq 4}">
	            			<td>★★★★☆</td>
	            		</c:if>
	            		<c:if test="${reviewDTO.grade eq 3}">
	            			<td>★★★☆☆</td>
	            		</c:if>
	            		<c:if test="${reviewDTO.grade eq 2}">
	            			<td>★★☆☆☆</td>
	            		</c:if>
	            		<c:if test="${reviewDTO.grade eq 1}">
	            			<td>★☆☆☆☆</td>
	            		</c:if>
	        		</c:if>
	         
	        		<tr>
	            		<th class="success">글 내용</th>
	            		<td class="content" id="content" colspan="4" style= "white-space:pre-line; word-break:break-all;">${boardVO.content}<br><br>
	            		<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						</div>
	            		</td>
	       		 	</tr>
	       		 </table>
	       		 <c:if test="${login.email == boardVO.email}">
					<button type="button" class="btn-warning">수정</button>
					<button type="button" class="btn-danger">삭제</button>
				</c:if>
					<button type="button" class="btn-primary">리스트로</button>
				</div>
	       	</div>
	    </div>
	<input type="hidden" name="boardIdx" value="${boardVO.idx}">
	<input type="hidden" name="post" value="${boardVO.postCategoryIdx}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="page" value="${cri.perPageNum}">
</form>

<script>
$(".btn-primary").on("click", function() {
	self.location = "/board/listAll.do?keyword=${cri.keyword}&searchType=${cri.searchType}&post=${post}&page=${cri.page}&perPageNum=${cri.perPageNum}";
});
</script>

<div style="text-align: right;">
	<a class="btn btn-outline-dark check">
		<img id="check" style="width:20px; height: 20px;" src="/resources/uploadFile/image/OffCheck.png">
	</a>
	<p>${boardVO.likeCount}</p>
</div>

<div class="popup back" style="display: none;"></div>
<div id="popup_frount" class="popup front" style="display: none;">
	 <img id="popup_img">
</div>
<form role="form1" action="/board/listAll.do?post=${post}&page=${cri.page}&perPageNum=${cri.perPageNum}" method="GET">
	<input type="hidden" name="post" value="${post}">
	<input type="hidden" name="boardIdx" value="${boardVO.idx}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
</form>

<div>
	<%@include file="../comment/comment.jsp" %>
</div>
	
	<script>
		$(document).ready(function() {
			
			var boardIdx = ${boardVO.idx};
			var template = Handlebars.compile($("#templateAttach").html());
			
			$.getJSON("/upload/getFiles.do/"+boardIdx, function(list) {
				
				$(list).each(function() {
					
					var fileInfo = getFileInfo(this);
					var html = template(fileInfo);
					
					$(".uploadedList").append(html);
				});
			});
			
			$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event) {
				
				var fileLink = $(this).attr("href");
				
				if(checkImageType(fileLink)) {
					event.preventDefault();
					
					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);
					
					$(".popup").show("slow");
					imgTag.addClass("show");
				}
			});
			
			$("#popup_img").on("click", function() {
				$(".popup").hide("slow");
			});
			
			var formObj = $("form[role='form']");
	
			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/board/updateBoard.do");
				formObj.attr("method", "GET");
				formObj.submit();
			});
			
			$(".btn-danger").on("click", function() {
				
				var replyCnt = $("#cCnt").html().replace(/[^0-9]/g,"");
				
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
			
			// 좋아요 체크
			var check = ${count};
			if(check != null) {
				if(check > 0) {
					$("#check").prop("src", "/resources/uploadFile/image/OnCheck.png");
					$(".check").prop("name", check);
				}else{
					$("#check").prop("src", "/resources/uploadFile/image/OffCheck.png");
					$(".check").prop("name", check);
				}
				
				$(".check").on("click", function() {
					var that = $(".check");
					
					var sendData = {'boardIdx':'${boardVO.idx}', 'check':that.prop('name')}
					
					$.ajax({
						url:"/board/nomination.do",
						type:"post",
						data: sendData,
						success: function(data) {
							that.prop('name', data);
							
							if(data == 1) {
								$('#check').prop("src", "/resources/uploadFile/image/OnCheck.png");
							}else{
								$("#check").prop("src", "/resources/uploadFile/image/OffCheck.png");
							}
						}
					});
				});
			}
			
		});
	</script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> -->
	<script id="templateAttach" type="text/x-handlebars-template">
		<li style= "list-style: none;">
			<span class="mailbox-attachment-icon has-img"><img name="files" src="{{imgsrc}}" alt="Attachment"></span>
		</li>
	</script>
</body>
<c:import url="/footer.do"></c:import>
</html>