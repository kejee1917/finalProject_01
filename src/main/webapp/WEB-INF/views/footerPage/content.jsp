<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/footer/content.css?after" type="text/css">


</head>
<body>

<div class="contianer" style="padding-left: 11%; padding-right: 11%; height: auto;">
<div class="cs-header-box">
	<br>
	<h3 class="cs-header-text" style="font-size: 25px;"><i class="far fa-arrow-alt-circle-right"></i>&nbsp;<b>CONTACT</b></h3>
</div>
	
	<br><br>
	<div id="map"></div>
	<div class="content">
		<h1 class="content_h1">VISIT US</h1>
		<h5 class="content_top">(주)셰어 베르니</h5>
		<h5 class="content_h5">사무실 : 서울특별시 마포구 백범로 23 </h5>
		<h5 class="content_middle">물류센터 : 서울특별시 마포구 백범로 24 </h5>
		<h5 class="content_h5">평일 오전 10시 - 오후 6시 (점심시간 오후 1시 30분 - 2시 30분)</h5>
		<h5 class="content_h5">토요일 / 일요일 / 공휴일 휴무</h5>
	</div>
	<div class="content">
		<h1 class="content_touch">GET IN TOUCH</h1>
		
		<table>
			<col width="85px;"><col width="200px;">
			<tr>
				<th><h4 class="content_top">이메일문의 : </h4></th>
				<td>
					<a href="mailto:verni@verni.com" class="content_a" style="color: #9E9AA2;">verni@verni.com
						<span class="material-icons">mail</span>

					</a>
				</td>
			</tr>
			<tr>
				<th><h4>전화문의 &nbsp;&nbsp;&nbsp;&nbsp;: </h4></th>
				<td>
					<a href="tel:777-7777" class="content_a" style="color: #9E9AA2;">777-7777&nbsp;&nbsp;(모바일전용)
						<span class="material-icons">phone_enabled</span>
					</a> 
				</td>
			</tr>
		</table>
		<br>
		<!-- Go to www.addthis.com/dashboard to customize your tools -->
        <div class="addthis_inline_share_toolbox_n5ul"></div>
	</div>

		
		
		
		
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec1a373c079b73203c524cc7796a6af9"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.552456467555096, 126.93782740064088), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.552456467555096, 126.93782740064088); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>



</body>
</html>