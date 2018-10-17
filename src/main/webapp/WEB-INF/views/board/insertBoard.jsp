<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/bootstrap/js/upload.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background: lightslategray;
	margin: auto;
}
	</style>
</head>
<body style="width: 1000px; margin: auto;">
	<form role="form" method="POST" id="insertBoardForm" enctype="multipart/form-data">
	<div style="width: 1000px; margin: auto;">
		<h3>게시글 작성</h3>
		<div class="form-group">
			<label>게시판 선택</label>
			<select name="postCategoryIdx" id="postCategory">
				<c:forEach var="postVO" items="${postVOs}">
					<option value="${postVO.idx}"<c:if test="${postVO.idx eq post}">selected</c:if>>${postVO.name}</option>
				</c:forEach>
			</select>
		</div>
		<div class="inner">
		</div>
		<div class="form-group">
			<label>제목</label>
			<input type="text" placeholder="제목을 입력하세요." name="title" class="form-control" />
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">파일을 당겨 주세요.</label>
			<div class="fileDrop"></div>
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea cols="10" rows="7" placeholder="내용을 입력하세요." name="content" class="form-control"></textarea>
		</div>
	</div>
		
	<div class="box-footer">
		<div>
			<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
	</div>

		<button type="submit" class="btn btn-primary">작성</button>
	</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a data-src="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>

<script>
var template = Handlebars.compile($("#template").html());

// 파일 업로드 영역에서 기본효과 제한
$(".fileDrop").on("dragenter dragover", function(event) {
	event.preventDefault();
});

// 드래그 해서 드롭한 파일들 ajax 업로드 요청
$(".fileDrop").on("drop", function(event) {
	event.preventDefault();
	// 드래그 한 파일들
	var files = event.originalEvent.dataTransfer.files;
	
	// 첫번째 첨부파일
	var file = files[0];
	
	var formData = new FormData();
	
	// 첨부파일 추가
	formData.append("file", file);
	
	$.ajax({
		url: '/upload/uploadAjax.do',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
			
			//첨부파일 정보
			var fileInfo = getFileInfo(data);
			// 하이퍼 링크
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
		}
	});
});
	
$(".uploadedList").on("click", ".delbtn", function(event) {
	
	var that = $(this).attr("data-src");

	$.ajax({
		url: "/upload/deleteFile.do",
		type: "POST",
		data: {fileName:$(this).attr("data-src")},
		dataType: "text",
		success: function(result) {
			if(result == 'deleted') {
				that.parent("li").remove();
			}
		}
	});
});

$("#insertBoardForm").submit(function(event) {
	event.preventDefault();
	var that = $(this);
	
	var str = "";
	
	$(".uploadedList .delbtn").each(function(index) {
		
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
	});
	
	that.append(str);
	
	that.get(0).submit();
});
</script>

<script>
$("#postCategory").change(function() {
	var category = $(this).val();
	var html = "";
	if(category == '5') {
		html = "<div class='form-group'>"
			+"<label>사용여부</label>"
			+"<select name='status'>"
			+"<option value=1>미사용/미개봉</option>"
			+"<option value=2>사용품</option>"
			+"</select>"
			+"<label>상태</label>"
			+"<select name='condition'>"
			+"<option value=1>A+</option>"
			+"<option value=2>A</option>"
			+"<option value=3>B</option>"
			+"<option value=4>C</option>"
			+"</select>"
			+"<label>분류</label>"
			+"<select name='category3Idx'>"
			+"<option value=1>본체/패키지</option>"
			+"<option value=2>게임 타이틀</option>"
			+"<option value=3>주변 기기</option>"
			+"</select>"
			+"</div>"
			+"<div class='form-group'>"
			+"<label>가격</label>"
			+"<input type='number' name='price'><strong>원</strong>"
			+"</div>";
		$(".inner").append(html);
	}else{
		$(".inner > div").remove();
	}
});
</script>
	<a href="/main.do">메인으로</a>
</body>
</html>