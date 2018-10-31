<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog Template for Bootstrap</title>
	<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
<style>
  .blog-header {
  line-height: 1;
  border-bottom: 1px solid #e5e5e5;
}

.blog-header-logo {
  font-family: "Playfair Display", Georgia, "Times New Roman", serif;
  font-size: 2.25rem;
}

.blog-header-logo:hover {
  text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display", Georgia, "Times New Roman", serif;
}

.display-4 {
  font-size: 2.5rem;
}
@media (min-width: 768px) {
  .display-4 {
    font-size: 3rem;
  }
}

.nav-scroller {
  position: relative;
  z-index: 2;
  height: 2.75rem;
  overflow-y: hidden;
}

.nav-scroller .nav {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: nowrap;
  flex-wrap: nowrap;
  padding-bottom: 1rem;
  margin-top: -1px;
  overflow-x: auto;
  text-align: center;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
}

.nav-scroller .nav-link {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: .875rem;
}

.card-img-right {
  height: 100%;
  border-radius: 0 3px 3px 0;
}

.flex-auto {
  -ms-flex: 0 0 auto;
  flex: 0 0 auto;
}

.h-250 { height: 250px; }
@media (min-width: 768px) {
  .h-md-250 { height: 250px; }
}

.blog-title {
  margin-bottom: 0;
  font-size: 2rem;
  font-weight: 400;
}
.blog-description {
  font-size: 1.1rem;
  color: #999;
}

@media (min-width: 40em) {
  .blog-title {
    font-size: 3.5rem;
  }
}

.blog-pagination {
  margin-bottom: 4rem;
}
.blog-pagination > .btn {
  border-radius: 2rem;
}

.blog-post {
  margin-bottom: 4rem;
}
.blog-post-title {
  margin-bottom: .25rem;
  font-size: 2.5rem;
}
.blog-post-meta {
  margin-bottom: 1.25rem;
  color: #999;
}


.blog-footer {
  padding: 2.5rem 0;
  color: #999;
  text-align: center;
  background-color: #f9f9f9;
  border-top: .05rem solid #e5e5e5;
}
.blog-footer p:last-child {
  margin-bottom: 0;
}
</style>
  
  </head>
  <body style="width: 880px; margin: 0px auto;">
    <div class="container" style="width: 880px; margin: 0px auto;">
      <div><c:import url="/header.do"></c:import></div>

      <div><c:import url="/nav.do"></c:import></div>

      <div class="row mb-2">
      <c:forEach var="newsVO" items="${newsVOs}"> 
        <div class="col-md-6">
        	<strong class="d-inline-block mb-2 text-primary">${newsVO.title}</strong>
          <div class="card flex-md-row mb-4 shadow-sm h-md-250">
          <img style="width: 380px;"class="card-img-right flex-auto d-none d-lg-block" src="/upload/displayFile.do?fileName=${newsVO.fullName}" alt="Card image cap">
          
        </div>
        </div>
       </c:forEach>
      </div>
    </div>

    <main role="main" class="container">

        
        <div class="col-md-8 blog-main">
          <h3 class="pb-3 mb-4 font-italic border-bottom">정보 공유</h3>

          <div class="blog-post">
            <h4 class="blog-post-title">Console 정보</h4>
            <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>
          </div><!-- /.blog-post -->

          <div class="blog-post">
            <h4 class="blog-post-title">PC 정보</h4>
            <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>
          </div><!-- /.blog-post -->


          <nav class="blog-pagination">
            <a class="btn btn-outline-primary" href="#">Older</a>
            <a class="btn btn-outline-secondary disabled" href="#">Newer</a>
          </nav>

        </div><!-- /.blog-main -->
		<br><br><br><br><br><br>
        <aside class="col-md-4 blog-sidebar" style= "top: -113px;">
          <div class="p-3">
            <h4 class="font-italic">Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a href="https://github.com/Jung-hyeon-Park/">GitHub</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Facebook</a></li>
            </ol>
          </div>
        </aside><!-- /.blog-sidebar -->

      </div><!-- /.row -->
		<div class="ad8" style="width: 830px; clear: both; background-color: sliver;">
		<h3 class="pb-3 mb-4 font-italic border-bottom">인기 리뷰</h3>
			<p class="ty1" style="width: 540px; float: left; margin-top: 25px;">
			<c:forEach var="topReviewVO" items="${topReviewVOs}" begin="0" end="2">
				<span style="display: inline-block; height: 234px; width: 540px; margin-bottom: 25px;">
					<a style="color: #555; text-decoration: none; cursor: pointer;" href="/board/readBoard.do?post=${topReviewVO.postCategoryIdx}&boardIdx=${topReviewVO.idx}">
					${topReviewVO.title}
						<img style="width: 540px; height: 234px; vertical-align: middle; border: 0px;" src="/upload/displayFile.do?fileName=${topReviewVO.fullName}">
					</a>
				</span>
				</c:forEach>
			</p>
			<p class="ty2" style="width: 280px; margin-left: 10px; float: left; margin-top: 25px;">
			<c:forEach var="topReviewVO" items="${topReviewVOs}" begin="3" end="7">
				<span style="display: inline-block; height: 152px; width: 280px; margin-bottom: 47.5px;">
					<a style="color: #555; text-decoration: none; cursor: pointer;" href="/board/readBoard.do?post=${topReviewVO.postCategoryIdx}&boardIdx=${topReviewVO.idx}">
					${topReviewVO.title}
					<img style="width: 280px; height: 152px; vertical-align: middle; border: 0px;" src="/upload/displayFile.do?fileName=${topReviewVO.fullName}">
					</a>
				</span>
				</c:forEach>
			</p>
		</div>
    </main><!-- /.container -->

    <footer class="blog-footer">
      <p>Blog template built for <a href="#">BRAND</a> by <a href="#">tkarnrrns200@naver.com</a></p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </footer>
  </body>
</html>