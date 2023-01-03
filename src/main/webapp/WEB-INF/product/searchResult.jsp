<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>검색 결과</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>검색 결과</th>
	</tr>
</table>
</div>
<div class="page" align="center">
	<table class="table1">
	<c:choose>
	<c:when test="${empty productList}">
		<tr>
			<td colspan="9" class="t0">검색 결과가 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
	<thead>
			<tr>
				<th class="t1">상품명</th>
				<th class="t1">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${productList}">
				<tr>
					<td class="t1">
					<a href="<c:url value='/product/view'>
							<c:param name='productId' value='${product.productId}'/>
							</c:url>">
					  	${product.name}</a>
					</td>
					<td class="t1">
						${product.price}
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</c:otherwise>
	</c:choose>
	</table>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>