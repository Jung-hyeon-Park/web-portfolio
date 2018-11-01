<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
</head>
<style>
 @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,800,700,300);
@import url(https://fonts.googleapis.com/css?family=Squada+One);
body {
  /* padding: 20px 80px; */
  background: #eee url(https://subtlepatterns.com/patterns/extra_clean_paper.png);
}
#menu {
  width: 880px;
  height: 42px;
  list-style: none;
  margin: 0px auto;
  padding: 6px 10px;
  border-top: 4px double #AAA;
  border-bottom: 4px double #AAA;
  position: relative;
  text-align: center;
}
#menu li {
  display: inline-block;
  width: 100px;
  margin: 0 10px;
  position: relative;
  -webkit-transform: skewy(-3deg);
  -webkit-backface-visibility: hidden;
  -webkit-transition: 200ms all;
}
#menu li a {
  text-transform: uppercase;
  font-family: 'Squada One', cursive;
  font-weight: 800;
  display: block;
  background: #FFF;
  padding: 2px 10px;
  color: #333;
  font-size: 12px;
  text-align: center;
  text-decoration: none;
  position: relative;
  z-index: 1;
  text-shadow: 
        1px 1px 0px #FFF, 
        2px 2px 0px #999,
        3px 3px 0px #FFF;
    background-image: -webkit-linear-gradient(top, transparent 0%, rgba(0,0,0,.05) 100%);
    -webkit-transition: 1s all;
    background-image: -webkit-linear-gradient(left top, 
        transparent 0%, transparent 25%, 
        rgba(0,0,0,.15) 25%, rgba(0,0,0,.15) 50%, 
        transparent 50%, transparent 75%, 
        rgba(0,0,0,.15) 75%);
  background-size: 4px 4px;
    box-shadow: 
        0 0 0 1px rgba(0,0,0,.4) inset, 
        0 0 20px -5px rgba(0,0,0,.4),
        0 0 0px 3px #FFF inset;
}
#menu li:hover {
    width: 120px;
    margin: 0 -5px;
}
#menu a:hover {
  color: #d90075;
}
#menu li:after,
#menu li:before {
  content: '';
  position: absolute;
  width: 50px;
  height: 100%;
  background: #BBB;
  -webkit-transform: skewY(8deg);
  x-index: -3;
    border-radius: 4px;
}
#menu li:after {
    background-image: -webkit-linear-gradient(left, transparent 0%, rgba(0,0,0,.4) 100%);
  right: 0;
  top: -4px; 
}
#menu li:before {
  left: 0;
  bottom: -4px;
    background-image: -webkit-linear-gradient(right, transparent 0%, rgba(0,0,0,.4) 100%);
}

</style>
<body>

<div id="header" style="width: 880px; margin: 0px auto;">
  <ul id="menu">
  <c:forEach var="postCategoryVO" items="${postCategoryVOs}">
  <c:if test="${postCategoryVO.idx != 5}">
    <li>
   		<a href="/board/listAll.do?post=${postCategoryVO.idx}">
    		<span>${postCategoryVO.name}</span>
    	</a>
    </li>
    </c:if>
    <c:if test="${postCategoryVO.idx == 5}">
    <li>
   		<a href="/game/gameAll.do?console=0&console2=0">
    		<span>${postCategoryVO.name}</span>
    	</a>
    </li>
    </c:if>
    </c:forEach>
    <li>
    	<a style="background-color: yellow;" href="/board/insertBoard.do?post=5">
    		<span>중고상품 팔기</span>
    	</a>
  	</li>
  </ul>
</div>
</body>
</html>