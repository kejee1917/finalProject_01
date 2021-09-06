<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.order.OrderDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="verni.co.kr.util.CalendarUtil"%>
<%@page import="verni.co.kr.mycalendar.MycalendarParamDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
List<OrderDetailDto> list = (List<OrderDetailDto>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
  
<style>
.cal-table {
    border-collapse: collapse;    
}

.cal-table {
    font-weight: bold;
    font-size: 14px;
}
.today {
   color: black; 
   text-align: left;
   vertical-align: top;
   padding-left: 6px;
   padding-top: 4px;
   background-color: #F8F8F8;
}
.sunday{
   color: #FA8072; 
   text-align: left;
   vertical-align: top;
   padding-left: 6px;
   padding-top: 4px;
   background-color: #F8F8F8;
}
.satday{
   color: #6E85B2; 
   text-align: left;
   vertical-align: top;
   padding-left: 6px;
   padding-top: 4px;
   background-color: #F8F8F8;
}
.otherday{
   color: black; 
   background-color: #F8F8F8;
   text-align: left;
   vertical-align: top;   
   padding-left: 6px;
   padding-top: 4px;   
}
.days2{
   font-size:20px;
   color: #4D6BB3; 
   vertical-align: middle;
}
.days3{
   font-size:16px;
   text-align: center;
   vertical-align: middle;
   background-color:#797A7E ; color:#FFFFFF; line-height:1.7em; font-weight:normal;
}
.innerTr1 {
   padding-top: 10px;
}
.innerTd2 {
   margin-top: 10px;
}
.innerTable1 {
   border-bottom: 3px solid;
   margin-bottom: 3px;
}
.innerTable2{
   /* border: 1px solid; */
}
.nodays{
   background-color: #F8F8F8;
}

.arrow {
   width: 30px;
   height: 30px;
}

.enddate:hover{
   cursor: pointer;
}
.startdate:hover{
   cursor: pointer;
}

.modal-table-content{
   border-bottom: 1px solid #ccc;
   padding-top: 10px;
   padding-bottom: 10px;
   font-size: 15px;
}

.modal-table-title{
   border-bottom: 1px solid #ccc;
   padding-top: 10px;
   padding-bottom: 10px;
   text-align: center;
   font-size: 15px;
}


/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #ccc;
width: 30%; /* Could be more or less, depending on screen size */
}

</style>



</head>
<body>


<%
MycalendarParamDto cal = (MycalendarParamDto)request.getAttribute("cal");

int year = cal.getYear();
int month = cal.getMonth();
int day = cal.getDay();
int dayOfWeek = cal.getDayOfWeek(); //시작하는 요일 1: 일요일
int lastDayOfMonth = cal.getLastDay();
//System.out.println(day);
// << year--
String pp = String.format("<a href='%s?year=%d&month=%d'><img class='arrow' src='image/mypage/left.png'></a>", 
                         "mypageCal.do", year-1, month);

// < month-- 
String p = String.format("<a href='%s?year=%d&month=%d'><img class='arrow' src='image/mypage/prec.png'></a>", 
                         "mypageCal.do", year, month-1);

// > month++
String n = String.format("<a href='%s?year=%d&month=%d'><img class='arrow' src='image/mypage/next.png'></a>", 
                         "mypageCal.do", year, month+1);

// >> year++
String nn = String.format("<a href='%s?year=%d&month=%d'><img class='arrow' src='image/mypage/last.png'></a>", 
                         "mypageCal.do", year+1, month);

%>

<h1 style="margin-top: 2%">나의 대여 관리</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<div class="box_border" style="margin-top: 1px; margin-bottom: 10px">

<table class="cal-table" style="width: 70%; margin-top: 2%">
<col width="100px">
<col width="100px">
<col width="100px">
<col width="100px">
<col width="100px">
<col width="100px">
<col width="100px">

<thead>
   <tr height="60px">
      <td class="days2" colspan="7" style="padding-left: 28%">
         <%=pp %><%=p %>
         <font color="#0F2620" style="font-size: 32px; font-weight: bold; padding-left: 5%; padding-right: 5%">
            <%=String.format("%d년&nbsp;%d월", year, month) %>
         </font>         
         <%=n %><%=nn %>
      </td>
   </tr>
   
   <tr height="50px">
      <th class="days3">일</th>
      <th class="days3">월</th>
      <th class="days3">화</th>
      <th class="days3">수</th>
      <th class="days3">목</th>
      <th class="days3">금</th>
      <th class="days3">토</th>
   </tr>
</thead>

<tbody>

<tr height="110px">
<%
for(int i = 1; i < dayOfWeek; i++){
   out.println("<td class='nodays'>&nbsp;</td>");
}

for(int i = 1; i <= lastDayOfMonth; i++){
   
   if( (i + dayOfWeek - 1) % 7 == 1){   // 일요일      
      %>
      <td class="sunday">
         <%=CalendarUtil.callist(year, month, i) %>
         <%=CalendarUtil.makeTable(year, month, i, list) %> 
      </td>
      <%
   }else if ((i + dayOfWeek - 1) % 7 == 0) {  // 토요일
      %>
      <td class="satday">
         <%=CalendarUtil.callist(year, month, i) %>
         <%=CalendarUtil.makeTable(year, month, i, list) %> 
      </td>
      <%
   }else if (i == day) {
      %>
      <td class="today">
         <div id="todaybox"><%=CalendarUtil.callist(year, month, i) %></div>
         <%=CalendarUtil.makeTable(year, month, i, list) %> 
      </td>
      <%   
   }
   else{// 평일
      %>
      <td class="otherday">
         <%=CalendarUtil.callist(year, month, i) %>
         <%=CalendarUtil.makeTable(year, month, i, list) %> 
      </td>
      <%      
   }
   
   if((i + dayOfWeek - 1) % 7 == 0 && i != lastDayOfMonth){
      %>   
      </tr><tr height="110px">
      <%
   }
}

for(int i = 0;i < (7 - (dayOfWeek + lastDayOfMonth - 1 )% 7)% 7 ; i++){
   out.println("<td class='nodays'>&nbsp;</td>");
}
%>
</tr>

</tbody>

</table>
</div>


<%

if(list != null && list.size() != 0) {
for(int i = 0; i < list.size(); i ++) {
   OrderDetailDto dto = list.get(i);
%>
   <div id="modal<%=dto.getOd_no() %>" class="searchModal">
      <div class="search-modal-content">
         <div class="page-header">
            <div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
			대여 세부 사항
			</div>
         </div>
            <div class="row">
               <div class="col-sm-12">
                  <div class="row">
                     <div class="col-sm-12">
                     <table class="modal-table">
                     <col width="230px"><col width="140px"><col width="160px">
                     <tr>
                        <th class="modal-table-title">주문번호</th>
                        <td class="modal-table-content" colspan="2"><%=dto.getO_number() %></td>
                     </tr>
                     <tr>
                        <th class="modal-table-title">상품정보</th>
                        <td class="modal-table-content">
                        <img alt="" src="./upload/thumbnailImage/<%=dto.getP_newimage1() %>" style="width:130px; height: 130px; object-fit: fill;">
                         </td>
                         <td class="modal-table-content"><a href="productDetail.do?p_no=<%=dto.getP_no()%>">[<%=ProductUtil.brandName(dto.getP_brand())%>] <br> <%=dto.getP_name() %></a></td>
                     </tr>
                     <tr>
                        <th class="modal-table-title">구매금액</th>
                        <td class="modal-table-content" colspan="2"><%=dto.getOd_amount() %> 원</td>
                     </tr>
                     <tr>
                        <th class="modal-table-title">대여시작일</th>
                        <td class="modal-table-content" colspan="2"><%=dto.getOd_startdate()%></td>
                     </tr>
                     <tr>
                        <th class="modal-table-title">대여종료일</th>
                        <td class="modal-table-content" colspan="2"><%=dto.getOd_enddate()%></td>
                     </tr>
                     <tr>
                        <th class="modal-table-title">보험가입</th>
                        
                        <%if(dto.getOd_as().equals("0")) {
                        %>
                           <td class="modal-table-content" colspan="2">가입안함</td>
                           
                        <%
                        }else if(dto.getOd_as().equals("10000")) {
                        %>
                           <td class="modal-table-content" colspan="2">1회성 전용 50%</td>
                        <%   
                        }else if(dto.getOd_as().equals("20000")) {
                        %>
                           <td class="modal-table-content" colspan="2">1회성 전용 100%</td>
                        <%   
                        }
                        %>
                        
                     </tr>
                     
                     </table>
                     </div>
                  </div>
               </div>
            </div>
            <hr>
            <div style="cursor:pointer;background-color:#0F2620; text-align: center; padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
            <span class="pop_bt modalCloseBtn" style="font-size: 13pt; color: white;">닫기</span>
         </div>
      </div>
   </div>
<%   
}
}
%>




<div id="modal2" class="searchModal">
	<div class="search-modal-content">
			<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
			반납 방법
			</div>
			<img alt="" src="image/mypage/delivery01.png" width="100%">
			<hr>
			<div style="cursor:pointer;background-color:#0F2620; text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
			<span class="pop_bt modalCloseBtn" style="font-size: 13pt; color: white;">닫기</span>
		</div>
	</div>
</div>



<script type="text/javascript">
function func(odno) {
   $("#modal"+ odno).show();
}
function funcimage() {
	$("#modal2").show();	
}

function closeModal() {
   $('.searchModal').hide();
};

function mouseOver(n) {
   $(".startdate"+ n).css("background-color", "#F5E8C7");
   $(".enddate"+ n).css("background-color", "#F5E8C7");
}
function mouseOut(n) {
   $(".startdate"+ n).css("background-color", "#F8F8F8");
   $(".enddate"+ n).css("background-color", "#F8F8F8");
   //$(".today").css("background-color", "#8A989A");
}
</script>




</body>
</html>