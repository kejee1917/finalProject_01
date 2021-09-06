<!--  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
response.sendRedirect("main.do");
%> --%>
</body>
</html>
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>베르니 대문</title>
<!-- Page hiding snippet (recommended) -->
<style>.async-hide { opacity: 0 !important} </style>
  </head>
  <body>
 <div class="static-page">
 <div class="wrap">
<style type="text/css">
div.static-page div.wrap {
        width: auto;
        left: auto;
        margin-left: 0;
    }
/* CSS RESET */
* {
    padding: 0;
    border: 0;
    margin: 0;
}
a {text-decoration: none;}
li {list-style: none;}

    .rentit-guide-landing .inner {
        width: 1180px;
        margin: 0 auto;
    }



/*======================
       블랙배경 영역
======================*/
    .rentit-guide-landing .rentit-guide-bkbg {background-color: #000;}
    .rentit-guide-landing .rentit-guide-bkbg .bkbg-sub-txt {
        color: #fff;
        font-size: 32px;
        font-weight: 100;
        padding: 30px 0;
    }

/*======================
      #animate 영역
======================*/

    .rentit-guide-landing .rentit-guide-ani {
        height: 1080px;
        overflow: hidden;
        background-image: url("https://cdn.reebonzkorea.co.kr/uploads/ckeditor/pictures/310863/02_bg-img_pc.png");
        background-size: 100% auto;
        animation: y-scroll 15s ease-in-out infinite;
        background-position: 0 0;
    }
    .rentit-guide-landing #aniSlider{
        height: 1080px;
    }
    #aniSlider .swiper-slide {
        box-sizing: border-box;
        padding-top: calc(1080px/2 - 60px);
        text-align: center;
        font-size: 40px;
        font-weight: 100;
        color: #000;
    }
    #aniSlider .swiper-slide > span {
        font-weight: bold;
        color: rgb(29, 29, 153);
    }
    #aniSlider .swiper-slide > strong {
    	font-size: 50px;
        font-weight: bold;
        color: black;
    }
    @keyframes y-scroll {
        0% {background-position: 0 0;}
        100% {background-position: 0 100%;}
    }
</style>

<div class="rentit-guide-landing"><!-- 지우지마염 -->

<!--헤더 영역-->

<!--블랙배경 영역-->

<div class="rentit-guide-bkbg">
<div class="inner" align="center">
<p class="bkbg-sub-txt">명품, 이제 <strong>베르니</strong>에서 마음껏 써 보세요.</p>
</div>
</div>
<!--#animate 영역-->

<div class="rentit-guide-ani">
<div class="inner">
<div class="swiper-container" id="aniSlider">
<div class="swiper-wrapper">
<div class="swiper-slide"><a href="main.do" style="color: black; text-decoration: none;"><strong>베르니</strong>입장하기</a></div>
</div>
</div>
</div>
</div>


<script src="/assets/jquery.js?body=1" type="text/javascript"></script><script>
    $('document').ready(function(){
        var _topAreaOffset = $(".rentit-guide-hd").offset().top;
        var _reviewAreaOffset = $(".rentit-review").offset().top;
        var _scrollBreak = false;
        var slider_name = "#aniSlider"; //애니메이트
        new Swiper(slider_name, {
            direction: "vertical",
            speed: 800,
            pagination: {
            el: ".swiper-pagination",
            clickable: true
            },
            mousewheel: {
            releaseOnEdges: true
            },
           on: {
                slideChangeTransitionStart: function(){
                    if(!_scrollBreak){
                        $('html, body').animate({scrollTop: $("#aniSlider").offset().top}, 1000);
                        _scrollBreak = true;
                    }
                },
            }
        });

        new Swiper("#stylingSwiper", {
        loop: true, //슬라이더가 끝으로 간 후 다시 처음으로 이어지는 설정값.
        autoplay: {
            delay: 2000,
        },
        autoHeight: false, //각 슬라이더가 높이값이 다를경우 true로 설정.
        simulateTouch: true, //터치로 슬라이딩 가능 여부 설정값.
        slidesPerView: 6.6, //멀티로 보여질경우 필요. (한번에 얼만큼 보이느냐 3개면 => 3)
        centeredSlides: true, //멀티로 보여질경우 필요. (가운데 정렬)

           },
      });
        function numberAppend(d) {
          return (d < 10) ? '0' + d.toString() : d.toString();
        }

    });
</script>
    </div>
  </div>




  </div>




</body>
</html>