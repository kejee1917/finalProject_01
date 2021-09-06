<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="java.util.List"%>
<%@page import="verni.co.kr.wish.WishDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<WishDto> list =(List)request.getAttribute("list"); 
%>    


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
.img-wrap{
   position: relative;
   width: 100px; 
   height: 100px;
   /* margin: auto; */
}

.wish_img{
   width: 100%;
   vertical-align: middle;
}

.img-text{
   text-align: center;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate( -50%, -50% );
   
}

.img-text p{
   color: white;
   font-size: 15px;
}
</style>


<div class="contianer"   style="width: auto; height: auto; padding-left: 20%; padding-right: 20%; padding-top: 15px;"><br>
      <h5>
         <strong style="font-size: 20px"><i class="fas fa-heart"></i>&nbsp;찜한 상품</strong>&nbsp;&nbsp; 최근 찜한 상품 내역이 제공됩니다.
      </h5>
   <br><br>
   <%
   if (list == null || list.size() == 0) {
   %>
   <br><br><br><br>
   <h2 align="center"><img src="./image/detail/zzim.png" width="60px"><br><br>
      찜한 상품이 없습니다.</h2>
      <h5 align="center" style="color: gray">관심있는 상품을 찜해두면</h5>
      <h5 align="center" style="color: gray">편하게 확인하고 관리할 수 있습니다.</h5>   
   
   <%
   } else {
   %>
   <div align="center">
      <table>
            <col width="30px">
            <col width="850px">
            <tr>
               <td colspan="2"><hr style="background-color: #2E4D58; height: 2px;"></td>
            </tr>
            <tr>
               <td><input type="checkbox" name="checkAll"
                  id="checkAll"></td>
               <td>
                  <button type="button" onclick="wishCheckDel()" class="wish" style="font-size: 13px">선택
                     삭제</button>
               </td>
            </tr>
            <tr>
               <td colspan="2"><hr style="background-color: #2E4D58; "></td>
            </tr>
         </table>
         <div>
            <%
            for (int i = 0; i < list.size(); i++) {
               WishDto ws = list.get(i);
            %>
            <div align="center">

               <table>
                  <col width="30px">
                  <col width="200px">
                  <col width="600px">
                  <col width="50px">

                  <tr>
                     <td><input type="hidden" class="w_no"
                        value="<%=ws.getW_no()%>"> <input type="checkbox"
                        name="check" class="checkbox"></td>
                        <%if(ws.getP_status().equals("대여중")){ %>
                     <td><div class="img-wrap"><div class="cart-img"><a href="productDetail.do?p_no=<%=ws.getP_no()%>">
                              <img alt="" src="./upload/thumbnailImage/<%=ws.getP_newimage1()%>" width="100px" height="100px" style="position: relative; object-fit: fill; -webkit-filter: grayscale(100%); filter: gray;"/></a>
                              </div><div class="img-text"><p>대여중</p></div></td>
                        <%}else{ %>
                        <td><a href="productDetail.do?p_no=<%=ws.getP_no()%>"><img alt="" src="./upload/thumbnailImage/<%=ws.getP_newimage1()%>" width="100px" height="100px" /></a></td>
                        
                        <%} %>      
                     <td>
                     <h3>[<%=ProductUtil.brandName(ws.getP_brand())%>]</h3>
                        <a href="productDetail.do?p_no=<%=ws.getP_no()%>" style="font-size: 13px;"><%=ws.getP_name()%></a></td>
                     <td><button type="button"
                           onclick="wishDel(<%=ws.getW_no()%>)" class="wish">
                           <i class="fas fa-trash-alt" style="font-size: 13px;"></i>
                        </button>
                        <br></td>
                  </tr>
                  <tr>
                     <td colspan="4"><hr style="background-color: #2E4D58;"></td>
                  <tr>
               </table>
            </div>


            <%   }
         }%>
         </div>
      </div>
   </div>
   <div style="height: 250px;"></div>
<script>

$(document).ready(function() {
   
   $("#checkAll").click(function() {
      if($("#checkAll").prop("checked")) {
         $(".checkbox").prop("checked", true);
      }else {
         $(".checkbox").prop("checked", false);
      }
   });
   $(".checkbox").click(function () {
      if($("input[name='check']:checked").length == <%=list.size() %>) {
         $("#checkAll").prop("checked", true);
      }else {
         $("#checkAll").prop("checked", false);
      }
   });
});

function wishDel(w_no) {
   
   if(confirm("찜 상품을 삭제하시겠습니까?")) {
      
      $.ajax({
         url:"wishDel.do",
         type:"post",
         data:{"w_no":w_no},
         success:function(data) {
            if(data == true) {
               alert('상품이 삭제되었습니다');
               location.href='wishList.do';
            }else {
               alert('삭제 실패');
               return;
            }
         },
         error:function() {
            alert('엄지 wishDel 에러');
         }
      });
   }
}
// 선택삭제
// 전체삭제
function wishCheckDel() {
   
   let w_no = 0;
   let no = "";
   let count = $(".checkbox").length;
   
      for (var i = 0; i < count; i++) {  
         if ($(".checkbox")[i].checked == true) {
            w_no = $(".w_no").eq(i).val();
            no += w_no + ",";
         }
      }
      no = no.substring(0, no.lastIndexOf(","));
      if(no == ''){
         alert('선택된 상품이 없습니다.');
         return;
      }else{
         location.href="deleteWish.do?no=" + no;
      }
}


</script>




</body>
</html>