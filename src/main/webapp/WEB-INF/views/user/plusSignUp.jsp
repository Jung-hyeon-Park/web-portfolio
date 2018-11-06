<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css"> -->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
  @keyframes check {0% {height: 0;width: 0;}
    25% {height: 0;width: 10px;}
    50% {height: 20px;width: 10px;}
  }
  .checkbox{background-color:#fff;display:inline-block;height:28px;margin:0 .25em;width:28px;border-radius:4px;border:1px solid #ccc;float:right}
  .checkbox span{display:block;height:28px;position:relative;width:28px;padding:0}
  .checkbox span:after{-moz-transform:scaleX(-1) rotate(135deg);-ms-transform:scaleX(-1) rotate(135deg);-webkit-transform:scaleX(-1) rotate(135deg);transform:scaleX(-1) rotate(135deg);-moz-transform-origin:left top;-ms-transform-origin:left top;-webkit-transform-origin:left top;transform-origin:left top;border-right:4px solid #fff;border-top:4px solid #fff;content:'';display:block;height:20px;left:3px;position:absolute;top:15px;width:10px}
  .checkbox span:hover:after{border-color:#999}
  .checkbox input{display:none}
  .checkbox input:checked + span:after{-webkit-animation:check .8s;-moz-animation:check .8s;-o-animation:check .8s;animation:check .8s;border-color:#555}
.checkbox input:checked + .default:after{border-color:#444}
.checkbox input:checked + .primary:after{border-color:#2196F3}
.checkbox input:checked + .success:after{border-color:#8bc34a}
.checkbox input:checked + .info:after{border-color:#3de0f5}
.checkbox input:checked + .warning:after{border-color:#FFC107}
.checkbox input:checked + .danger:after{border-color:#f44336}

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
	font-size: 1rem;
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

.container {
	display: inline-block;
	float: left;
	width: 500px;
}
</style>
</head>
<body class="d-flex flex-column" style="width: 1000px; margin: auto;">
	<form role="form2">
		<div>
			<div class="d-flex" style="margin: 0 auto; padding-top: 10px;">
				<a href="/main.do"><img style="width: 200px;" id="main-img"
					src="../resources/uploadFile/image/ps.png"></a>
			</div>

			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="pills-home-tab"
					data-toggle="pill" href="#pills-home" role="tab"
					aria-controls="pills-home" aria-selected="true">1.약관동의</a></li>

				<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
					data-toggle="pill" href="#pills-profile" role="tab"
					aria-controls="pills-profile" aria-selected="false">2.가입방법 선택</a></li>

				<li class="nav-item"><a class="nav-link active"
					id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
					role="tab" aria-controls="pills-contact" aria-selected="false">3.정보
						입력</a></li>
			</ul>
			<div class="container">
				<h4 class="mb-3">
					추가 정보 입력
					<h6>(위 선택은 추천기능에 사용됩니다)</h6>
				</h4>
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="card" style="margin: 50px 0">
							<div class="card-header">보유(관심) 기기 선택</div>

							<ul class="list-group list-group-flush">
								<c:forEach var="category2VO" items="${category2VOs}">
									<li class="list-group-item">${category2VO.name2}<label
										class="checkbox"> <input type="checkbox"
											name="category2" value="${category2VO.category2Idx}" /> <span
											class="primary"></span>
									</label>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="card" style="margin: 50px 0">
							<div class="card-header">관심 장르 선택</div>

							<ul class="list-group list-group-flush">
								<c:forEach var="genreVO" items="${genreVOs}">
									<li class="list-group-item">${genreVO.name}<label
										class="checkbox"> <input type="checkbox" name="genre"
											value="${genreVO.idx}" /> <span class="primary"></span>
									</label>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 400px;">
				<div class="mb-3">
					<label for="password">나이</label> <input type="number" name="age"
						class="form-control" id="age" required>
					<div class="invalid-feedback">나이를 입력 해 주세요.</div>
				</div>

				<button class="btn btn-primary btn-lg btn-block" id="addUser">가입하기</button>
				<input type="hidden" name="userIdx" value="${user}">
				<div id="checked"></div>
			</div>
		</div>
	</form>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2018-10 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>
	<script>
		$(".btn-primary")
				.on(
						"click",
						function() {
							var array1 = [];
							var array2 = [];
							var checkboxes1 = document
									.querySelectorAll('input[name=category2]:checked');
							var checkboxes2 = document
									.querySelectorAll('input[name=genre]:checked');

							var str = "";
							if (checkboxes1.length == 0
									&& checkboxes2.length == 0) {
								alert("회원가입을 축하드립니다.");
								self.location.href = "/user/login.do";
							} else {
								if (checkboxes1.legnth != 0) {
									for (var i = 0; i < checkboxes1.length; i++) {
										str += "<input type='hidden' name='category2Idx["+i+"]' value='"+checkboxes1[i].value+"'>";
										array1.push(checkboxes1[i].value);
									}
								}

								if (checkboxes2.length != 0) {
									for (var j = 0; j < checkboxes2.length; j++) {

										str += "<input type='hidden' name='genreIdx["+j+"]' value='"+checkboxes2[j].value+"'>";
										array2.push(checkboxes2[j].value);
									}
								}

								$("#checked").html(str);

								var formObj = $("form[role='form2']");

								formObj.attr("action", "/user/plusSignUp.do");
								formObj.attr("method", "POST");
								console.log(checkbox1[0].value);
								console.log(checkbox2[0].value);
								formObj.submit();
							}

						});
	</script>
</body>
<c:import url="/footer.do"></c:import>
</html>