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

</style>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<div class="container">
	<h2  class="text-center mb-2 mt-2">상세설명</h2>
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
</body>
</html>