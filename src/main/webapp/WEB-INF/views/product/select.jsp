<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
[name=file]{
	display: none;
}
.box-thumb{
	width: 150px; height: 150px; border:1px solid red;
	text-align: center; font-size : 50px; line-height: 148px;
	cursor: pointer; box-sizing: border-box;
}
.fa-regular{
	line-height: 1;
}
.display-none{
	display: none;
}
.wishlist{
	color : red; cursor: pointer;
}

a.btnNormal { 
border:1px solid black; color:#000; transition: all; display:inline-block; width:50%;  box-sizing: border-box;
}
a.btnNormal:hover  {background:#ddd; text-decoration:none;}

</style>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>
<body>
<div class="container text-center mt-3">
	<h2 class="clearfix">
		<span class="text-center">DETAIL</span> 
			<i class="fa-regular fa-heart float-right wishlist <c:if test="${wi != null }">display-none</c:if>"></i>
			<i class="fa-solid fa-heart float-right wishlist wishlist-ok <c:if test="${wi == null }">display-none</c:if>"></i>
	</h2>
	<div class="clearfix">
		<div class="float-left" style="width:auto; height: auto">
			<img id="preview" width="300" height="300" src="<c:url value="${p.pr_thumb_url}"></c:url>">
		</div>
		<div class="float-right" style="width:calc(100% - 300px - 20px)">
			<div class="form-group">
			  <input type="text" class="form-control" value="카테고리 : ${p.pr_ca_name }" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" value="상품코드 : ${p.pr_code }" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" value="가격 : ${p.pr_price_str }" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" value="${p.pr_name }" readonly>
			</div>
			<div class="button">
			
				<div class="button_quantity">
					<span>수량</span>
						<input type="text" class="quantity_input" value="1">
						<span>
							<button class="plus_btn">+</button>
							<button class="minus_btn">-</button>
						</span>
				</div>
				
				<div class="button_set mt-3">
					<button type="button" class="btn_buy col-4 ">BUY NOW</button>
					<button type="button" class="btn_cart col-4">ADD CART</button>
				</div>
			
			</div>
		</div>
	</div>
	<br>
	<div class="form-group">
	  <div class="form-control" style="height:auto">${p.pr_content }</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('.wishlist').click(function(){
		let wi_me_id = '${user.me_id}';
		if(wi_me_id == ''){
			if(confirm('로그인이 필요합니다. 로그인 화면으로 이동하겠습니까?'))
			location.href = '<%=request.getContextPath()%>/login';
			return;
		}
		let wi_pr_code = '${p.pr_code}';
		let wishlist = {
				wi_me_id : wi_me_id,
				wi_pr_code : wi_pr_code
		}
		ajaxPost(false, wishlist, '/wishlist', function(data){
			if(data.res == 0){
				$('.wishlist').removeClass('display-none');
				$('.wishlist-ok').addClass('display-none');
				alert('위시리스트를 취소했습니다')
			}else if(data.res == 1){
				$('.wishlist').addClass('display-none');
				$('.wishlist-ok').removeClass('display-none');
				alert('위시리스트에 담았습니다');
			}else{
				alert('잘못된 접근입니다.')
			}
		})
	})
})

	// 수량 버튼
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});
	
	
	//----------------------------
	$(function(){
		$('.btn_cart').click(function(){

			let ca_me_id = '${user.me_id}';
			if(ca_me_id == ''){
				if(confirm('로그인이 필요합니다. 로그인 화면으로 이동하겠습니까?'))
				location.href = '<%=request.getContextPath()%>/login';
				return;
			}	
			let ca_pr_code = '${p.pr_code}';
			let cart = {
					
					ca_me_id : ca_me_id,
					ca_pr_code : ca_pr_code,
					ca_count : $(".quantity_input").val()
					
			}
			ajaxPost(false, cart, '/put/cart', function(data){
				if(data.res == 1){
					if(confirm('장바구니에 담았습니다. 장바구니를 확인하겠습니까?'))
						location.href = '<%=request.getContextPath()%>/cart/list';
				}
				else if(data.res == 0){
					if(confirm('이미 장바구니에 담긴 상품이 있습니다. 장바구니를 확인하겠습니까?'))
						location.href = '<%=request.getContextPath()%>/cart/list';
				}		
				else
					alert('장바구니 담기에 실패했습니다. 다시 시도해주세요.')
			})
		})
	})


	
	
	
	
	
	





</script>
</body>
</html>