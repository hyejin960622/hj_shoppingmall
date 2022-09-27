<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-del{
	padding : 0; border: none; background-color: transparent; color : red;
}
form.btn:hover .btn-del{
	color : #fff;
}
form.btn{
	margin-bottom: 0;
}
</style>
</head>
<body>
<div class="container">
  <h2 class="text-center mt-2">PRODUCT LIST</h2>
  <a href="<c:url value="/admin/product/insert"></c:url>" class="btn btn-outline-warning float-right mb-2">상품등록</a>
  <form>
  	<div class="input-group mb-3">
  		<select class="form-control">
  			<option>카테고리</option>
  		</select>
		  <input type="text" class="form-control" placeholder="Search">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="submit">Go</button>
		  </div>
		</div>
  </form>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>이미지</th>
        <th>카테고리</th>
        <th>상품코드</th>
        <th>상품명</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="pro">
	      <tr>
	        <td>
	        	<img alt="이미지" src="<c:url value="${pro.pr_thumb_url}"></c:url>" width="100" height="100">
	        </td>
	        <td>${pro.pr_ca_name}</td>
	        <td>${pro.pr_code}</td>
	        <td>
	        	<a href="<c:url value="/product/select?pr_code=${pro.pr_code}"></c:url>">${pro.pr_name}</a>
	        </td>
	        <td>${pro.pr_price}</td>
	        <td>
	        	<form class="btn btn-outline-danger" action="<c:url value="/admin/product/delete"></c:url>"  method="post">
	        		<button class="btn-del">삭제</button>
	        		<input type="hidden" name="pr_code" value="${pro.pr_code}">
	        	</form>
	        	<a class="btn btn-outline-warning" href="<c:url value="/product/update?pr_code=${pro.pr_code}"></c:url>">수정</a>
	        </td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
  <ul class="pagination justify-content-center">
  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
  		<a class="page-link" href="<c:url value="/admin/product/list?page=1&search=${pm.cri.search}&pr_ca_name=${pm.cri.pr_ca_name}"></c:url>"><<</a>
  	</li>
  	<li class="page-item <c:if test="${!pm.prev}">disabled</c:if>">
  		<a class="page-link" href="<c:url value="/admin/product/list?page=${pm.startPage-1}&search=${pm.cri.search}&pr_ca_name=${pm.cri.pr_ca_name}"></c:url>">Prev</a>
  	</li>

  	<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
    	<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
    		<a class="page-link" href="<c:url value="/admin/product/list?page=${i}&search=${pm.cri.search}&pr_ca_name=${pm.cri.pr_ca_name}"></c:url>">${i}</a>
    	</li>
    </c:forEach>

    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
    	<a class="page-link " href="<c:url value="/admin/product/list?page=${pm.endPage+1}&search=${pm.cri.search}&pr_ca_name=${pm.cri.pr_ca_name}"></c:url>">Next</a>
    </li>
    <li class="page-item <c:if test="${!pm.next}">disabled</c:if>">
    	<a class="page-link" href="<c:url value="/admin/product/list?page=${pm.finalPage}&search=${pm.cri.search}&pr_ca_name=${pm.cri.pr_ca_name}"></c:url>">>></a>
    </li>
  </ul>
  
  
</div>
</body>
</html>