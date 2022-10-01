<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<div class="container">
	<h2 class="text-center mt-1">NOTICE</h2>
	<div class="form-group">
	  <input type="text" class="form-control" value="제목 : ${bo.bd_title}">
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" value="작성자 : ${bo.bd_me_id}">
	</div>
	<div class="form-group">
	  <input type="text" class="form-control" value="작성일 : ${bo.bd_reg_date_str}">
	</div>
	<div class="form-group">
	  <div class="form-control" style="height:auto; min-height: 300px">${bo.bd_content}</div>
	</div>
</div>
</body>
</html>