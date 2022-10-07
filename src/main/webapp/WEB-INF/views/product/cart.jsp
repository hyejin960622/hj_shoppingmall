<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>
<style>
	.main .box-title{
		background-color: #ae8a68; border-radius: 5px;
		padding: 20px; box-shadow: 3px 3px 3px 0 rgba(73, 67, 60, 0.2);
		margin-bottom: 10px; font-size: 18px; font-weight: bold;
	}
	.main .box-title .fa-paw{margin-right: 6px;}
	.main .box-title .box-message{
		font-size: 12px; margin: 5px 0; padding-left: 24px;
	}
	.main .box-content{margin: 44px;}
	.main .box-content .box-cart table,
	.main .box-content .box-summary table{
		border-top: 2px solid #d7d5d5; border-bottom: 2px solid #d7d5d5;
		table-layout: fixed; font-size: 14px; text-align: center; 
	}
	.main .box-content .box-cart table thead th{padding: 12px 0;}
	.main .box-content .box-cart table tbody td{
		padding: 7px 0; vertical-align: middle;
	}
	.main .box-content .box-cart table tbody .item-thumb .gs_thumb{
		max-width: 92px; width: 92px;
	}
	.main .box-content .box-cart table tbody .item-name{
		overflow: hidden; text-overflow: ellipsis; white-space: nowrap; 
	}
	.main .box-content .box-cart table tbody .item-name .btn-change-option,
	.main .box-content .box-cart table tbody .item-count .btn-chage-count{
		padding: 5px; background-color: #a04c00;
		border: none; color: #fff7ed; border-radius: 3px;
		display: inline-block; margin-top: 5px;
	}
	.main .box-content .box-cart table tbody .item-count input{
		border: 1px solid #dfe0df; text-align: center; width: 50px;
	}
	.main .box-content .box-cart table tbody .item-btn .btn{
		padding: 5px; display: inline-block;
	}
	.main .box-content .box-cart table tbody .item-btn .btn:hover .icon{color: #FF9E54; cursor: pointer;}
	.main .box-content .box-cart .box-set .btn{
		padding: 2px 5px; background-color: white; 
		font-weight: bold; font-size: 12px; color: #a04c00;
		border: 1px solid #a04c00;  border-radius: 3px;
		display: inline-block; margin-bottom: 50px;
	}
	.main .box-content .box-cart .box-set .btn:hover{
		background-color: #a04c00; color: #fff7ed;
	}
	.main .box-content .box-summary table{font-size: 18px;}
	.main .box-content .box-btn button{
		display: inline-block; border: 1px solid #dfe0df; padding: 10px 20px;
		font-weight: bold; margin-top: 50px; width: 458px;
	}
	.main .box-content .box-btn button:hover{box-shadow: 2px 2px 3px #dfe0df;}
	.main .box-content .box-btn .btn-order-all{
		background-color: #fb9600; color: #fff7ed;
	}
	.main .box-content .box-btn .btn-order-select{background-color: #fff7ed;}
</style>
</head>
<!-- html ************************************************************************************************************ -->
<body>
<!-- 제목 --------------------------------------------------------------------------------------------------------- -->
<div class="box-title">
	<h2 class="text-center">CART</h2>
</div>
<!-- box-content ------------------------------------------------------------------------------------------------- -->			
<div class="box-content">
	<!-- box-cart ------------------------------------------------------------------------------------------------ -->
	<div class="box-cart">
		<table class="table list-cart">
			<!-- thead ----------------------------------------------------------------------------------------------------- -->
			<thead>
				<tr>
					<th width="27px">
						<input type="checkbox" class="checkAll">
					</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
					<th>삭제</th>
					<th></th>
				</tr>
			</thead>
			<!-- tbody ---------------------------------------------------------------------------------------------------- -->
			<tbody>
				
				<c:forEach items="${cartList}" var="cart">
	      <tr>
	      	<td >
						<input type="checkbox" class="check">
					</td>
	        <td>
	        	<img alt="이미지" src="<c:url value="${cart.pr_thumb_url}"></c:url>" width="100" height="100">
	        </td>
	        <td><a href="<c:url value="/product/select?pr_code=${cart.pr_code}"></c:url>">${cart.pr_name}</a></td>
	        
	        <td>${cart.pr_price_str}</td>
	        <td >
	        	<div class="table_text_align_center quantity_div">
							<input type="text" value="${cart.ca_count}" class="quantity_input col-2">	
							<button class="quantity_btn plus_btn">+</button>
							<button class="quantity_btn minus_btn">-</button>
						</div>
						<button class="quantity_modify_btn">변경</button>
	        </td>
	        <td>
						${cart.pr_price * cart.ca_count} 
					</td>
	        <td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
	        
	        
	        
	      </tr>
      </c:forEach>
			</tbody>
		</table>
		<!-- box-set ---------------------------------------------------------------------------------------------------- -->
		<div class="clearfix">
			<div class="box-set float-right">
				<a class="btn btn-select-delete mr-2" href="#">선택상품 삭제</a>
				<a class="btn btn-clearAll" href="#">장바구니 비우기</a>
			</div>
		</div>
	</div>
	<!-- box-summary ---------------------------------------------------------------------------------------------------- -->	
	<div class="box-summary">
		<table class="table">
			<!-- thead ----------------------------------------------------------------------------------------------------- -->
			<thead>
				<tr>
					<th>총 상품금액</th>
					<th>배송비</th>
					<th>결제예정금액</th>
				</tr>
			</thead>
			<!-- tbody ----------------------------------------------------------------------------------------------------- -->
		
		
		
		</table>
	</div>
	<!-- box-btn ------------------------------------------------------------------------------------------------------- -->
	<div class="box-btn">
		<button type="button" class="btn-order-all">전체상품주문</button>
		<button type="button" class="btn-order-select">선택상품주문</button>
	</div>	
</div>
</body>
<!-- script *********************************************************************************************************** -->
<script>
/* 변수 *********************************************************************************************************** */
/* 이벤트 *********************************************************************************************************** */
$(function(){
	$(document).ready(function(){
		editSummary();
	})//
	
	//체크박스 클릭하면(checkAll) ==================================================================================
	$('.main .box-content .box-cart table thead .checkAll').click(function () {
		//클릭된 체크박스의 체크 여부 확인
		let isChecked = $(this).prop('checked');
		//모든 체크박스에 적용
		$('input:checkbox').prop('checked', isChecked);
	})//
	
	//체크박스 클릭하면(check) ==================================================================================
	$('.main .box-content .box-cart table tbody .check').click(function () {
		// 클릭된 체크박스가 체크된 상태이면
		if($(this).is(':checked')){
			// 전체가 체크된 상태인지 확인
			let count = $('.main .box-content .box-cart table tbody .check').filter(':checked').length;
			let totalcount = $('.main .box-content .box-cart table tbody .check').length;
			// 전체가 체크됬으면 
			if(totalcount == count)
				$('.main .box-content .box-cart table thead .checkAll').prop('checked', true);
		}
		// 체크가 해제된 상태이면 
		else
			$('.main .box-content .box-cart table thead .checkAll').prop('checked', false);				
	})
});	


</body>
</html>