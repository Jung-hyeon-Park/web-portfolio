<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.abc1 {
	width: 76px;
}

.abc2 {
	width: 376px;
}

.abc3 {
	width: 126px;
}

.abc4 {
	width: 226px;
}

.abc5 {
	width: 76px;
}

.row2 {
	display: inline-block;
	float: left;
	width: 400px;
}
.buttons {
	float:left;
}
</style>
</head>
<body style="width: 880px; margin: 0 auto;">
<c:import url="/header.do"></c:import>
<c:import url="/nav.do"></c:import>

<table class="table table-striped table-bordered table-hover">
	<thead>
		<tr>
			<th class="abc1">번호</th>
			<th class="abc2">제목</th>
			<th class="abc3">작성자</th>
			<th class="abc4">날짜</th>
			<th class="abc5">조회수</th>
		</tr>
	</thead>
	<tbody>
	<c:set var="count2" value="${count - (pm.cri.page - 1)*pm.cri.perPageNum}" />
	<c:forEach var="boardVO" items="${boardVOs}">
		<tr>
			<td>${count2}</td>
			<td><a href="/board/readBoard.do${pm.makeSearch(pm.cri.page)}&post=${post}&boardIdx=${boardVO.idx}">${boardVO.title}<c:if test="${boardVO.recnt > 0}"><span style="color:red;">(${boardVO.recnt})</span></c:if></a></td>
			<td>${boardVO.email}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" /></td>
			<td>${boardVO.viewCount}</td>
		</tr>
		<c:set var="count2" value="${count2 - 1}" />
	</c:forEach>
	</tbody>
</table>

<div class="box-body">
	<select name="searchType">
		<option value="b.title" <c:out value="${searchVO.searchType eq 'b.title' ? 'selected':''}"/>>제목</option>
		<option value="b.content" <c:out value="${searchVO.searchType eq 'b.content' ? 'selected':''}"/>>내용</option>
		<option value="u.email" <c:out value="${searchVO.searchType eq 'u.email' ? 'selected':''}"/>>작성자</option>
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" >
	<button type="button" id="searchBnt">검색</button>
</div>



<div class="text-center">
	<ul class="pagination">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link" href="/board/listAll.do${pm.makeSearch(pm.startPage - 1)}&post=${post}">&laquo</a></li>
		</c:if>
		
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
			<li class="page-item"<c:out value="${pm.cri.page == idx?'class=active':''}" />>
				<a class="page-link" href="${pm.makeSearch(idx)}&post=${post}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li class="page-item"><a class="page-link" href="/board/listAll.do${pm.makeSearch(pm.endPage + 1)}&post=${post}">&raquo</a></li>
		</c:if>
	</ul>
	<div class="buttons">
		<a href="/main.do"><button>메인으로</button></a>
		<a href="/board/insertBoard.do?post=${post}"><button>게시글 작성</button></a>
	</div>
</div>
<br><br><br>

<input type="hidden" id="post" value="${post}">

	<c:if test="${post >= 6 && post <= 8}">
	
		<!-- 블로그 리뷰 -->
		<div class="row2">
			<div class="col-md-8 blog-main">
				<h3 class="pb-3 mb-4 font-italic border-bottom">블로그 Review</h3>
				<div class="blog-post" id="blogReview"><h5>검색창에 원하는 게임을 입력하세요.</h5></div>
			</div>
		</div>
		
		<!-- 유튜브 영상 -->
		<div class="row2">
			<div class="col-md-8 blog-main">
				<h3 class="pb-3 mb-4 font-italic border-bottom">유튜브 Review</h3>
				<div id="ytplayer"><h5>검색창에 원하는 게임을 입력하세요.</h5></div>
			</div>
		</div>
	</c:if>

<script type="text/javascript">
	var result = '${msg}';
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#searchBnt").on("click", function(event) {
		
		self.location = "/board/listAll.do"
			+ '${pm.makeQuery(1)}'
			+ '&post='
			+ $('#post').val()
			+ '&searchType='
			+ $("select option:selected").val()
			+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
	
	$("#keywordInput").keypress(function(e) {
		
		if(e.which == 13) {
			self.location = "/board/listAll.do"
				+ '${pm.makeQuery(1)}'
				+ '&post='
				+ $('#post').val()
				+ '&searchType='
				+ $("select option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
		}
	});
});

</script>

 <script>

 	var abc =  <%=session.getAttribute("search") != null%>;
    var search = '<%=session.getAttribute("search")%>';
	if(abc == true) {
		
		$.ajax({
			type : "GET",
			url : "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDMJwx7YPFWlHnC-7B7ch3ub41FvU_66KU&type=video&part=id&q="+search,
			dataType : "json",
			success : function(data) {
				var items = data.items;
				var html = "";
				for(var i=0, length=2; i<length; i++) {
					var item = items[i].id
					console.log(item.videoId);
					
					
					html += '<iframe id="ytplayer" type="text/html" width="640" height="360"'
				  		+'src="http://www.youtube.com/embed/'+item.videoId+'?autoplay=1'
				  		+'frameborder="0"/>';

				}
				$("#ytplayer").html(html);
			}				
		});
		
		
		$.ajax({
			type : "GET",
			url : "/blogAPI/main.do?post=${post}",
			dataType : "json",
			data : $(".container").serialize(),
			success : function(data) {
				
				var html = "";
				var cCnt = data.items.length;
				
				if (cCnt > 0) {
					for (i = 0; i < cCnt; i++) {
						
						html += "<a href="+data.items[i].link+">"
						+"<h4 class='blog-post-title'>"+data.items[i].title+"</h4></a>"
						+"<p class='blog-post-meta'>"+data.items[i].description+"</p><hr>";
					}
					$("#blogReview").html(html);
				}else{
					html="<h6 class='blog-post-title'>입력하신 상품에 대한 블로그 글이 없습니다.</h6>";
						$("#blogReview").html(html);
				}
			},
			error : function(request, status, error) {
				var html="<h6 class='blog-post-title'>게시판 입력창에 원하는 게임을 입력하세요.</h6>";
					$("#blogReview").html(html);

			}
							
		});
		
	}

   </script>

</body>
<br><br><br>
<c:import url="/footer.do"></c:import>
</html>