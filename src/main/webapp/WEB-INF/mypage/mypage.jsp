<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
	<link rel=stylesheet href="<c:url value='/css/mypage.css' />" type="text/css">
<style>
table {
	background-color:rgba(255, 250.9, 214.6, 1);
	margin:auto;
	width: 400px;
    border: 1px solid #444444;
    border-collapse: collapse;
	height:111px;
}
th, td {
padding:10px;
	border-left: 1px solid #444444;
}
tr {
	bgcolor:rgba(255, 250.9, 214.6, 1);
}
</style>
</head>
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
	
	<div class="boxRight">
    <div class="boxTop">
	   <img src="<c:url value='/images/profile.png' />" /><br/>
	   <span class="welcome">000님 안녕하세요!</span>
    </div>
    
    <div class="boxBottom">
      <div class="fontStyle">나의 현황</div>
      	<table>
      		<tr>
	      		<th>상품 주문</th>
	      		<th>클래스 예약</th>
	      		<th>QnA 작성</th>
      		</tr>
      		<tr>
	      		<td>${orderCnt}</td>
	      		<td>${reservCnt}</td>
	      		<td>${qnaCnt}</td>
      		</tr>
      	</table>
    </div>   
  </div>
</div>
<br/></br><br/>
<jsp:include page="../main/footer.jsp" />
</body>
</html>