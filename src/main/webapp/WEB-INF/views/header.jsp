<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div>
<c:import url="/sideBar.do"></c:import>
<c:import url="/test.do"></c:import>
</div>
	<header class="blog-header py-3" style="width: 880px;">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <a class="text-muted" href="/main.do"><img style="height: 100px; width: 200px;" src="/resources/uploadFile/image/logo.png" /></a>
          </div>
          <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="/main.do">GAME ARENA</a>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <c:if test="${login.email == null}">
            	<a class="btn btn-sm btn-outline-secondary" href="/user/login.do">로그인</a>&nbsp;&nbsp;
            	<a class="btn btn-sm btn-outline-secondary" href="/user/signUp.do?">회원가입</a>
            </c:if>
            <c:if test="${login.email != null}">
            	<h5 id="email">${login.email}</h5><h4>님 환영합니다.</h4>
            	<a class="btn btn-sm btn-outline-secondary" href="/user/logout.do">로그아웃</a>
            </c:if>
          </div>
        </div>
      </header>
      
      <script>
      	var email = $("#email").html();
      	var email2 = email.split('@');
      	$("#email").html(email2[0]);
      </script>
