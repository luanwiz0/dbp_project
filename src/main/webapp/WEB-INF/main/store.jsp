<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
</head>
<body>
<jsp:include page="../main/header.jsp" />
<br/><br/><br/>
<div align="center">
	<h2>Flo:be 소개</h2><br/><br/>
	<p>안녕하세요. <br/><br/>동덕여자대학교 2022-2 데이터베이스프로그래밍 (01-4)팀, GAILARDIA입니다.</p><br/>
	<p>저희는 플라워 카페의 상품 주문 및 클래스 예약 서비스를 주제로 프로젝트를 진행했습니다.</p><br/>
	<p>Flo:be는 플라워 카페의 홍보, 판매, 상품 주문 및 클래스 예약을 통합한 하나의 홈페이지입니다.</p><br/><br/>
	<img src="<c:url value='/images/icons8-flower-100.png' />" /><br/><br/>
	<h2>개발 배경 및 목적</h2><br/><br/>
	<p>대다수의 플라워 카페는 블로그나 SNS를 통해 홍보하고 주문 및 클래스 예약을 하려면 별도로 문의해야 하는 번거로움이 있습니다.</p><br/>
	<p>SNS를 하지 않는 소비자는 접근하기 어렵고 운영 시간, 가격 등 정확한 정보가 명시되어 있지 않아 정보를 획득하는데도 어려움이 있습니다. </p><br/>
	<p>이러한 파편화된 운영 환경을 하나로 통합하여 고객의 번거로움, 판매자의 운영 및 관리의 불편함을 해소하여</p><br/>
	<p>플라워 카페에 대한 소비자의 접근성을 증가시키고 꽃 시장의 발전에 도움이 되길 바라면서 개발하였습니다.</p><br/>
	<br/></br>
	<i><a target="_blank" href="https://icons8.com/icon/WesMBYvcOgBp/flower">Flower</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a></i>
</div>
<br/></br><br/>
<jsp:include page="../main/footer.jsp" />
</body>
</html>