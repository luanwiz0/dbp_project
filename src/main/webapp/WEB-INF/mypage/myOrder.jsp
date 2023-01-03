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
		    <c:choose>
			<c:when test="${empty orderList}">
			
			<!-- 리스트가 비어있는 경우 -->
			<tr>
				<td colspan="9" class="t0">구매내역이 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
		    <tr>
			    <th>orderId</th>
			    <th>customerId</th>
			    <th>구매일</th>
			    <th>수령방법</th>
			    <th>수령인이름</th>
			    <th>수령인전화</th>
			    <th>메모</th>
			    <th>주소</th>
			    <th></th>
			</tr>
			
			<!-- 리스트가 비어있지 않은 경우 -->
			<c:forEach var="orderList" items="${orderList}">
			<tr>
			    <td>${orderList.orderId}</td>
				<td>${orderList.customerId}</td>
				<td>${orderList.creationDate}</td>
				<td>${orderList.receiveType}</td>
				<td>${orderList.receiverName}</td>
				<td>${orderList.receiverPhone}</td>
				<td>${orderList.memo}</td>
				<td>${orderList.receiverAddress}</td>
				<td><a href="<c:url value='/mypage/order/detail'>
			    				<c:param name='orderId' value='${orderList.orderId}'/>
			    			</c:url>">상세보기</a>
			    </td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
<br/></br><br/>
<jsp:include page="../main/footer.jsp" />
</body>
</html>