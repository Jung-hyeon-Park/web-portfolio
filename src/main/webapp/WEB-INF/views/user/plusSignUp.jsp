<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<style>
#signup-terms {
	margin: 10px auto;
	overflow-y: scroll;
	height: 190px;
	border: 1px solid;
	padding: 5px;
}

.terms-stitle {
	font-weight: bold;
}

.terms-btitle {
	text-align: center;
	font-weight: bold;
	font-size: 25px;
}

p {
	font-size: 12px;
}

#signup-privacy {
	margin: 5px auto;
	overflow-y: scroll;
	height: 220px;
	border: 1px solid;
	padding: 15px;
}

body {
	margin: 0 auto;
}

.terms {
	display: flex;
	flex-direction: column;
	margin: 0 auto;
}

.term {
	margin: 0 auto;
}

.nav-item {
	width: 33%;
	margin: 0 auto;
	text-align: center;
}

.nav-link {
	pointer-events: none;
}

.lh-condensed {
	line-height: 1.25;
}
</style>
</head>
<body class="d-flex flex-column" style="width: 1000px; margin: auto;">
	<div class="d-flex" style="margin: 0 auto; padding-top: 10px;">
		<a href="/main.do"><img style="width: 200px;" id="main-img"
			src="../resources/uploadFile/image/ps.png"></a>
	</div>

	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item"><a class="nav-link"
			id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			aria-controls="pills-home" aria-selected="true">1.약관동의</a></li>

		<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
			data-toggle="pill" href="#pills-profile" role="tab"
			aria-controls="pills-profile" aria-selected="false">2.가입방법 선택</a></li>

		<li class="nav-item"><a class="nav-link active" id="pills-contact-tab"
			data-toggle="pill" href="#pills-contact" role="tab"
			aria-controls="pills-contact" aria-selected="false">3.정보 입력</a></li>
	</ul>

	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade active" id="pills-contact" role="tabpanel"
			aria-labelledby="pills-contact-tab">
			<div class="row">
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">추가 정보 입력 <h6>(위 선택은 추천기능에 사용됩니다)</h6></h4>
					<form id="checkUser" role="form2">
						<div class="row check_in">
							<div class="mb-3">
								<label>보유(관심) 기기 선택</label><br>
								<c:forEach var="category2VO" items="${category2VOs}">
									<input type="checkbox" name="category2" value="${category2VO.category2Idx}"><h6>${category2VO.name2}</h6>
								</c:forEach>
							</div>
							<div class="mb-3">
								<label>관심 장르 선택</label><br>
								<c:forEach var="genreVO" items="${genreVOs}">
									<input type="checkbox" name="genre" value="${genreVO.idx}"><h6>${genreVO.name}</h6>
								</c:forEach>
							</div>

							<br>
							<hr>
							<br>
							<div class="mb-3">
								<label for="password">나이</label> <input type="number" name="age"
									class="form-control" id="age" required>
								<div class="invalid-feedback">나이를 입력 해 주세요.</div>
							</div>
							<br>
							<hr>
							<br>

							<hr class="mb-4">
							<button class="btn btn-primary btn-lg btn-block" id="addUser">가입하기</button>
						</div>
						<input type="hidden" name="userIdx" value="${user}">
						<div id="checked"></div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br>

<footer class="my-5 pt-5 text-muted text-center text-small">
	<p class="mb-1">&copy; 2018-10 Company Name</p>
	<ul class="list-inline">
		<li class="list-inline-item"><a href="#">Privacy</a></li>
		<li class="list-inline-item"><a href="#">Terms</a></li>
		<li class="list-inline-item"><a href="#">Support</a></li>
	</ul>
</footer>

<script>
$(".btn-primary").on("click", function() {
	var array1 = [];
	var array2 = [];
	var checkboxes1 = document.querySelectorAll('input[name=category2]:checked');
	var checkboxes2 = document.querySelectorAll('input[name=genre]:checked');
	
	
	var str = "";
	
	for(var i=0; i<checkboxes1.length; i++) {
		
		str += "<input type='hidden' name='category2Idx["+i+"]' value='"+checkboxes1[i].value+"'>";
		array1.push(checkboxes1[i].value);
	}
	
	for(var j=0; j<checkboxes2.length; j++) {
		
		str += "<input type='hidden' name='genreIdx["+j+"]' value='"+checkboxes2[j].value+"'>";
		array2.push(checkboxes2[j].value);
	}
	
	$("#checked").html(str);
	
	 var formObj = $("form[role='form2']");
	 
	 formObj.attr("action", "/user/plusSignUp.do");
	 formObj.attr("method", "POST");
	 formObj.submit();
	
});
	
</script>
</body>
</html>