<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function searchProduct(){
	if(form.name.value == ""){
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}
	form.submit();
}
</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>상품 검색</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>상품 검색</th>
	</tr>
</table>
</div>
<div align="center">
	<form name="form" method="POST" action="<c:url value='/product/search'/>">
		<div>검색할 상품의 이름을 입력하세요.</div>
		<div>&nbsp;</div>
		<div><input type="text" name="name" style="width:600px;font-size:20px;"></div>
	</form>
	<div>&nbsp;</div>
	<button class="btn1" type="button" onClick="searchProduct()">검색</button>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<jsp:include page="../main/footer.jsp" />
</body>
</html>