<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Signin Template for Bootstrap</title>
    <style>
html, body {
  height: 100%;
}

.text-center {
font-size: 1rem;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
    </style>

    <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
  </head>

  <body class="text-center" style="width: 880px; margin: auto;">
    <form action="/user/loginCheck.do" method="POST" class="form-signin">
      <img class="mb-4" src="/resources/uploadFile/image/logo.png" alt="image" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" name="useCookie"> 자동로그인
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018-10</p>
    </form>
  </body>
</html>