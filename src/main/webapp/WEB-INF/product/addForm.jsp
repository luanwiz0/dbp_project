<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function addProduct(){
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
<title>상품 추가</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>상품 추가</th>
	</tr>
</table>
</div>
<div align="center">
	<form name="form" method="POST" action="<c:url value='/product/add'/>">
		<table class="table1">
			<tr>
				<td class="t1">상품 이름</td>
				<td class="t1"><input type="text" name="name" placeholder="상품 이름"></td>
			</tr>
			<tr>
				<td class="t1">상품 가격</td>
				<td class="t1"><input type="text" name="price" placeholder="상품 가격"></td>
			</tr>
			<tr>
				<td class="t1"><label for="description">상품 설명</label></td>
				<td class="t1"><input type="text" name="description" placeholder="상품 설명"></td>
			</tr>
			<tr>
				<td class="t1">종류 선택</td>
				<td class="t1"><select name="type">
					<option value="food">음식</option>
					<option value="flower">꽃</option>
				</select></td>
			</tr>
			<tr>
				<!-- 이후 select 등으로 변경 -->
				<td class="t1"><label for="category">카테고리</label></td>
				<td class="t1"><input type="text" name="category" placeholder="카테고리"></td>
			</tr>
		</table>
	</form>
	<br>
	<div>
		<button class="btn1" type="button" onClick="addProduct()">추가</button>
	</div>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>