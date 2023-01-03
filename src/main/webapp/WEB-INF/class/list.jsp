<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function classDelete() {
	return confirm("정말 삭제하시겠습니까?");		
}
function reservationCheck(){
	if(confirm("해당 클래스를 예약하시겠습니까?")){
		alert("예약 성공!");}
	else{
		alert("예약을 취소하였습니다.");}
}
function reservationFail(){
	return confirm("로그인 해주세요.");	
}
</script>
<head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<title>클래스 목록</title>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<table class="text">
	<tr>
		<th>클래스 목록</th>
	</tr>
</table>
<div align="center">
	<table class="table1">
		<thead>
			<tr>
				<th class="t1">클래스 이름</th>
				<th class="t1">날짜</th>
				<th class="t1">현재인원</th>
				<th class="t1">전체인원</th>
				<th class="t1">&nbsp;</th> <!-- 예약 -->
				<th class="t1">&nbsp;</th> <!-- 수정 -->
				<th class="t1">&nbsp;</th> <!-- 삭제 -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="classInfo" items="${classList}">
				<tr>
					<td class="t1">
					  	${classInfo.name}
					</td>
					<td class="t1">
						${classInfo.date }
					</td>
					<td class="t1">
						${classInfo.currentNum }
					</td>
					<td class="t1"> 
						${classInfo.maxNum }
					</td>
					<td class="t1">
				<%
					String id = (String)session.getAttribute("customerId");
				%>
				<%
					if(id!=null){
				%>
				<a href="<c:url value='/class/reservation'>
						<c:param name='classId' value='${classInfo.classId}'/>
						</c:url>" onclick="return reservationCheck()">
					<button class="btn1" type="button" style="padding:2px 5px;">예약</button></a>
				<%
				}else {
				%>
				<a href="<c:url value='/class/reservation'>
						<c:param name='classId' value='${classInfo.classId}'/>
						</c:url>" onclick="return reservationFail()">
					<button class="btn1" type="button" style="padding:2px 5px;">예약</button></a>
				<% 
				} 
				%>
					</td>
					<td class="t1">
					<a href="<c:url value='/class/update'>
							<c:param name='classId' value='${classInfo.classId}'/>
							</c:url>">
					<button class="btn1" type="button" style="padding:2px 5px;">수정</button></a>
					</td>
					<td class="t1">
					<a href="<c:url value='/class/delete'>
							<c:param name='classId' value='${classInfo.classId}'/>
							</c:url>" onclick="return classDelete();">
						<button class="btn1" type="button" style="padding:2px 5px;">삭제</button> </a>
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	<div>&nbsp;</div>
	<div>
		<a href="<c:url value='/class/add'></c:url>">
			<button class="btn1" type="button">클래스 추가</button>
		</a>
	</div>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>