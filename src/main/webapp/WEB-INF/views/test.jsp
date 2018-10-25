<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<style>
#intd_warp{
clear:both;
width:100%
}
#intd_warp p,div,table,span{
font-family:'ng','나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','Trebuchet MS' ;-webkit-font-smoothing: antialiased
}
 
.t_left_img{
float:left;
height:228px;
}
.t_left_text{
float:left;
padding:30px 20px 20px 20px;
}
 
#intd_warp .title_large{
font-size:30px;
font-weight:500;
}
 
#intd_warp .title_msg{
font-family:'ng','나눔고딕','NanumGothic';
margin-top:20px;
font-size:14px;
font-weight: 400;
color:#6a6a6a;
line-height: 28px;
}
 
#intd_warp .sline{
clear:both;
width:100%;
margin: 0 auto;
background-color: #f7f7f7;
border-top: 1px solid #f1f0f0;
padding: 20px 0;
text-align: center;
height:60px;
}
 
.cfont_light{
font-weight:400 !important;
}
 
.pt1{
text-align:center;
}
 
.pt2{
margin-top:10px;
text-align:center;
}
 
.p2_desc_text{
font-size:14px;
font-weight: 400;
color:#6a6a6a;
line-height: 28px;
}
 
.btm_list{
    font-size: 0;
}
 
#sec1 ul{
list-style: none;
font-size: 0;
display: block;
list-style-type: disc;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
-webkit-padding-start: 0px;
}
 
.btm_item:first-child {
    margin-left: 10px;
}
 
.btm_item{
    margin-left: 0;
    position: relative;
    display: inline-block;
    vertical-align: top;
    width: 310px;
    margin: 0 0 0 15px;
    padding: 228px 0 0;
    text-align: center;
}
 
.btm_image {
    position: absolute;
    width: 290px;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    vertical-align: middle;
    color: transparent;
}
 
.btm_head {
    position: relative;
    font-size: 20px;
    font-weight: 700;
    line-height: 28px;
    color: #ff5875;;
    text-align: center;
    margin-bottom: 10px;
    display: block;
}
 
.btm_desc {
    position: relative;
    font-size: 14px;
    font-weight: 400;
    line-height: 22px;
    color: #6a6a6a;
    text-align: center;
}
 
.bmt-section:before {
    content: '';
    position: relative;
    display: block;
    margin: 0 auto;
    height: 80px;
    width: 100%;
    border-top: 1px solid #e5e5e5;
}
 
.bmt-section{
    padding: 0 0 80px;
overflow: hidden
}
 
 
.bmt-section--no-border:before {
    border-top: none;
}
 
.ss_left{
float:left;
margin-top:20px;
padding:20px 0 0 40px;
 
}
 
.ss_right{
float:right;
margin-top:20px;
padding:20px 40px 0 0;
}
 
.ss_title{
font-size: 20px;
font-weight: 700;
line-height: 28px;
color: #ff5875;
}
 
.ss_desc{
margin-top:10px;
font-size:14px;
font-weight: 400;
color:#6a6a6a;
line-height: 28px;
}
 
.mgt25{
margin-top:25px;
}
 
 
.mgt30{
margin-top:30px;
}
 
.btm20{
margin-bottom:20px;
}
 
 
#sec4 ul{
list-style:none;
font-size: 0;
-webkit-margin-before: 10em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
-webkit-padding-start: 40px;
}
 
 
.btm2_image {
 
    width: 100px;
    margin: 0;
    padding: 0;
    vertical-align: middle;
}
 
.btm2_head {
   position: absolute;
top:0;
left:110px;
    font-size: 20px;
    font-weight: 700;
    line-height: 28px;
    color: #ff5875;
    text-align: center;
    margin-bottom: 10px;
    display: block;
}
 
.btm2_desc {
    position: absolute;
top:35px;
left:110px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.4em;
    color: #6a6a6a;
    text-align: left;
}
 
.btm2_item{
position: relative;
    vertical-align: top;
    margin: 0 0 40px 0;
 
}
 
 
.noshow{
    display: none;
}
 
.hidden{
    display: none;
}
</style>
<body>

<div id="intd_warp">
    <div class="t_left_img">
    <img src="/images/introduction/top_img1.png">
    </div>
    <div class="t_left_text">
    <p class="title_large">예약 하기 좋은 솔루션
 
    XpressEngine 예약 모듈
    </p>
    <p class="title_msg">XE 예약 모듈은 국산 CMS인 XpressEngine 모듈로 개발이 되었습니다.
     
중복 예약 걱정 없이 다양한 기능으로 실시간 예약 업무를 지원합니다.
    </p>
    </div>
    <div class="sline">
    <a href="/main/demo_main" class="ct-btn blue large cfont_light">실시간 체험 하기</a>
    </div>
     
    <section id="sec1" class="bmt-section bmt-section--no-border">
    <div class="pt1">
    <p class="title_large">XE 예약 모듈의 특징</p>
    </div>
    <div class="pt2 ">
    <p class="p2_desc_text btm20">저렴한 비용으로 스마트한 실시간 예약 관리가 가능합니다.</p>
    <ul class="btm_list">
          <li class="btm_item">
            <img src="/images/introduction/ft01.png" class="btm_image">
            <h4 class="btm_head">모바일 완벽한 예약 지원</h4>
            <p class="btm_desc">모바일에 최적화된 예약 스킨 기능
               
모바일에서 카드 결제 및 예약,확인,취소</p>
          </li>
          <li class="btm_item">
            <img src="/images/introduction/ft02.png" class="btm_image">
            <h4 class="btm_head">친숙한 사용성</h4>
            <p class="btm_desc">누구라도 손쉽게 예약 가능한 
               
친숙함으로 고객에게 편리한 사용성 제공</p>
          </li>
          <li class="btm_item">
            <img src="/images/introduction/ft03.png" class="btm_image">
            <h4 class="btm_head">저렴한 운영 비용</h4>
            <p class="btm_desc">수수료,월,년간 이용료가 없는,
               
단한번 구매로 평생 소유형 솔루션</p>
          </li>
        </ul>
 
    </div>
    </section>
     
    <section class="bmt-section ">
    <div class="pt1">
    <p class="title_large">XE 예약 모듈 고객 서비스</p>
    </div>
    <div class="pt2">
    <p class="p2_desc_text">구입 부터 구입후 지원까지 빈틈 없는 서비스</p>
    </div>
 
    <div class="ss_left"  id="startdiv">
    <p class="ss_title">무료 업그레이드</p>
    <p class="ss_desc">고객님들의 건의 사항,기능 추가 업데이트를 꾸준하게 하고 있습니다.
 
    최근 1년 약 20 차례의 버전 올림과 수십 가지의 기능 개선등이 이루어 졌습니다.
 
    </p>
 
    <p class="ss_title mgt30">커스터 마이징 기술 지원</p>
    <p class="ss_desc">구매 고객사 대상으로 각 업체의 요청시 업체 특성에 맞게 스킨 수정 하실 수 있도록,
필요한 기술 지원을 해드리고 있습니다.
    </p>
 
    </div>
 
    <div class="ss_right">
    <img src="/images/introduction/ss01.png">
    </div>
 
    </section>
 
    <section class="bmt-section" id="sec4">
    <div class="pt1" >
    <p class="title_large">XE 예약 모듈의 기능 개요</p>
    </div>
    <div class="pt2 btm20">
    <p class="p2_desc_text">예약 업체에 최적화된 기능을 제공합니다.</p>
    </div>
 
 
    <ul id="ullist">
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/skins2.png"  class="btm2_image">
    <h4 class="btm2_head">다양한 스킨 </h4>
    <p class="btm2_desc">누구라도 손쉽게 예약 가능한 사용자 환경으로 제작된 스킨들이 제공
     
펜션,캠핑장,리조트,호텔,게스트하우스,병원,미용실등 다양한 업종에서 활용 가능합니다.</p>
    </li>
 
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/sms.png" class="btm2_image">
    <h4 class="btm2_head">문자 메세지</h4>
    <p class="btm2_desc">예약 현황에 따라 자동으로 사용자,관리자에게 발송되는 SMS 서비스
 
    자동 발송 이외에도 고객에게 직접 관리자가 메세지를 발송 가능합니다.    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/pg.png" class="btm2_image">
    <h4 class="btm2_head">PG(카드 결제) 지원</h4>
    <p class="btm2_desc">LG U+,NHN KCP,이니시스,카카오페이등 다양한 PG를 지원
 
    PC,모바일 웹표준 결제를 완벽하게 지원합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/unlimhome.png" class="btm2_image">
    <h4 class="btm2_head">무제한 객실</h4>
    <p class="btm2_desc">객실을 제한 없이 추가할 수 있습니다.
 
    추후 객실 확장을 하셔도 걱정하지 마세요. 제한 없이 객실을 추가 가능합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/clock.png" class="btm2_image">
    <h4 class="btm2_head">자동 취소</h4>
    <p class="btm2_desc">예약만 하고 결제하지 않는 노쇼(No Show) 방지
 
    2중의 입금 안내,자동 취소 기능을 지원합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/cal.png" class="btm2_image">
    <h4 class="btm2_head">다중 성수기</h4>
    <p class="btm2_desc">여러 기간의 다중 성수기 기능을 지원
 
    봄,여름,가을,겨울,휴가 기간등 다양한 성수기 할증 / 할인 설정이 가능합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/setday.png" class="btm2_image">
    <h4 class="btm2_head">영업일 설정</h4>
    <p class="btm2_desc">영업일 지정,업체 휴일 지정 가능
 
    주간 요일별,지정 기간,오늘로 부터 몇일만 예약 가능하며 업체 휴일 지정이 가능합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/dateset.png" class="btm2_image">
    <h4 class="btm2_head">특정일 할증</h4>
    <p class="btm2_desc">지정일 설정 기능
 
    성수기 이외에 특별한 하루,명절등의 지정일에 할증/할인 지원 합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/longdaydiscount.png" class="btm2_image">
    <h4 class="btm2_head">연박 할인</h4>
    <p class="btm2_desc">연박시 할인 기능
 
    2박이상 예약시 각 객실별로 할인 설정이 가능합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/options.png" class="btm2_image">
    <h4 class="btm2_head">추가 옵션 판매</h4>
    <p class="btm2_desc">예약시 상품 판매 가능
 
    바베큐,조식,침구류등의 추가 옵션 상품을 예약 단계에서 추가할 수 있습니다.
    </p>
    </li>
 
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/mileage.png" class="btm2_image">
    <h4 class="btm2_head">회원 마일리지</h4>
    <p class="btm2_desc">예약 고객의 마일리지 적립
 
    단골 예약 고객을 만들어 보세요. 다양한 조건의 마일리지 적립 / 사용 기능이 있습니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/notification.png" class="btm2_image">
    <h4 class="btm2_head">고객 문의 알림</h4>
    <p class="btm2_desc">고객님을 놓치지 마세요.
 
    게시판에 문의/답변을 남길 경우 실시간으로 사용자/관리자에게 실시간 문자 알림을 보냅니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/mxls.png" class="btm2_image">
    <h4 class="btm2_head">엑셀 변환</h4>
    <p class="btm2_desc">예약 현환 엑셀 변환 지원
 
    별도의 고객,예약 데이터 베이스 구축을 위한 예약현황 엑셀 데이터 추출을 지원합니다.
    </p>
    </li>
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/setting.png" class="btm2_image">
    <h4 class="btm2_head">편리한 관리자</h4>
    <p class="btm2_desc">다양한 기능의 관리자 기능
 
    달력형 예약 현황,관리자 전용 메모등 예약 업무를 편하게 볼 수 있도록 도와드립니다.
    </p>
    </li>
 
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/seo.png" class="btm2_image">
    <h4 class="btm2_head">검색 최적화</h4>
    <p class="btm2_desc">SEO 최적화 기능
 
    XE의 SEO 모듈을 통해 네이버,구글등 검색 노출에 최적화된 사이트 구축이 가능합니다.
    </p>
    </li>
 
 
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/skins.png"  class="btm2_image">
    <h4 class="btm2_head">XE 기반의 확장성</h4>
    <p class="btm2_desc">추가 기능은 언제든 설치 가능
     
수백가지의 디자인 레이아웃,애드온,모듈을 통해 손 쉽게 개성있는 사이트 구축이 가능합니다.</p>
    </li>
 
 
 
    <li class="btm2_item noshow">
    <img src="/images/introduction/icons/server.png"  class="btm2_image">
    <h4 class="btm2_head">오픈 소스</h4>
    <p class="btm2_desc">사용자 예약 스킨,관리자 템플릿 소스를 100% 공개
     
업체 환경에 맞게 언제든 커스터 마이징 작업이 가능합니다.</p>
    </li>
 </ul>
 </section>
    </div>

<script>
var startHeightMin=788; //트리거 시작 스크롤 위치
var itemHeight=100; // 아이템별 높이
var itemMax=0; //현재 표시 아이템수
var itemLimit=0; // 모든 아이템 수
jQuery(window).scroll(function() {
	if ($(window).scrollTop() >= $(document).height() - $(window).height() - 10); 

itemLimit=jQuery('.btm2_item').length; // 모든 아이템수 btm2_item css class 가 표시될 객채 li
if(itemMax > itemLimit){ //표시 아이템 수가 모든 아이템수보다 높으면 작동 하지 말아야..
    return;
}
cehcksc();
});
 
function cehcksc(){
//#startdiv 는 해당 객채를 지나가면 작동을 한다 알맞게 변경 (트리거)
    if (jQuery(window).scrollTop() >= ((jQuery(document).height() - jQuery(window).height()) - jQuery('#startdiv').innerHeight())-100) {
          //console.log(jQuery(window).scrollTop()); // startHeightMin 찾기
        var docHeight=jQuery(window).scrollTop() - startHeightMin;
        var itemLength=Math.floor(docHeight/itemHeight); // 스크롤 위치에서 시작 스크롤 위치를 -,출력할 아이템수를 설정
        if(itemMax<itemLength){ // 수가 낮아 졌을때는 표시 안함
            itemMax=itemLength; // itemMax 갱신
            jQuery('.btm2_item').each(function(index,item){ //btm2_item
                if((itemMax-1) >= index){
                    if(jQuery(this).css("display") == "none"){
                        jQuery(this).fadeIn(2000);
                    }
                }
            });
        }
         
      }
}
</script>

</body>
</html>