<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#background {
   height: 40%;
   width: 70%;
   background-color: #F8F8F8; /* #E0ECE4; */ /*E6E2DC*//* FCF2E9 #ECFAFB*/
}

.user-status-info {
  display: block;
  margin-bottom: 5%;
  overflow: hidden;
  text-align: center;
}
.user-status-info li {
  display: inline-block;
  vertical-align: middle;
  min-width: 140px;
  cursor: default;
}
.user-status-info li .icon-wrap {
  display: inline-block;
  margin-right: 8px;
  line-height: 2;
  text-align: center;
  vertical-align: middle;
}
.user-status-info li span {
  vertical-align: bottom;
  font-size: 36px;
  font-weight: 300;
  color: #231f20;
}

.user-status-info{
  padding-top: 5%;
  padding-right: 5%;   
}

.user-order-info {
  padding-left: 20%;
  padding-bottom: 3%;
}
.user-order-info span {
  display: inline-block;
}
.user-order-info span:first-child {
  position: relative;
  min-width: 222px;
  font-size: 18px;
}

.user-order-info span + p {
  margin: 5% 0 1%;
}
.user-order-info p {
  font-size: 12px;
  color: #666;
}
.home-a {
  color: black;
  font-size: 15px;
}
.totalcount {
	margin-left: 18%
}
</style>

</head>
<body>

<div id="background">
<ul class="user-status-info">
   <li>
       <a href="myorder.do" class="home-a">
         <div class="icon-wrap">
           배송중<br>
           <img alt="My-btn-delivery" src="https://cdn.reebonzkorea.co.kr/assets/mypage/my-btn-delivery-cfe26762b78cf83a3e601cf866169129.png" />
         </div>
         <span class="num">${deliveryCount }</span>
       </a>
     </li>
     <li>
       <a href="myqna.do" class="home-a">
         <div class="icon-wrap">
           1:1문의 답글<br>
           <img alt="My-btn-faq" src="https://cdn.reebonzkorea.co.kr/assets/mypage/my-btn-faq-4376e083931958a73fb49d4c54899cde.png" />
         </div>
         <span class="num">${answerCount }</span>
       </a>
     </li>
     <li>
       <a href="mycoupon.do" class="home-a">
         <div class="icon-wrap">
           쿠폰<br>
           <img alt="My-btn-coupon" src="https://cdn.reebonzkorea.co.kr/assets/mypage/my-btn-coupon-9959a712565d8ba7ff873bc2b47f815e.png" />
         </div>
         <span class="num">${couponCount}</span>
       </a>
     </li>
     <li>
       <a href="mypoint.do" class="home-a">
         <div class="icon-wrap">
           포인트<br>
           <img alt="My-btn-cash" src="https://cdn.reebonzkorea.co.kr/assets/mypage/my-btn-cash-d0785f62cc5b7c1493b55c45f9c2cec5.png" />
         </div>
         <span class="num">${pointCount}</span>
       </a>
     </li>   
</ul>
   <div class="user-order-info">
       <span class="totalcount">총 구매 금액 (결제 금액) ${totalpayCount }원</span>
       <p>- 실 결제 금액은 전산상의 총 금액(배송비 포함)입니다.</p>
       <p>- 등급에 따른 다양한 혜택은 승급 기준에 충족될 시, 바로 적용되며 자세한 내용은 아래 이미지를 참고하여 주십시오.</p>
   </div>
</div>

<br>

<div>
<img alt="" src="image/mypage/membership.png" width="70%">




</div>

</body>
</html>