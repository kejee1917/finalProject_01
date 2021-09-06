<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<style>
/* 컬러 체크박스 */
/* brand 시계 첫번째줄*/
.color-radio-input input[type="radio"]{
  display:none;
}

.color-radio-input input[type="radio"] + span{
  display:inline-block;
  background:none;
/*   border:1px solid #dfdfdf;  */ 
  text-align:left;
  height:25px;
  width: 20px;
  line-height:25px;
  cursor:pointer;
  margin-top: 5px;
  padding-bottom: 5px;

}

.color-radio-input input[type="radio"]:checked + span{
  font-size: 15px;
  color:#2E4D58;
  width: 15px;
}




</style>
<body>
<div class="contianer" style="padding-left: 11%;padding-right: 11%;width: auto;">
	<form action="productWriteAf.do" id="frm" method="post" enctype="multipart/form-data">
		<table>
			<col width="150px"><col width="auto">
			<tr>
				<th>제품명</th>
				<td><input type="text" name="p_name" id="name" required="required" style="width: 35%"></td>
			</tr>
			<tr>
				<th>제품타입</th>
				<td>
					<select  name="p_type1" id="type1" style="width: 35%" required >
							<option value="">-----타입 선택-----</option>
							<option value="의류">의류</option>
							<option value="가방">가방</option>
							<option value="지갑">지갑</option>
							<option value="시계">시계</option>
							<option value="패션잡화">패션잡화</option>
							
					</select>
				</td>
			</tr>
			<tr>
				<th>상세타입</th>
				<td>
					<select name="p_type2" id="type2" style="width: 35%" required>
						<option value="">-----타입 선택-----</option>
					</select>
				<td>
			</tr>
			<tr>
				<th>브랜드</th>
				<td><select name="p_brand" id="brand" style="width: 35%" required>
						<option value="">-----브랜드 선택-----</option>
				</select></td>
			</tr>
			<tr>
				<th>이럴땐!</th>
				<td><select name="p_case" id="case" style="width: 35%" required>
						<option value="">-----카테고리 선택-----</option>
						<option value="데일리">데일리</option>
						<option value="오피스">오피스</option>
						<option value="로맨틱">로맨틱</option>
						<option value="휴가">휴가</option>
						<option value="웨딩">웨딩</option>
						<option value="주말">주말</option>
						<option value="파티">파티</option>
				</select></td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td><select name="p_gender" id="gender" style="width: 35%" >
						<option value="">-----성별 선택-----</option>
						<option value="남녀공용">남녀공용</option>
						<option value="여성">여성</option>
						<option value="남성">남성</option>
				</select></td>
			</tr>
			<tr>
				<th>시즌</th>
				<td><select name="p_season" id="season" style="width: 35%" >
						<option value="">-----시즌 선택-----</option>
						<option value="Free">Free</option>
						<option value="봄">봄</option>
						<option value="여름">여름</option>
						<option value="가을">가을</option>
						<option value="겨울">겨울</option>
				</select></td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td><select name="p_size" id="size" required style="width: 35%">
						<option value="">-----사이즈 선택-----</option>
				</select></td>
			</tr>
			<tr>
				<th>색상</th>
				
				
				
							<th>
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="BLUE">
									<span>
										<i class="fas fa-circle" style="color: blue;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="BLACK">
									<span>
										<i class="fas fa-circle" style="color: black;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="BROWN">
									<span>
										<i class="fas fa-circle" style="color: brown;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="GREEN">
									<span>
										<i class="fas fa-circle" style="color: green;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="GOLD">
									<span>
										<i class="fas fa-circle" style="color: gold;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="GRAY">
									<span>
										<i class="fas fa-circle" style="color: gray;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="NAVY">
									<span>
										<i class="fas fa-circle" style="color: navy;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="ORANGE">
									<span>
										<i class="fas fa-circle" style="color: orange;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="PINK">
									<span>
										<i class="fas fa-circle" style="color: pink;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="PURPLE">
									<span>
										<i class="fas fa-circle" style="color: purple;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="RED">
									<span>
										<i class="fas fa-circle" style="color: red;"></i>
									</span>
								</label>
						
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="SILVER">
									<span>
										<i class="fas fa-circle" style="color: silver;"></i>
									</span>
								</label>
						
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="WHITE">
									<span>
										<i class="far fa-circle"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="YELLOW">
									<span>
										<i class="fas fa-circle" style="color: yellow;"></i>
									</span>
								</label>
							
								<label class="color-radio-input">
									<input type="radio" name="p_color" id="color" value="MULTI">
									<span>
										<!-- <i class="fas fa-circle" style="color: #f8f8f8;"></i> -->
										<img src="./image/productList/icon.png" width="11px" style="margin-bottom:4px; ">
									</span>
								</label>
							</th>
				
				
				
				
				
				<!-- 
				<td><select name="p_color" id="color" required>
						<option value="">-----색상 선택-----</option>
						<option value="BLUE">BLUE</option>
						<option value="BLACK">BLACK</option>
						<option value="BROWN">BROWN</option>
						<option value="GREEN">GREEN</option>
						<option value="GOLD">GOLD</option>
						<option value="GRAY">GRAY</option>
						<option value="BLUE">IVORY</option>
						<option value="NAVY">NAVY</option>
						<option value="ORANGE">ORANGE</option>
						<option value="PINK">PINK</option>
						<option value="PURPLE">PURPLE</option>
						<option value="RED">RED</option>
						<option value="SIVER">SIVER</option>
						<option value="WHITE">WHITE</option>
						<option value="YELLOW">YELLOW</option>
						<option value="MULTI">MULTI</option>
				</select></td> -->
			</tr>
			<tr>
				<th>썸네일이미지</th>
				<td><input type="file" name="thumbnailImage" id="image1" required></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="detailImage" id="image2" multiple required></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="p_price" id="price" required style="width: 35%"></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td><input type="text" name="p_discount" id="discount" value="0" required placeholder="기본 '0'으로 지정" style="width: 35%"></td>
			</tr>
			<tr>
				<th>내용</th>
  				<td><textarea id="summernote" name="p_content"></textarea></td>
  			</tr>
  			
			<tr>
				<td colspan="2" align="center"><input type="button" id="btnAdd"
					value="올리기"></td>
			</tr>	
  	</table>
  </form>
<br><br>    

<div style="height: 200px;"></div>

</div>
<script>

$(document).ready(function() {
   	$('#summernote').summernote({
   		placeholder: '상품글을 작성해주세요!',
        tabsize: 2,
        width: 900,
    	height: 600,
   		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
   		fontNamesIgnoreCheck : [ '맑은고딕' ],
   		focus : true,
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }
		}
		
	});

});

function sendFile(file, el) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: 'contentImageSend.do',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
      		$(el).summernote('editor.insertImage', img_name);
    	}
  	});
}





$("#type1").blur(function() {
	
	let str1 = "";
	let str2 = "<option value=''>-----브랜드 선택-----</option>"
			 + "<option value='ALEXANDER-MCQUEEN'>ALEXANDER MCQUEEN</option>"
		     + "<option value='BALENCIAGA'>BALENCIAGA</option>"
		  	 + "<option value='BOTTEGA-VENETA'>BOTTEGA VENETA</option>"
		  	 + "<option value='BURBERRY'>BURBERRY</option>"
		  	 + "<option value='BVLGARI'>BVLGARI</option>"
		   	 + "<option value='CELINE'>CELINE</option>"
		  	 + "<option value='CHANEL'>CHANEL</option>"
		  	 + "<option value='CHLOE'>CHLOE</option>"
		  	 + "<option value='D_G'>D&G</option>"
		  	 + "<option value='DIOR'>DIOR</option>"
		  	 + "<option value='FENDI'>FENDI</option>"
		 	 + "<option value='FERRAGAMO'>FERRAGAMO</option>"
		  	 + "<option value='GIVENCHY'>GIVENCHY</option>"
		  	 + "<option value='GOYARD'>GOYARD</option>"
		  	 + "<option value='GUCCI'>GUCCI</option>"
		  	 + "<option value='HERMES'>HERMES</option>"
		  	 + "<option value='LOUISV-UITTON'>LOUIS VUITTON</option>"
		  	 + "<option value='MAISON-MARGIELA'>MAISON MARGIELA</option>"
		     + "<option value='MARNI'>MARNI</option>"
		  	 + "<option value='MICHAA'>MICHAA</option>"
		  	 + "<option value='MIU-MIU'>MIU MIU</option>"
		  	 + "<option value='MONT-BLANC'>MONT BLANC</option>"
		  	 + "<option value='MONCLER'>MONCLER</option>"
		 	 + "<option value='MSGM'>MSGM</option>"
		 	 + "<option value='PRADA'>PRADA</option>"
		 	 + "<option value='SAINT-LAURENT'>SAINT LAURENT</option>"
		 	 + "<option value='THOMB-ROWNE'>THOM BROWNE</option>"
		 	 + "<option value='VERSACE'>VERSACE</option>";
		 	 
		 	 
		 	
	let str3 = "<option value=''>-----브랜드 선택-----</option>"
	  		 + "<option value='AUDEMARS-PIGUET'>AUDEMARS PIGUET</option>"
	  		 + "<option value='BREGUET'>BREGUET</option>"
	  		 + "<option value='BVLGARI'>BVLGARI</option>"
	   		 + "<option value='CARTIER'>CARTIER</option>"
	  		 + "<option value='IWC'>IWC</option>"
	  		 + "<option value='MONT-BLANC'>MONT BLANC</option>"
	  		 + "<option value='OMEGA'>OMEGA</option>"
	  		 + "<option value='PATEK-PHILIPPE'>PATEK PHILIPPE</option>"
	  		 + "<option value='PIAGET'>PIAGET</option>"
	  		 + "<option value='ROLEX'>ROLEX</option>"
	 		 + "<option value='TAGHEUER'>TAGHEUER</option>"
	 		 + "<option value='VACHERON-CONSTANTIN'>VACHERON CONSTANTIN</option>";
	 		 
	let str4 = "<option value=''>-----사이즈 선택-----</option>"
    		 + "<option value='Free'>Free</option>"
  			 + "<option value='XS'>XS</option>"
  			 + "<option value='S'>S</option>"
  			 + "<option value='M'>M</option>"
   			 + "<option value='L'>L</option>"
   			 + "<option value='XL'>XL</option>";
   	
   	let str5 = "<option value=''>-----사이즈 선택-----</option>"
   		     + "<option value='24mm'>24mm</option>"
       		 + "<option value='32mm'>32mm</option>"
       		 + "<option value='36mm'>36mm</option>"	
       		 + "<option value='395mm'>39.5mm</option>"
       		 + "<option value='40mm'>40mm</option>"	
       		 + "<option value='41mm'>41mm</option>"
       		 + "<option value='42mm'>42mm</option>";
       		
   			 
	
	if($("#type1").val() == '의류'){
		
		str1 += "<option value=''>-----타입 선택-----</option>"
			 + "<option value='아우터'>아우터</option>"
			 + "<option value='드레스'>드레스</option>"
			 + "<option value='투피스'>투피스</option>"
			 + "<option value='상의'>상의</option>"
			 + "<option value='하의'>하의</option>";
		
		$("#type2").html("");	 
		$("#type2").append(str1);
		$("#brand").html("");	 
		$("#brand").append(str2);
		$("#size").html("");	 
		$("#size").append(str4);
	}
	else if($("#type1").val() == '가방'){
		str1 += "<option value=''>-----타입 선택-----</option>"
			 + "<option value='토트백'>토트백</option>"
			 + "<option value='숄더백'>숄더백</option>"
			 + "<option value='크로스백'>크로스백</option>"
			 + "<option value='클러치'>클러치</option>"
			 + "<option value='백팩'>백팩</option>"
			 + "<option value='트래블백'>트래블백</option>";
			 
		$("#type2").html("");	 
		$("#type2").append(str1);
		$("#brand").html("");	 
		$("#brand").append(str2);
		$("#size").html("");	 
		$("#size").append(str4);

	}
	else if($("#type1").val() == '지갑'){
		str1 += "<option value=''>-----타입 선택-----</option>"
			 + "<option value='장지갑'>장지갑</option>"
			 + "<option value='반지갑'>중지갑/반지갑</option>"
			 + "<option value='머니클립'>머니클립</option>"
			 + "<option value='명함지갑'>카드/명함지갑</option>"
			 + "<option value='동전지갑'>동전지갑</option>";
		$("#type2").html("");	 
		$("#type2").append(str1);
		$("#brand").html("");	 
		$("#brand").append(str2);
		$("#size").html("");	 
		$("#size").append(str4);

	}
	else if($("#type1").val() == '시계'){
		str1 += "<option value=''>-----타입 선택-----</option>"
			 + "<option value='메탈'>메탈</option>"
			 + "<option value='가죽'>가죽</option>";
			 
		$("#type2").html("");	 
		$("#type2").append(str1);
		$("#brand").html("");	 
		$("#brand").append(str3);
		$("#size").html("");	 
		$("#size").append(str5);

	}
	else if($("#type1").val() == '패션잡화'){
		str1 += "<option value=''>-----타입 선택-----</option>"
			 + "<option value='모자'>모자</option>"
			 + "<option value='스카프'>스카프/머플러</option>"
			 + "<option value='넥타이'>넥타이</option>"
			 + "<option value='벨트'>벨트</option>"
			 + "<option value='장갑'>장갑</option>"
			 + "<option value='썬글라스'>썬글라스</option>";
		$("#type2").html("");	 
		$("#type2").append(str1);
		$("#brand").html("");	 
		$("#brand").append(str2);
		$("#size").html("");	 
		$("#size").append(str4);

	}
	
});



$("#btnAdd").click(function() {
	let reg = /^[0-9]*$/;
	if($("#name").val() == ""){
		alert('제품명을 입력해주세요.');
		return;
	}else if($("#brand").val() == ""){
		alert('브랜드명을 선택해주세요.');
		return;
	}else if($("#case").val() == ""){
		alert('케이스를 선택해주세요.');
		return;
	}else if($("#type1").val() == ""){
		alert('타입을 선택해주세요.');
		return;
	}else if($("#type2").val() == ""){
		alert('상세타입을 선택해주세요.');
		return;
	}else if($("#season").val() == ""){
		alert('시즌을 선택해주세요.');
		return;
	}else if($("#gender").val() == ""){
		alert('성별을 선택해주세요.');
		return;
	}else if($("#size").val() == ""){
		alert('사이즈를 선택해주세요.');
		return;
	}else if($("#color").val() == ""){
		alert('색상을 선택해주세요.');
		return;
	}else if($("#image1").val() == ""){
		alert('썸네일이미지를 선택해주세요.');
		return;
	}else if($("#image2").val() == ""){
		alert('디테일이미지를 선택해주세요.');
		return;
	}else if($("#content").val() == ""){
		alert('콘텐츠를 선택해주세요.');
		return;
	}else if($("#price").val() == ""){
		alert('가격을 입력해주세요.');
		return;
	}else if(!reg.test( $("#price").val())){
		alert('가격은 숫자만 입력가능합니다');
		return;
	}else if(!reg.test( $("#discount").val())){
		alert('가격은 숫자만 입력가능합니다');
		return;
	}else{  
	$("#price").val($("#price").val() - ($("#price").val()* $("#discount").val()/100));	
	$("#frm").submit();
	}
});
</script>