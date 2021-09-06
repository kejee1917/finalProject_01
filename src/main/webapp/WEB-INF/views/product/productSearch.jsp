<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>  
<link rel="stylesheet" href="./css/productList/checkbox_button.css" type="text/css"> 
 
<%
String p_type1 = request.getParameter("p_type1");
String [] p_type2 = request.getParameterValues("p_type2");
String [] p_brand = request.getParameterValues("p_brand");
String [] p_case = request.getParameterValues("p_case");
String [] p_color = request.getParameterValues("p_color");
String [] p_gender = request.getParameterValues("p_gender");
String [] p_status = request.getParameterValues("p_status");
String [] p_size =request.getParameterValues("p_size");
String  p_price = request.getParameter("p_price");
String  sorting = request.getParameter("sorting");
%> 

<script type="text/javascript">
$(document).ready(function () {
	 <%if (sorting != null){ %>
	   $("#<%=sorting%>").prop("checked", true);
	 <% 
	 } %>	
	 <%if (p_type2 != null){ 
	 		for(int i =0; i < p_type2.length; i++){ %>
		   $("#<%=p_type2[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <%if (p_brand != null){ 
	 		for(int i =0; i < p_brand.length; i++){ %>
	 		  $("#<%=p_brand[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <% if(p_case != null){ 
	 		for(int i =0; i < p_case.length; i++){ %>
		   $("#<%=p_case[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <% if(p_color != null){ 
	 		for(int i =0; i < p_color.length; i++){ %>
		   $("#<%=p_color[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <% if(p_gender != null){ 
	 		for(int i =0; i < p_gender.length; i++){ %>
		   $("#<%=p_gender[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <% if(p_status != null){ 
	 		for(int i =0; i < p_status.length; i++){ %>
		   $("#<%=p_status[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <%if (p_size != null){ 
	 		for(int i =0; i < p_size.length; i++){ %>
		   $("#<%=p_size[i]%>").prop("checked", true);
	 <%  }
	 } %>
	 <% if(p_price != null){ %>
    	$("#p<%=p_price%>").prop("checked", true);
	 <%  
	 } %>
   
});
</script>
<form action="productList.do" method="get" id="frm">
	<div class="contianer" style="padding-left: 11%; padding-right: 11%; height: auto;">
		<input type="hidden" name="p_type1" value="<%=p_type1%>">
		<div style="float: left; width: 80%; height: 50px;">
			<div style="min-height:40px;">
			<% if(p_type1.equals("의류")) { %>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="아우터" value="아우터">
						<span>아우터</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="드레스" value="드레스">
						<span>드레스</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="투피스" value="투피스">
						<span>투피스</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="상의" value="상의">
						<span>상의</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="하의" value="하의">
						<span>하의</span>
				</label>
	
			<%}else if(p_type1.equals("가방")) {%>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="토트백" value="토트백">
						<span>토트백</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="숄더백" value="숄더백">
						<span>숄더백</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="크로스백" value="크로스백">
						<span>크로스백</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="클러치" value="클러치">
						<span>클러치</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="백팩" value="백팩">
						<span>백팩</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="트래블백" value="트래블백">
						<span>트래블백</span>
				</label>
	
			<%}else if(p_type1.equals("지갑")) {%>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="장지갑" value="장지갑">
						<span>장지갑</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="반지갑" value="반지갑">
						<span>중지갑/반지갑</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="머니클립" value="머니클립">
						<span>머니클립</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="명함지갑" value="명함지갑">
						<span>카드/명함지갑</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="동전지갑" value="동전지갑">
						<span>동전지갑</span>
				</label>

			<%}else if(p_type1.equals("시계")) {%>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="메탈" value="메탈">
						<span>메탈</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="가죽" value="가죽">
						<span>가죽</span>
				</label>

			<%}else if(p_type1.equals("패션잡화")) {%>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="모자" value="모자">
						<span>모자</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="스카프" value="스카프">
						<span>스카프/머플러</span>
				</label><label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="넥타이" value="넥타이">
						<span>넥타이</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="벨트" value="벨트">
						<span>벨트</span>
				</label><label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="장갑" value="장갑">
						<span>장갑</span>
				</label>
				<label class="box-checkbox-input">
					<input type="checkbox" name="p_type2" id="썬글라스" value="썬글라스">
						<span>썬글라스</span>
				</label>
			<%} %>
			</div>
		</div>	
		
		<!-- 더 손봐야함 -->
		
		<div class="contianer" style="float:left; text-align: right; padding-top: 5px; padding-right: 10px; font-size: 12px; width: 20%">
			<div style="min-height:40px;">
			<label class="box-button-input">
					<span><button type="button" class="wish" onclick="check_reset()"><i class="fas fa-sync-alt"></i>&nbsp;초기화</button></span>
			</label>
			<label class="box-button-input">
					<span><button type="submit" class="wish"><i class="fas fa-search"></i>&nbsp;검색</button></span>
			</label>
			</div>
		</div>
	</div>
		
		
	<div class="contianer" style="padding-left: 11%; padding-right: 11%; height: auto;">
				
		<div style="clear: both;">
		<%if(p_type1.equals("시계")) { %>
			<div class="cate-base-box typeThin" style="height: 67px;">
				<h5><strong>브랜드</strong></h5>
			</div>	
			
			<div class="table-div">
			<table style="font-size: 11px;">
				<col width="13%"><col width="13%"><col width="13%"><col width="13%">
				<col width="13%"><col width="13%"><col width="13%">
				<tr>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="AUDEMARS-PIGUET" value="AUDEMARS-PIGUET">
							<span>AUDEMARS PIGUET</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BREGUET" value="BREGUET">
							<span>BREGUET</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BVLGARI" value="BVLGARI">
							<span>BVLGARI</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="CARTIER" value="CARTIER">
							<span>CARTIER</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="IWC" value="IWC">
							<span>IWC</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="MONT-BLANC" value="MONT-BLANC">
							<span>MONT BLANC</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="OMEGA" value="OMEGA">
							<span>OMEGA</span>
						</label>
					</th>
				</tr>
				<tr>
					
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="PATEK-PHILIPPE" value="PATEK-PHILIPPE">
							<span>PATEK PHILIPPE</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="PIAGET" value="PIAGET">
							<span>PIAGET</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="ROLEX" value="ROLEX">
							<span>ROLEX</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="TAGHEUER" value="TAGHEUER">
							<span>TAGHEUER</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="VACHERON-CONSTANTIN" value="VACHERON-CONSTANTIN">
							<span>VACHERON CONSTANTIN</span>
						</label>
					</th>
					<th></th>
				</tr>
			</table>	
			</div>
			<%}else{ %>
			<div class="cate-base-box typeThin" style="height: 127px;">
				<h5><strong>브랜드</strong></h5>
			</div>
			<div class="table-div">
			<table style="font-size: 11px;">
				<col width="140px"><col width="140px"><col width="140px"><col width="140px">
				<col width="140px"><col width="140px"><col width="140px">
				<tr>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="ALEXANDER-MCQUEEN" value="ALEXANDER-MCQUEEN">
							<span>ALEXANDER MCQUEEN</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BALENCIAGA" value="BALENCIAGA">
							<span>BALENCIAGA</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BOTTEG-AVENETA" value="BOTTEG-VENETA">
							<span>BOTTEGA VENETA</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BURBERRY" value="BURBERRY">
							<span>BURBERRY</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="BVLGARI" value="BVLGARI">
							<span>BVLGARI</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="CELINE" value="CELINE">
							<span>CELINE</span>
						</label>
					</th>
					<th>
						<label class="brand-checkbox-input">
							<input type="checkbox" name="p_brand" id="CHANEL" value="CHANEL">
							<span>CHANEL</span>
						</label>
					</th>
				</tr>
				<tr>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="CHLOE" value="CHLOE">
							<span>CHLOE</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="D_G" value="D_G">
							<span>D&G</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="DIOR" value="DIOR">
							<span>DIOR</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="FENDI" value="FENDI">
							<span>FENDI</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="FERRAGAMO" value="FERRAGAMO">
							<span>FERRAGAMO</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="GIVENCHY" value="GIVENCHY">
							<span>GIVENCHY</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="GOYARD" value="GOYARD">
							<span>GOYARD</span>
						</label>
					</th>
				</tr>
				<tr>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="GUCCI" value="GUCCI">
							<span>GUCCI</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="HERMES" value="HERMES">
							<span>HERMES</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="LOUIS-VUITTON" value="LOUIS-VUITTON">
							<span>LOUIS VUITTON</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MAISON-MARGIELA" value="MAISON-MARGIELA">
							<span>MAISON MARGIELA</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MARNI" value="MARNI">
							<span>MARNI</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MICHAA" value="MICHAA">
							<span>MICHAA</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MIU-MIU" value="MIU-MIU">
							<span>MIU MIU</span>
						</label>
					</th>
				</tr>
				<tr>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MONCLER" value="MONCLER">
							<span>MONCLER</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="MSGM" value="MSGM">
							<span>MSGM</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="PRADA" value="PRADA">
							<span>PRADA</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="SAINT-LAURENT" value="SAINT-LAURENT">
							<span>SAINT LAURENT</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="THOM-BROWNE" value="THOM-BROWNE">
							<span>THOM BROWNE</span>
						</label>
					</th>
					<th>
						<label class="brand2-checkbox-input">
							<input type="checkbox" name="p_brand" id="VERSACE" value="VERSACE">
							<span>VERSACE</span>
						</label>
					</th>
				</tr>
			</table>	
			</div>
			<%} %>
	
		</div>
		<div style="clear: both;">
				<div class="cate1-base-box typeThin">
					<h5><strong>성별</strong></h5>
				</div>
				<div class="table-div">
					<table style="font-size: 11px;">
						<col width="140px"><col width="140px"><col width="140px"><col width="140px">
						<col width="140px"><col width="140px"><col width="140px">
						<tr>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_gender" id="남녀공용" value="남녀공용">
									<span><strong>남녀공용</strong></span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_gender" id="여성" value="여성">
									<span><strong>여성</strong></span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_gender" id="남성" value="남성">
									<span><strong>남성</strong></span>
								</label>
							</th>
						</tr>
					</table>
				</div>
			</div>			
			
			<div style="clear: both;">
				<div class="cate1-base-box typeThin">
					<h5><strong>사이즈</strong></h5>
				</div>
				<div class="table-div">
					<table style="font-size: 11px;">
						<col width="140px"><col width="140px"><col width="140px"><col width="140px">
						<col width="140px"><col width="140px"><col width="140px">
						<tr>
							<%if(p_type1.equals("시계")) { %>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="24mm" value="24mm">
									<span>24mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="32mm" value="32mm">
									<span>32mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="36mm" value="36mm">
									<span>36mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="39.5mm" value="39.5mm">
									<span>39.5mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="40mm" value="40mm">
									<span>40mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="41mm" value="41mm">
									<span>41mm</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="42mm" value="42mm">
									<span>42mm</span>
								</label>
							</th>
							<%}else{ %>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="Free" value="Free">
									<span>Free</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="XS" value="XS">
									<span>XS</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="S" value="S">
									<span>S</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="M" value="M">
									<span>M</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="L" value="L">
									<span>L</span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_size" id="XL" value="XL">
									<span>XL</span>
								</label>
							</th><th></th>
							<%} %>
						</tr>
					</table>
				</div>
			</div>				
		
			<div style="clear: both;">
				<div class="cate1-base-box typeThin">
					<h5><strong>상태</strong></h5>
				</div>
				<div class="table-div">
					<table style="font-size: 11px;">
						<col width="140px"><col width="140px"><col width="140px"><col width="140px">
						<col width="140px"><col width="140px"><col width="140px">
						<tr>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_status" id="대여가능" value="대여가능">
									<span><strong>대여가능</strong></span>
								</label>
							</th>
							<th>
								<label class="brand-checkbox-input">
									<input type="checkbox" name="p_status" id="대여중" value="대여중">
									<span><strong>대여중</strong></span>
								</label>
							</th>
						</tr>
					</table>	
				</div>	
			</div>
			
			
			<div style="clear: both;">
				<div class="cate1-base-box typeThin">
					<h5><strong>컬러</strong></h5>
				</div>
				<div class="table-div">
					<table style="font-size: 11px;">
						<tr>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="BLUE" value="BLUE">
									<span>
										<i class="fas fa-circle" style="color: blue;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="BLACK" value="BLACK">
									<span>
										<i class="fas fa-circle" style="color: black;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="BROWN" value="BROWN">
									<span>
										<i class="fas fa-circle" style="color: brown;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="GREEN" value="GREEN">
									<span>
										<i class="fas fa-circle" style="color: green;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="GOLD" value="GOLD">
									<span>
										<i class="fas fa-circle" style="color: gold;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="GRAY" value="GRAY">
									<span>
										<i class="fas fa-circle" style="color: gray;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="NAVY" value="NAVY">
									<span>
										<i class="fas fa-circle" style="color: navy;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="ORANGE" value="ORANGE">
									<span>
										<i class="fas fa-circle" style="color: orange;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="PINK" value="PINK">
									<span>
										<i class="fas fa-circle" style="color: pink;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="PURPLE" value="PURPLE">
									<span>
										<i class="fas fa-circle" style="color: purple;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="RED" value="RED">
									<span>
										<i class="fas fa-circle" style="color: red;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="SILVER" value="SILVER">
									<span>
										<i class="fas fa-circle" style="color: silver;"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="WHITE" value="WHITE">
									<span>
										<i class="far fa-circle"></i>
									</span>
								</label>
							</th>
							<th>
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="YELLOW" value="YELLOW">
									<span>
										<i class="fas fa-circle" style="color: yellow;"></i>
									</span>
								</label>
							</th>
							<th>
								<!-- <label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="MULTI" value="MULTI">
									<span>
										<i class="fas fa-circle" style="color: #f8f8f8;"></i>
									</span>
								</label> -->
								
								
								
								<label class="color-checkbox-input">
									<input type="checkbox" name="p_color" id="color" value="MULTI">
									<span>
										<!-- <i class="fas fa-circle" style="color: #f8f8f8;"></i> -->
										<img src="./image/productList/icon.png" width="11px" style="margin-bottom:4px; ">
									</span>
								</label>
							</th>
						</tr>
					</table>
				</div>
			</div>
			
			
			<div style="clear: both;">
				<div class="cate1-base-box typeThin">
					<h5><strong>3일권 가격</strong></h5>
				</div>
				<div class="table-div">
					<table style="font-size: 11px;">
						<col width="140px"><col width="140px"><col width="140px"><col width="140px">
						<col width="140px"><col width="140px"><col width="140px">
						<tr>
							<th>
								<label class="box-radio-input">
									<input type="radio" name="p_price" id="p0-40000" value="0-40000">
									<span><strong>~ 4만원 이하</strong></span>
								</label>
							</th>
							<th>
								<label class="box-radio-input">
									<input type="radio" name="p_price" id="p40001-70000" value="40001-70000">
									<span><strong>4만원 초과 ~ 7만원 이하</strong></span>
								</label>
							</th>
							<th>
								<label class="box-radio-input">
									<input type="radio" name="p_price" id="p70001-100000000" value="70001-100000000">
									<span><strong>7만원 이상 ~</strong></span>
								</label>
							</th>
						</tr>
					</table>	
				</div>
			</div>
	</div>
















<div  style="padding-left: 11%; padding-right: 11%; width:100%; padding-top:20px; padding-bottom:10px; float: left;clear: both;">
	<hr style="background-color: #9E9AA2; height: 1px;">
</div>

	<div align="left" style="padding-left: 11%; width:50%; float: left;">
		<h4 style="padding-left: 1%;">총 ${totalCount}개</h4>
	</div>
	<div align="right" style="padding-right: 11%; width:50%;  float: left;">
		<table style="font-size: 11px;">
						<col width="80px"><col width="80px"><col width="80px"><col width="80px">
						<tr>
							<th>
								<label class="sorting-radio-input" >
									<input type="radio" name="sorting" id="wishcount" value="wishcount">
									<span id="span_wishcount"><strong>인기상품순</strong></span>
								</label>
							</th>
							<th>
								<label class="sorting-radio-input" >
									<input type="radio" name="sorting" id="regdate" value="regdate">
									<span id="span_regdate"><strong>최신등록순</strong></span>
								</label>
							</th>
							<th>
								<label class="sorting-radio-input">
									<input type="radio" name="sorting" id="pricedown" value="pricedown">
									<span id="span_pricedown"><strong>낮은가격순</strong></span>
								</label>
							</th>
							<th>
								<label class="sorting-radio-input">
									<input type="radio" name="sorting" id="priceup" value="priceup">
									<span id="span_priceup"><strong>높은가격순</strong></span>
								</label>
							</th>
						</tr>
					</table>
				
	</div>
	
	
</form>
<div  style="padding-left: 11%; padding-right: 11%; width:100%; float: left;clear: both;">
	<hr style="background-color: #9E9AA2;">	
</div>





<script type="text/javascript">
	$(".sorting-radio-input").click(function() {
		$("#span_"+$("#sortiong").val()).html("<strong>✓"+$("#sortiong").val()+"</strong>");
		$("#frm").submit();
	});
	
</script>	