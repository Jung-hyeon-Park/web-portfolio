<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<style>
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
@import url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700');

h2{float:left; width:100%; color:#fff; margin-bottom:40px; font-size: 14px; position:relartive; z-index:3; margin-top:30px}
h2 span{font-family: 'Libre Baskerville', serif; display:block; font-size:45px; text-transform:none; margin-bottom:20px; margin-top:30px; font-weight:700}
h2 a{color:#fff; font-weight:bold;}

.head{float:left;width:100%;}
.search-box{width:90%; margin:0 auto 40px; box-shadow:10px 13px 0 rgba(0,0,0,0.2);}
.listing-block{background:#fff; height:530px; padding:3px!important; overflow-y:scroll;  width: 180px!important; }
.slimScrollDiv{width:200px!important; padding: 0px; margin-left: 890px; float: right; top: 160px; position: fixed!important; /*  left: 1030px; */}
.media {background:#fff; position:relative; margin-bottom:15px; width: 180px;}
.media img{width:70px;margin:0; height:110px;}
.media-body{border:1px solid #bcbcbc; border-left:0; height:110px;}
.media .price{float:left; width:100%; font-size:1.7rem!important; font-weight:600; color:#4765AB;}
.media .price small{display:block; font-size:17px; color:#232323;}
.media .stats{float:left; width:100%; margin-top:10px;}
.media .stats span{float:left; margin-right:10px; font-size:15px;}
.media .stats span i{margin-right:7px; color:#4765AB;}
.media .address{float:left; width:100%;font-size:14px; margin-top:5px; color:#888;}
.media .fav-box{position:absolute; right:10px; font-size:20px; top:4px; color:#E74C3C;}

.map-box{background-color:#A3CCFF;}
</style>
		<div class="col-md-12 listing-block" style="background-color: black;">
			<span><h3 style="color:white;">추천상품</h3></span>
			<c:forEach var="recommend" items="${recommends}">
        		<div class="media">
            
              	<img class="d-flex align-self-start" src="/upload/displayFile.do?fileName=${recommend.fullName}">
              	<div class="media-body pl-3">
                	<div class="price">${recommend.price}원<small> ${recommend.title}</small></div>
                	<div class="stats">
                    	<span><i class="fa fa-bath"></i>${recommend.email}</span>
                	</div>
                
              	</div>
            	</div>
        	</c:forEach>
            </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<script>
$(function(){
    $('.listing-block').slimScroll({
        height: '530px'
    });
});
</script>
</html>