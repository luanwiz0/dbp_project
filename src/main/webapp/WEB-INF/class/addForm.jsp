<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function addClass(){
	if(form.name.value == ""){
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	}
	form.submit();
}
</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>클래스 추가</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>클래스 추가</th>
	</tr>
</table>
</div>
<div align="center">
	<form name="form" method="POST" action="<c:url value='/class/add'/>">
		<table class="table1">
		<tr>
			<td class="t1"><label for="name">클래스 이름</label></td>
			<td class="t1"><input type="text" name="name" placeholder="상품 이름"></td>
		</tr>
		<tr>
			<td class="t1"><label for="date">날짜</label></td>
			<td class="t1"><input type="date" name="date"></td>
		</tr>
		<tr>
			<td class="t1"><label for="maxNum">최대인원</label></td>
			<td class="t1"><input type="number" name="maxNum"></td>
		</tr>
		</table>
	</form>
	<br>
	<div>
		<button class="btn1" type="button" onClick="addClass();">추가</button>
	</div>
</div>
<br><br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>