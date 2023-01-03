<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function productDelete() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>상품 목록</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>상품 목록</th>
	</tr>
</table>
</div>
<div align="center">
<div>상품 이름을 클릭하면 상세 정보를 확인할 수 있습니다.</div><div>&nbsp;</div>
	<table class="table1">
		<thead>
			<tr>
				<th class="t1">상품명</th>
				<th class="t1">가격</th>
				<th class="t1">&nbsp;</th> <!-- 수정 -->
				<th class="t1">&nbsp;</th> <!-- 삭제 -->
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
					<td class="t1">
					<a href="<c:url value='/product/update'>
							<c:param name='productId' value='${product.productId}'/>
							</c:url>">
					  	<button class="btn3" type="button">수정</button></a>
					</td>
					<td class="t1">
					<a href="<c:url value='/product/delete'>
							<c:param name='productId' value='${product.productId}'/>
							</c:url>" onclick="return productDelete();">
					  	<button class="btn3" type="button">삭제</button></a>
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	<div>&nbsp;</div>
	<a href="<c:url value='/product/add'></c:url>">
		<button class="btn1" type="button">상품 추가</button>
	</a>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>