<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
</head>
<body>
<nav class="navbar bg-light">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/category"></c:url>">카테고리 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/product/list"></c:url>">상품등록</a>
    </li>
    <li class="nav-item">
       <a class="nav-link" href="<c:url value="/admin/notice/list"></c:url>">공지사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/qna/list"></c:url>">QnA</a>
    </li>
  </ul>
</nav>
</body>
</html>