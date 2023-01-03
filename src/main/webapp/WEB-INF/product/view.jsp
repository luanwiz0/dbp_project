<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>상품 상세 정보</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>상품 정보</th>
	</tr>
</table>
</div>
<div align="center">
	<table class="table1">
		<tr>
			<th class="t1">상품명</th>
			<td class="t1">${product.name}</td>
		</tr>
		<tr>
			<th class="t1">가격</th>
			<td class="t1">${product.price }</td>
		</tr>
		<tr>
			<th class="t1">설명</th>
			<td class="t1">${product.description }</td>
		</tr>
	</table>
	<div>&nbsp;</div>
	<c:if test="${product.type eq 'flower'}">
	<div>
		<a href="<c:url value='/cart/add'>
		<c:param name='productId' value='${product.productId}'/></c:url>">
			<button class="btn1" type="button">장바구니에 담기</button>
		</a>
	</div>
	</c:if>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>