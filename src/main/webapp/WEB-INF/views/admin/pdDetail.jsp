<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 서머노트를 위해 추가해야할 부분 -->
<!-- 사이드바 이상하게 나옴 -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
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

.pdDetail_table{
	width:100%;
	border-collapse:collapse;
	border: 1px solid black;
}

.pdDetail_table tr{
	text-align: left;
}

.pdDetail_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border: 1px solid black;
	/* border-bottom-style: outset;
	border-bottom-width: thin; */
}

.pdDetail_table td input, .pdDetail_table td textarea{
	padding: 0px 0px 5px 0px;			/* 상 우 하 좌 */
	border: 0px none;					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
}

.table_list{
	width:20%;
	font-size: 14px;
	padding-left: 10px;
}

#_p_newimage1, #_p_newimage2{
	width: 200px;
	height: 200px;
}

.summernote{
    height: auto;
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
			<b style="font-size: 30px;">상품상세보기</b>
		</td>
	</tr>
</table>

<div>
	<form action="pdUpdate.do" method="post" id="_pdUpdate">
		<div align="left" class="div_table">
			<table class="pdDetail_table">
				<tr>
					<td class="table_list">상품번호</td>
					<td><input type="text" name="p_no" value="<%=dto.getP_no() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">상품명</td>
					<td><input type="text" name="p_name" value="<%=dto.getP_name() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">종류</td>
					<td><input type="text" name="p_type1" value="<%=dto.getP_type1()%>" size="50" readonly></td>
				</tr>
				<tr>		
					<td class="table_list">종류2</td>
					<td><input type="text" name="p_type2" value="<%=dto.getP_type2() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">브랜드</td>
					<td><input type="text" name="p_brand" value="<%=dto.getP_brand() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">상황</td>
					<td><input type="text" name="p_case" value="<%=dto.getP_case() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">성별</td>
					<td><input type="text" name="p_gender" value="<%=dto.getP_gender() %>" size="50" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">계절</td>
					<td><input type="text" name="p_season" value="<%=dto.getP_season() %>" size="50" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">사이즈</td>
					<td>
						<input type="text" name="p_size" value="<%=dto.getP_size() %>" size="50" readonly><br>
					</td>
				</tr>
				<tr>	
					<td class="table_list">색상</td>
					<td><input type="text" name="p_color" value="<%=dto.getP_color() %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">썸네일이미지</td>
					<td>
						<img src="./upload/thumbnailImage/<%=dto.getP_newimage1()%>" id="_p_newimage1" name="p_newimage1">
					</td>
				</tr>
				<tr>
					<td class="table_list">이미지</td>
					<td>
						<%
						String image[] = dto.getP_newimage2().split(",");
						for (int i = 0; i < image.length; i++) {
						%>
						<img src="./upload/detailImage/<%=image[i]%>" width="400px"
							style="margin: auto;" id="_p_newimage2" name="p_newimage2"/>
						<%
						}
						%>
					</td>
				</tr>
				<tr>
					<td class="table_list">내용</td>
					<td><%=dto.getP_content() %></td>
				</tr>
				<tr>	
					<td class="table_list">가격</td>
					<td><input type="text" name="p_price" value="<%=util.change(dto.getP_price()) %>" size="50" readonly></td>
				</tr>
				<tr>
					<td class="table_list">할인율</td>
					<td><input type="text" name="p_discount" value="<%=dto.getP_discount()%>" size="50" readonly></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<%if(dto.getP_del()==1){ %>
				<input type="button" class="btn btn-dark" value="목록" onclick="location.href='product.do'" style="width: 100px;">
				<%}else{ %>
					<input type="submit" class="btn btn-secondary" value="수정" style="width: 100px;">
					<input type="button" class="btn btn-dark" value="목록" onclick="location.href='product.do'" style="width: 100px;">
				<%} %>
			</div>
		</div>
	</form>
</div>	

<script>

$(document).ready(function() {
   /* 	$('#summernote').summernote({
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
		
	}); */

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



</script>
