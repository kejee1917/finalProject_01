<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<style>
.div_table{
	width: 60%;
}

.top_table{
	margin-bottom: 20px;
}

.addCoupon_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
	border: 1px solid gray;
}

.addCoupon_table th{
	border: 1px solid gray;
	background-color:#e9e9e9;
	padding: 10px;	
	font-size: 20px;
}

.addCoupon_table td{
	border: 1px solid gray;
	padding: 10px 0px 10px 5px;			/* 상 우 하 좌 */
	text-align: left;
}

.addCoupon_table .table_list{
	width:20%;
	font-size: 16px;
	text-align: center;
} 

#name{
	border: 0px none;
	outline: none;
}

.addCoupon_table td input{
	width: 100%;
	border: 0px none;
	outline: none;
}

.addCoupon_table td select{
	/* border: 0px none;
	border-bottom:solid;
	border-bottom-width:thin;
	border-bottom-color:gray; */
	width: 40%;
 }

</style>
<div align="center">
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/coupon.png" width='30px' height='30px'>
			</td>
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">쿠폰 등록</b>
			</td>
		</tr>
	</table>
</div>

<div align="center">
	<form action="addCouponAf.do" id="frm" method="post" enctype="multipart/form-data">
		<div align="left" class="div_table">
			<table class="addCoupon_table">
				<col width="20%"><col width="auto">
				<tr>
					<th colspan="2" style="text-align: center;">쿠폰 정보</th>
				</tr>
				<tr>
					<td class="table_list">분류</td>
					<td>
						<select name="cp_category" id="_cp_category" required>
							<option value="" selected>- [필수] 분류를 선택하세요. -</option>
							<option value="가입">가입</option>
							<option value="등급">등급</option>
							<option value="이벤트">이벤트</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">쿠폰명</td>
					<td><input type="text" name="cp_name" id="_cp_name" maxlength="25" required autofocus></td>
				</tr>
				<tr>
					<td class="table_list">쿠폰금액</td>
					<td><input type="text" name="cp_amount" id="_cp_amount" required></td>
				</tr>
				<tr>
					<td class="table_list">사용제한금액</td>
					<td><input type="text" name="cp_limitmin" id="_cp_limitmin" required></td>
				</tr>
				<tr>
					<td class="table_list">최대할인금액</td>
					<td><input type="text" name="cp_limitmax" id="_cp_limitmax" required></td>
				</tr>
				<tr>
					<td class="table_list">사용여부</td>
					<td>
						<select name="cp_use" id="_cp_use" required>
							<option value="" selected>- [필수] 사용여부를 선택하세요. -</option>
							<option value="비활성">비활성</option>
							<option value="활성">활성</option>
						</select>
					</td>
				</tr>
	  	</table>
	  	<br>
	  	<div align="center">
		  	<input type="button" class="btn btn-secondary" style="width: 100px;" id="btnAdd" value="등록">
			<input type="button" class="btn btn-dark" style="width: 100px;" value="취소" onclick="location.href='coupon.do'">
		</div>
	</div>	
  </form>
</div>

<script>
$("#btnAdd").click(function(){
	let reg = /^[0-9]*$/;
	
	if($('select[name=cp_category]').val() == ""){
		alert('분류를 선택해주세요');
		return;
	}else if($('input[name=cp_name]').val() == ""){
		alert('쿠폰명을 작성해주세요');
		return;
	}else if($('input[name=cp_amount]').val() == ""){
		alert('쿠폰금액을 작성해주세요');
		return;
	}else if($('input[name=cp_limitmin]').val() == ""){
		alert('사용제한금액을 작성해주세요');
		return;
	}else if($('input[name=cp_limitmax]').val() == ""){
		alert('최대할인금액을 작성해주세요');
		return;
	}else if($('select[name=cp_use]').val() == ""){
		alert('사용여부를 선택해주세요');
		return;
	}else if(!reg.test( $('input[name=cp_amount]').val())){
		alert('쿠폰금액은 숫자만 입력가능합니다');
		return;
	}else if(!reg.test( $('input[name=cp_limitmin]').val())){
		alert('사용제한금액은 숫자만 입력가능합니다');
		return;
	}else if(!reg.test( $('input[name=cp_limitmax]').val())){
		alert('최대할인금액은 숫자만 입력가능합니다');
		return;
	}else{
		$("#frm").submit(); 
	}
});
</script>
