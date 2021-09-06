<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<%

ReviewDto updto = (ReviewDto)request.getAttribute("updto");
ReviewDto downdto = (ReviewDto)request.getAttribute("downdto");
//System.out.println(updto.toString());
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/popup/radio_button.css"
   type="text/css">


<style type="text/css">
* {
   font-family: Pretendard-Regular;
   margin: 0px;
}
.fas fa-star {font-size:0; letter-spacing:-4px;}
.fas fa-star a {
    font-size:35px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.fas fa-star a:first-child {margin-left:0;}
.fas fa-star a.on {color:#DAA520;}


.ec-base-box {
   padding: 20px;
   margin-left: auto;
   margin-right: auto;
   border: 5px solid #e8e8e8;
   color: #404040;
   background-color: #f8f8f8;
}

.ec-base-box.typeThin {
   border-width: 1px;
   border-color: #d7d5d5;
   background-color: #f8f8f8;
}

</style>
</head>
<body>



<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
작성한 리뷰
</div>
   

      <!-- 상품 땡겨오기 -->
   <div align="center" style="padding-top: 10px;" class="container">
      <table>
         <col width="50px">
         <col width="300px">
         <tr>
            <td><img alt=""
               src="./upload/thumbnailImage/${updto.p_newimage1}" width="100px" /></td>
            <td style="padding-left: 10px;"><c:set var="p_brand"
                  value="${updto.p_brand}" /> <c:choose>
                  <c:when test="${fn:contains(p_brand, '_')}">
                     <c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
                  </c:when>
                  <c:when test="${fn:contains(p_brand, '-')}">
                     <c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
                  </c:when>
               </c:choose>
               <h3>[${p_brand}]</h3>
               <h5>${updto.p_name}</h5>
            </td>
         </tr>
      </table>
   </div>
      

   
      <div align="center" style="padding-top: 10px;">
         <hr style="color: #f8f8f8;">
     </div>
     
      <div align="center">
      <br>
      <h3>상품은 만족하셨나요?</h3>
      </div>
      <div align="center" style="font-size: 25px;">
            <c:choose>
             <c:when test="${updto.r_scope eq 1 }">
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
             </c:when>
             
             <c:when test="${updto.r_scope eq 2 }">
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
             </c:when>
             
             <c:when test="${updto.r_scope eq 3 }">
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
             </c:when>
             
             <c:when test="${updto.r_scope eq 4 }">
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: lightgrey"></i>
             </c:when>
             
             <c:when test="${updto.r_scope eq 5 }">
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
               <i class="fas fa-star" style="color: #DAA520"></i>
             </c:when>
             
         </c:choose>
      </div>
      <br><br>

     <div class="ec-base-box typeThin" style="clear: both;">
        <%
      if(updto.getR_newfilename() == null) {  //사진 없으면~
      %>
         
      <%   
      }else {
      %>
      
      <%   System.out.println(updto.getR_newfilename());
         String image[] =  updto.getR_newfilename().split(",");
         for(int i=0; i<image.length; i++){
            if(! (image[i].equals("") || image.length == 0)){
               System.out.println(image[i]);
            //System.out.println(image[i]);
      %>
          
         <img src="./upload/reviewImage/<%=image[i]%>" width="100px" height="100px"/>
       
       <%}
       } 
      }
       %>
      <br>
         ${updto.r_content}
      </div>

      <br>
      <div align="center" style="padding-top: 10px;">
         <hr style="background-color: #f8f8f8;">
      </div>
      
      <div align="left"
         style="padding-top: 10px; font-size: 12px; padding-left: 15px; padding-right: 15px; color: gray;">
         <i class="fas fa-exclamation-circle"></i>&nbsp;상품과 무관한 글/사진을 작성한 리뷰는 통보없이 삭제 및 적립 혜택이 회수됩니다.
      </div>
      <br>
      

<%if(updto.getR_status().equals("답변완료")) {
%>

<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
판매자 답글
</div>

<div class="ec-base-box typeThin" style="clear: both; margin-top: 15px;">
   <div style="font-weight: bold;" align="right"><%=MypageUtil.formDate2(downdto.getRp_wdate()) %> </div>
   <div>${downdto.rp_content}</div>
</div>

<br><br>
<div align="center">
<input type="button" class="btnSubmit" value="수정" onclick="updateClick()">&nbsp;
<input type="button" class="btnEm" value="삭제" onclick="deleteClick()">
</div>
<%   
}else {
%>
<div align="center">
<input type="button" class="btnSubmit" value="수정" onclick="updateClick()">&nbsp;
<input type="button" class="btnEm" value="삭제" onclick="deleteClick()">
</div>
<%   
}
%>


</body>


<script type="text/javascript">
function updateClick() {
   location.href = "myreviewUpdate.do?r_no=" + ${updto.r_no};
   
}

function deleteClick() {
   if(confirm("정말 삭제하시겠습니까?") == true) { //alert창으로 한번 더 확인 절차
      location.href = "myreviewDelete.do?r_no=" + ${updto.r_no};
   }else {
      return;
   }   
}



</script>


</html>