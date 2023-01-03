<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function updateClass(){
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
<title>클래스 정보 수정</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div>
<table class="text">
	<tr>
		<th>클래스 정보 수정</th>
	</tr>
</table>
</div>
<div align="center">
	<form name="form" method="POST" action="<c:url value='/class/update'/>">
		<input type="hidden" name="classId" value="${classInfo.classId}">
		<input type="hidden" name="sellerId" value="${classInfo.sellerId}">
		<table class="table1">
		<tr>
			<td class="t1"><label for="name">클래스 이름</label></td>
			<td class="t1"><input type="text" name="name" value="${classInfo.name}"></td>
		</tr>
		<tr>
			<td class="t1"><label for="date">날짜</label></td>
			<td class="t1"><input type="date" name="date" value="${classInfo.date}"></td>
		</tr>
		<tr>
			<td class="t1"><label for="maxNum">최대인원</label></td>
			<td class="t1"><input type="number" name="maxNum" value="${classInfo.maxNum}"></td>
		</tr>
		<tr>
			<td class="t1"><label for="currentNum">현재인원</label></td>
			<td class="t1"><input type="number" name="currentNum" value="${classInfo.currentNum}"></td>
		</tr>
		</table>
		<br>
		<div>
			<button class="btn1" type="button" onClick="updateClass()">수정</button>
		</div>
	</form>
</div>
<br><br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>