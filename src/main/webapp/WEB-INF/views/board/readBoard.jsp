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
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/bootstrap/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script>
	var str = document.getElementById("content").value;
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	document.getElementById("content").value = str;
</script>

<style type="text/css">
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
	        		<c:if test="${post eq 5}">
		        		<tr>
			        		<th class="success">기기</th>
		            		<td>${gameDTO.name2}</td>
		            		
		            		<th class="success">분류</th>
		            		<td>${gameDTO.name3}</td>
		            	</tr>
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
	            		<td class="content" id="content" style="word-break:break-all;">${boardVO.content}<br><br>
	            		<div class="box-footer">
	            			<div><hr></div>
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						</div>
	            		</td>
	       		 	</tr>
	       		 </table>
	       		 <c:if test="${login.email == boardVO.userId}">
					<button type="button" class="btn-warning">수정</button>
					<button type="button" class="btn-danger">삭제</button>
				</c:if>
					<button type="button" class="btn-primary">리스트로</button>
				</div>
	       	</div>
	    </div>
	<input type="hidden" name="boardIdx" value="${boardVO.idx}">
	<input type="hidden" name="post" value="${boardVO.postCategoryIdx}">
</form>

<div style="text-align: right;">
	<a class="btn btn-outline-dark check">
		<img id="check" style="width:20px; height: 20px;" src="">
	</a>
	<p>${boardVO.likeCount}</p>
</div>

<div class="popup back" style="display: none;"></div>
<div id="popup_frount" class="popup front" style="display: none;">
	 <img id="popup_img">
</div>
<form role="form1" action="/board/listAll.do?post=${post}" method="GET">
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
			
			// 좋아요 체크
			var check = ${count};
			
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
						/* $("#cCnt").html(cCnt); */
					}
				});
			});
			
		});
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script id="templateAttach" type="text/x-handlebars-template">
		<li style= "list-style: none;">
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		</li>
	</script>
	
</body>
</html>