<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div class="container-fluid clearfix container-admin">
		<div class="col-3 float-left container-menu" style="min-height: 300px">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="col-9 float-right">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
	

</body>
</html>