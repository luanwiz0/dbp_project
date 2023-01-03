<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function updateProduct(){
	if(form.name.value == ""){
		alert("상품 이름을 입력하세요.");
		form.name.focus();
		return false;
	}
	if(form.price.value == ""){
		alert("상품 가격을 입력하세요.");
		form.price.focus();
		return false;
	}
	form.submit();
}
</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>상품 정보 수정</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>상품 정보 수정</th>
	</tr>
</table>
</div>
<div align="center">
	<form name="form" method="POST" action="<c:url value='/product/update'/>">
		<input type="hidden" name="productId" value="${product.productId}"/>
		<input type="hidden" name="sellerId" value="${product.sellerId}"/>
		<table class="table1">
			<tr>
				<td class="t1"><label for="name">상품 이름</label></td>
				<td class="t1"><input type="text" name="name" value="${product.name}"></td>
			</tr>
			<tr>
				<td class="t1"><label for="price">상품 가격</label></td>
				<td class="t1"><input type="text" name="price" value="${product.price}"></td>
			</tr>
			<tr>
				<td class="t1"><label for="description">상품 설명</label></td>
				<td class="t1"><input type="text" name="description" value="${product.description}"></td>
			</tr>
			<tr>
				<td class="t1"><label for="type">종류 선택</label></td>
				<td class="t1"><select name="type">
					<option value="food" <c:if test="${product.type eq 'food'}">selected="selected"</c:if>>
					음식</option>
					<option value="flower" <c:if test="${product.type eq 'flower'}">selected="selected"</c:if>>
					꽃</option>
				</select></td>
			</tr>
			<tr>
				<td class="t1"><label for="category">카테고리</label></td>
				<!-- 이후 select 등으로 변경 -->
				<td class="t1"><input type="text" name="category" value="${product.category}"></td>
			</tr>
		</table>
		<br>
		<div>
			<button class="btn1" type="button" onClick="updateProduct()">수정</button>
		</div>
	</form>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>