<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CART</title>
</head>
<body>
<div class="box-title">
	<h2 class="text-center">CART</h2>
</div>
<div class="box-content">
	<div class="box-cart">
		<table class="table list-cart">
			<thead>
				<tr>
					<th >
						<div class="all_check_input_div">
							<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span"></span>
						</div>	
					</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th class="item-total">합계</th>
					<th>삭제</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>	
				<c:forEach items="${cartList}" var="cart">
	      <tr>
	     		<td class="cart_info_td">
	      		<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
						<input type="hidden" class="individual_bookPrice_input" value="${cart.pr_price_str}">
						<input type="hidden" class="individual_totalPrice_input" value="${cart.pr_price * cart.ca_count}">
						</td>
	        <td>
	        	<img alt="이미지" src="<c:url value="${cart.pr_thumb_url}"></c:url>" width="100" height="100">
	        </td>
	        <td><a href="<c:url value="/product/select?pr_code=${cart.pr_code}"></c:url>">${cart.pr_name}</a></td>
	        <td  class="item-price">${cart.pr_price_str}</td>
	       						
	        <td class="item-amount">
	        	<div class="table_text_align_center quantity_div">
							<input type="text" value="${cart.ca_count}" class="quantity_input col-2">	
							<button class="quantity_btn plus_btn">+</button>
							<button class="quantity_btn minus_btn">-</button>
						</div>
						<button class="quantity_modify_btn">변경</button>
	        </td>
	        
	        <td class="item-total">
	        	${cart.pr_price * cart.ca_count}
	        </td>
	        

	        <td class="delete_btn"><button>삭제</button></td> 
	      </tr>
      </c:forEach>
			</tbody>
		</table>
	</div>
</div>
		
	
	<div class="content_total_section">
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
			<tbody>
				<tr>
					<td><span class="totalPrice_span">70000</span> 원</td>
					<td><span class="delivery_price">3000</span>원</td>
					<td><span class="finalTotalPrice_span">70000</span> 원</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- box-btn ------------------------------------------------------------------------------------------------------- -->
	<div class="content_btn_section">
		<button type="button" class="btn-order-all">상품주문</button>
	</div>	
	

</body>
	


<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	
});	

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});
/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){
	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				
		}
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 100000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}



</script>







</html>