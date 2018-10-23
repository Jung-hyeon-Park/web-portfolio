<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:import url="/sideBar.do"></c:import>
<body>
	<header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <a class="text-muted" href="#"><h3>LOGO Image</h3></a>
          </div>
          <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="/main.do">NAME</a>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <c:if test="${login.email == null}">
            	<a class="btn btn-sm btn-outline-secondary" href="/user/login.do">로그인</a>&nbsp;&nbsp;
            	<a class="btn btn-sm btn-outline-secondary" href="/user/signUp.do?">회원가입</a>
            </c:if>
            <c:if test="${login.email != null}">
            	<h5>${login.email}님 환영합니다.</h5>
            	<a class="btn btn-sm btn-outline-secondary" href="/user/logout.do">로그아웃</a>
            </c:if>
          </div>
        </div>
      </header>
</body>
</html>