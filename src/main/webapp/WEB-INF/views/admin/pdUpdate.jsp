<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 서머노트를 위해 추가해야할 부분 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.div_table{
	width: 80%;
}

.top_table{
	margin-bottom: 10px;
}

.pdUpdate_table{
	width:100%;
	border-collapse:collapse;
}

.pdUpdate_table tr{
	text-align: left;
}

.pdUpdate_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-style: outset;
	border-bottom-width: thin;
}

.pdUpdate_table td input{
	padding: 0px 0px 5px 0px;			/* 상 우 하 좌 */
	border: 0px none;					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
}

.table_list{
	width:20%;
	color: gray;
	font-size: 14px;
	padding-left: 10px;
}

#_p_newimage1, #_p_newimage2{
	width: 200px;
	height: 200px;
}

#multiple-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
}
.image {
    display: block;
    width: 100%;
}
.image-label {
    position: relative;
    bottom: 22px;
    left: 5px;
    color: white;
    text-shadow: 2px 2px 2px black;
}
</style>
<%
	ProductDto dto = (ProductDto)request.getAttribute("dto");
	ProductUtil util = new ProductUtil();
%>

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/product.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">상품수정</b>
		</td>
	</tr>
</table>

<div>
	<form action="pdUpdateAf.do" method="post" id="_pdUpdate" enctype="multipart/form-data">
		<div align="left" class="div_table">
			<table class="pdUpdate_table">
				<tr>
					<td class="table_list">상품번호</td>
					<td><input type="text" name="p_no" value="<%=dto.getP_no() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">상품명</td>
					<td><input type="text" name="p_name" value="<%=dto.getP_name() %>" size="50" autofocus></td>
				</tr>
				<tr>
					<td class="table_list">상품타입</td>
					<td>
						<input type="hidden" id="_type1" value="<%=dto.getP_type1()%>">
						<select name="p_type1" id="type1" required>
								<option value="">----- 타입 선택 -----</option>
								<option value="의류">의류</option>
								<option value="가방">가방</option>
								<option value="지갑">지갑</option>
								<option value="시계">시계</option>
								<option value="패션잡화">패션잡화</option>
								
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">상세타입</td>
					<td>
						<input type="hidden" id="_type2" value="<%=dto.getP_type2()%>">
						<select name="p_type2" id="type2" required>
							<option value="">----- 타입 선택 -----</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">브랜드</td>
					<td>
						<input type="hidden" id="_brand" value="<%=dto.getP_brand()%>">
						<select name="p_brand" id="brand" required>
							<option value="">----- 브랜드 선택 -----</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">상태</td>
					<td>
						<input type="hidden" id="_case" value="<%=dto.getP_case()%>">
						<select name="p_case" id="case" required>
							<option value="">----- 카테고리 선택 -----</option>
							<option value="데일리">데일리</option>
							<option value="오피스">오피스</option>
							<option value="로맨틱">로맨틱</option>
							<option value="휴가">휴가</option>
							<option value="웨딩">웨딩</option>
							<option value="주말">주말</option>
							<option value="파티">파티</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="table_list">성별</td>
					<td>
						<input type="hidden" id="_gender" value="<%=dto.getP_gender()%>">
						<select name="p_gender" id="gender" >
							<option value="">----- 성별 선택 -----</option>
							<option value="남녀공용">남녀공용</option>
							<option value="여성">여성</option>
							<option value="남성">남성</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">시즌</td>
					<td>
						<input type="hidden" id="_season" value="<%=dto.getP_season()%>">
						<select name="p_season" id="season">
							<option value="">----- 시즌 선택 -----</option>
							<option value="Free">Free</option>
							<option value="봄">봄</option>
							<option value="여름">여름</option>
							<option value="가을">가을</option>
							<option value="겨울">겨울</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">사이즈</td>
					<td>
						<input type="hidden" id="_size" value="<%=dto.getP_size()%>">
						<select name="p_size" id="size" required>
							<option value="">----- 사이즈 선택 -----</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">색상</td>
					<td>
						<input type="hidden" id="_color" value="<%=dto.getP_color()%>">
						<select name="p_color" id="color" required>
							<option value="">----- 색상 선택 -----</option>
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
							<option value="SILVER">SILVER</option>
							<option value="WHITE">WHITE</option>
							<option value="YELLOW">YELLOW</option>
							<option value="MULTI">MULTI</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">썸네일이미지</td>
					<td>
						<input type="file" name="thumbnailImage" id="image1">
						<input type="hidden" name="p_image1" value="<%=dto.getP_image1() %>">
						<input type="hidden" name="p_newimage1" value="<%=dto.getP_newimage1() %>">
						<img src="./upload/thumbnailImage/<%=dto.getP_newimage1()%>" id="_p_newimage1">
					</td>
				</tr>
				<tr>
					<td class="table_list">이미지</td>
					<td>
						<input type="file" name="detailImage" id="image2" multiple>
						<input type="hidden" name="p_image2" value="<%=dto.getP_image2() %>">
						<input type="hidden" name="p_newimage2" value="<%=dto.getP_newimage2() %>">
						
							<% String image[] = dto.getP_newimage2().split(",");
							for (int i = 0; i < image.length; i++) { %>
							<div id="multiple-container">
								<img src="./upload/detailImage/<%=image[i]%>" width="400px"
									style="margin: auto;" id="_p_newimage2" name="p_newimage2"/>
							</div>
							<%}	%>
					</td>
				</tr>
				<tr>
					<td class="table_list">내용</td>
		 				<td><textarea class="summernote" id="summernote" name="p_content" id="content"><%=dto.getP_content() %></textarea></td>
		 			</tr>
		 		<tr>
					<td class="table_list">가격</td>
					<td><input type="text" name="p_price" id="price" value="<%=dto.getP_price() %>"></td>
				</tr>
				<tr>
					<td class="table_list">할인율</td>
					<td><input type="text" name="p_discount" id="discount" value="<%=dto.getP_discount()%>" required placeholder="기본 '0'으로 지정"></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input type="submit" class="btn btn-secondary" value="저장" style="width: 100px;">
				<input type="button" class="btn btn-dark" value="취소" onclick="window.history.back()" style="width: 100px;">
			</div>
		</div>
	</form>
</div>	

<script>

$(document).ready(function() {
/* 	var type1 = $("#_type1").val();
	var type2 = $("#_type2").val();
	var brand = $("#_brand").val();
	var _case = $("#_case").val();
	var gender = $("#_gender").val();
	var season = $("#_season").val();
	var size = $("#_size").val();
	var color = $("#_color").val();
	
	$("select[name=p_type1]").val(type1).prop("selected", true);
	$("select[name=p_type2]").val(type2).prop("selected", true);
	$("select[name=p_brand]").val(brand).prop("selected", true);
	$("select[name=p_case]").val(_case).prop("selected", true);
	$("select[name=p_gender]").val(gender).prop("selected", true);
	$("select[name=p_season]").val(season).prop("selected", true);
	$("select[name=p_size]").val(size).prop("selected", true);
	$("select[name=p_color]").val(color).prop("selected", true); */
	
   	$('#summernote').summernote({
   		placeholder: '상품글을 작성해주세요!',
        tabsize: 2,
        width: 900,
    	height: 600,
   		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
   		fontNamesIgnoreCheck : [ '맑은고딕' ],
   		focus : false,
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }
		}
		
	});

});

/* if($("#image1").val() != $("#_p_newimage1").val()){
	$("#_p_newimage1").hide();
} */

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
/* 
// 썸네일 이미지
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("_p_newimage1")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("image1")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});


// 이미지
function readMultipleImage(input) {
    const multipleContainer = document.getElementById("multiple-container")
    
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)
        console.log(input.files)
        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files)
        const $colDiv1 = document.createElement("div")
        const $colDiv2 = document.createElement("div")
        $colDiv1.classList.add("column")
        $colDiv2.classList.add("column")
        fileArr.forEach((file, index) => {
            const reader = new FileReader()
            const $imgDiv = document.createElement("div")   
            const $img = document.createElement("img")
            $img.classList.add("image")
            /*  const $label = document.createElement("label")
           $label.classList.add("image-label")
            $label.textContent = file.name 
            $imgDiv.appendChild($img)
           /*  $imgDiv.appendChild($label) 
            reader.onload = e => {
                $img.src = e.target.result
                
                $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
                $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
            }
            
            console.log(file.name)
            if(index % 2 == 0) {
                $colDiv1.appendChild($imgDiv)
            } else {
                $colDiv2.appendChild($imgDiv)
            }
            
            reader.readAsDataURL(file)
        })
        multipleContainer.appendChild($colDiv1)
        multipleContainer.appendChild($colDiv2)
    }
}
const inputMultipleImage = document.getElementById("image2")
inputMultipleImage.addEventListener("change", e => {
    readMultipleImage(e.target)
}) */


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
	var content = $("#summernote").summernote("code");
//	alert(content);
	let reg = /^[0-9]*$/;
	if($("#name").val() == ""){
		alert('상품명을 입력해주세요.');
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
	}else if(content == "" || content == "<p><br></p>"){
		alert('내용을 입력해주세요.');
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