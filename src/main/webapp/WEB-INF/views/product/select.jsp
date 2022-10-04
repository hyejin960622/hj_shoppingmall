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
			  <input type="text" class="form-control" value="가격 : ${p.pr_price }" readonly>
			</div>
			<div class="form-group">
			  <input type="text" class="form-control" value="${p.pr_name }" readonly>
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
			alert('로그인이 필요한 서비스입니다.');
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
</script>
</body>
</html>