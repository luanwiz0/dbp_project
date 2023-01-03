<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
	<link rel=stylesheet href="<c:url value='/css/mypage.css' />" type="text/css">
</head>
<style>
table {
	margin:150px;
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
}
th, td {
	border: 1px solid #444444;
}
</style>
<body>
<jsp:include page="../main/header.jsp" />
<br/><br/>
<div class="box">
	<div class="boxLeft">
		<div class="p2">
			<span class="fontStyle">주문 관리</span><br/>
			<a href="<c:url value='/mypage/order'></c:url>">주문 내역 조회</a>
			<br/><br/><br/><br/>
			<span class="fontStyle">예약 관리</span><br/>
			<a href="<c:url value='/mypage/reservation'></c:url>">예약 내역 조회</a>
			<br/><br/><br/><br/>
			<span class="fontStyle">게시물 관리</span><br/>
			<a href="<c:url value='/mypage/post'></c:url>">나의 게시물</a>
			<br/><br/><br/><br/>
			<span class="fontStyle">개인정보 관리</span><br/>
			<a href="<c:url value='/user/update'></c:url>">회원정보 수정</a>
		</div>
	</div>
	<div>
		<table>
		    <tr>
			    <th>이름</th>
			    <th>수량</th>
			    <th>가격</th>
			</tr>
			<c:forEach var="lineItem" items="${lineItemList}">
				<tr>
					<td>${lineItem.productName}</td>
					<td>${lineItem.quantity}</td>
					<td>${lineItem.price}</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</div>
<br/></br><br/>
<jsp:include page="../main/footer.jsp" />
</body>
</html>