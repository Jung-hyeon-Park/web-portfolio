<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px solid black;
	}
	
	small {
	margin-left: 3px;
	font-weight: bold;
	color: blue;
	}
	
</style>
</head>
<body>

<h3>파일 업로드</h3>
<div class="fileDrop"></div>

<div class="uploadedList"></div>

<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
////////
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
///////////	

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: '/upload/uploadAjax.do',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data) {

				var str = "";
				if(checkImageType(data)) {
					str = "<div><a href=/upload/displayFile.do?fileName="+getImageLink(data)+">"
							+"<img src='/upload/displayFile.do?fileName="+data+"'/></a>"
							+"<small data-src="+data+">X</small>"
							+"</div>";
				}else{
					str = "<div><a href='/upload/displayFile.do?fileName="+data+"'>"
						+getOriginalName(data)+"</a>"
						+"<small data-src="+data+">X</small>"
						+"</div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
	});
	
	
//////////	
	function getImageLink(fileName) {
		if(!checkImageType(fileName)) {
			return;
		}
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	}
	
	
//////////
	function checkImageType(fileName) {
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
	}
	
	
/////////////	
	function getOriginalName(fileName) {
		if(checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		
		return fileName.substr(idx);
	}
	
	$(".uploadedList").on("click", "small", function(event) {
		
		var that = $(this);
		
		$.ajax({
			url: "/upload/deleteFile.do",
			type: "POST",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result == 'deleted') {
					that.parent("div").remove();
				}
			}
		});
	});
</script>

</body>
</html>