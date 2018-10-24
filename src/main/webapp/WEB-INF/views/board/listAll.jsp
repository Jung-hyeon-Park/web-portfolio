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

<style>
	.abc1 {
	width: 100px;
	}
	.abc2 {
	width: 400px;
	}
	.abc3 {
	width: 150px;
	}
	.abc4 {
	width: 250px;
	}
	.abc5 {
	width: 100px;
	}
</style>
</head>
<body style="width:880px; margin: auto;">
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
	<c:forEach var="boardVO" items="${boardVOs}">
		<tr>
			<td>${boardVO.idx}</td>
			<td><a href="/board/readBoard.do${pm.makeQuery(pm.cri.page)}&post=${post}&boardIdx=${boardVO.idx}">${boardVO.title}<c:if test="${boardVO.recnt > 0}"><span style="color:red;">(${boardVO.recnt})</span></c:if></a></td>
			<td>${boardVO.email}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.writeDate}" /></td>
			<td>${boardVO.viewCount}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="box-body">
	<select name="searchType">
		<option value="b.title" <c:out value="${searchVO.searchType eq 'b.title' ? 'selected':''}"/>>제목</option>
		<option value="b.content" <c:out value="${searchVO.searchType eq 'b.content' ? 'selected':''}"/>>내용</option>
		<option value="u.name" <c:out value="${searchVO.searchType eq 'u.email' ? 'selected':''}"/>>작성자</option>
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" >
	<button type="button" class="searchBnt" onclick="searchBnt()">검색</button>
</div>



<div class="text-center">
	<ul class="pagination">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link" href="/board/listAll.do${pm.makeQuery(pm.startPage - 1)}">&laquo</a></li>
		</c:if>
		
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
			<li class="page-item"<c:out value="${pm.cri.page == idx?'class=active':''}" />>
				<a class="page-link" href="${pm.makeQuery(idx)}&post=${post}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li class="page-item"><a class="page-link" href="/board/listAll.do${pm.makeQuery(pm.endPage + 1)}">&raquo</a></li>
		</c:if>
	</ul>
</div>

<input type="hidden" id="post" value="${post}">


<a href="/main.do"><button>메인으로</button></a>



<a href="/board/insertBoard.do?post=${post}"><button>게시글 작성</button></a>

<c:if test="${post >= 6 && post <= 8}">
	<div class="row">
        <div class="col-md-8 blog-main">
          <h3 class="pb-3 mb-4 font-italic border-bottom">Blog Review</h3>
          <div class="blog-post" id="blogReview"></div></div>
        </div>
</c:if>

<script src="http://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript">
	var result = '${msg}';
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
</script>
<script type="text/javascript">

	function searchBnt() {
		self.location = "/board/listAll.do"
			+ '${pm.makeQuery(1)}'
			+ '&post='
			+ $('#post').val()
			+ '&searchType='
			+ $("select option:selected").val()
			+ "&keyword="
			+ encodeURIComponent($('#keywordInput').val());
	}

</script>

 <script>
   var search = '<%=session.getAttribute("search")%>';
	if(search != null) {
		$.ajax({
			type : "GET",
			url : "/blogAPI/main.do?post=${post}",
			dataType : "json",
			data : $(".container").serialize(),
			success : function(data) {
				console.log(data.items)
				var html = "";
				var cCnt = data.items.length;
				console.log("갯수 = " + cCnt);
				if (cCnt > 0) {
					for (i = 0; i < cCnt; i++) {
						
						html += "<a href="+data.items[i].link+">"
						+"<h4 class='blog-post-title'>"+data.items[i].title+"</h4></a>"
						+"<p class='blog-post-meta'>"+data.items[i].description+"</p><hr>";
					}
					$("#blogReview").html(html);
				}else{
					html="<h4 class='blog-post-title'>입력하신 상품에 대한 블로그 글이 없습니다.</h4>"
						 +"<p class='blog-post-meta'><a>GAME</a></p>";
						$("#blogReview").html(html);
				}
			},
			error : function(request, status, error) {
				var html="<h4 class='blog-post-title'>게시판 입력창에 원하는 게임을 입력하세요.</h4>"
					 +"<p class='blog-post-meta'><a>GAME</a></p>";
					$("#blogReview").html(html);

			}
							
		});
	}else{
		var html="<h4 class='blog-post-title'>게시판 입력창에 원하는 게임을 입력하세요.</h4>"
			 +"<p class='blog-post-meta'><a>GAME</a></p>";
			$("#blogReview").html(html);
	}
   </script>

</body>
</html>