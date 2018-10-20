<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
</head>
<body>
<script>
function add_comment(boardIdx) {
	var userVO = "<%=session.getAttribute("login")%>"
	
	if(userVO == "null") {
		alert("로그인이 필요합니다.");
		self.location("/user/login.do");
	} else{
		$.ajax({
			type : "POST",
			url : "/comment/insertComment.do",
			dataType : "JSON",
			data : $("#commentForm").serialize(),
			complete : function(data) {
				if(data == "success") {
					alert("댓글이 등록 되었습니다.2");
					getCommentList();
				}
			},
			error : function() {
				alert("댓글이 등록 되었습니다.");
				getCommentList();
				$("#comment").val("");
			}
		});	
	}
}

$(function() {
	getCommentList();
});

function getCommentList() {
	$.ajax({
		type : "GET",
		url : "/comment/selectComment.do",
		dataType : "json",
		data : $("#commentForm").serialize(),
		success : function(data) {
			var html = "";
			var cCnt = data.length;
			if (data.length > 0) {
				for (i = 0; i < data.length; i++) {
					html += "<div>";
					html += "<div id='smallCMT'><table class='table'><h6><strong>"+ data[i].name + "</strong></h6>";
					html += "<tr><td>"+data[i].comment+"</td></tr>";
					html += "</table></div>";
					html += "</div>";
				}
			} else {
				html += "<div>";
				html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
				html += "</table></div>";
				html += "</div>";
			}
			$("#cCnt").html(cCnt);
			$("#commentList").html(html);
		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
						
	});
}
</script>
<div>
	<form id="commentForm" name="commentForm" method="post">
		<div>
			<span><strong>Comments</strong></span> <span id="cCnt"></span>
		</div>
		<div>
			<input type="text" id="comment" name="comment" placeholder="댓글을 입력 해 주세요."> <br>
			<div>
				<a href='#' onClick="add_comment('${boardVO.idx}')" class="btn pull-right btn-success">댓글 등록</a>
            </div>
		</div>
		<input type="hidden" id="boardIdx" name="boardIdx" value="${boardVO.idx}" />
	</form>
</div>

<div>
	<form id="commentListForm" name="commentListForm" method="post">
		<div id="commentList"></div>
	</form>
</div>

</body>
</html>