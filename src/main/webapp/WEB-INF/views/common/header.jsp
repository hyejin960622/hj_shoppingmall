<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>    
<head>
<script src="https://kit.fontawesome.com/54655ef201.js" crossorigin="anonymous"></script>
<style>
.member .dropdown-toggle::after{
	display: none;
}
.fa-regular{
	line-height: 1.5;
}
.fa-solid{
	line-height: 1.5;
}
.navbar-brand{
 textalin-ceter;
}

</style>
</head> 
<nav class="navbar navbar-expand-md bg-light navbar-light">
	<div class="container">
	  	<a class="navbar-brand" href="<c:url value="/"></c:url>">쇼핑몰</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
    	<ul class="navbar-nav">
      	<li class="nav-item dropdown member">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa-regular fa-user"></i></a>
			    <div class="dropdown-menu">
			      <c:if test="${user == null }">
				      <a class="dropdown-item" href="<c:url value="/signup"></c:url>">회원가입</a>
				      <a class="dropdown-item" href="<c:url value="/login"></c:url>">로그인</a>
			      </c:if>
			      <c:if test="${user != null }">
				      <a class="dropdown-item" href="<c:url value="/mypage"></c:url>">회원정보수정</a>
				      <a class="dropdown-item" href="<c:url value="/logout"></c:url>">로그아웃</a>
			      </c:if>
			    </div>
			  </li>
      	<li class="nav-item">
        	<a class="nav-link" href="#"><i class="fa-solid fa-magnifying-glass"></i></a>
      	</li>
      	<li class="nav-item">
        	<a class="nav-link" href="#">shop</a>
      	</li>  
	    	</ul>
		</div> 
	</div> 
</nav>