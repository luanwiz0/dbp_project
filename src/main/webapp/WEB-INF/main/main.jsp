<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
</head>
<style>
.main-view{
      margin: auto;
      margin-bottom: 20px;
      margin-top: 00px;
    text-align: center;
}
.main-view{height:620px;overflow:hidden;}	/*img 높이 조절*/
    .main-view ul{width:calc(100% * 4);display:flex;animation:slide 12s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .main-view li{width:calc(100% / 4);height:400px;}
    
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
</style>
<body>
	<jsp:include page="../main/header.jsp" />

	<!-- 메인 이미지 -->	
    <div class="main-view">
        <ul>
            <li><img src="../images/f1.jpg " width="100%" /></li>
            <li><img src="../images/f2.jpg"width="100%"/></li>
            <li><img src="../images/f4.jpg"width="100%"/></li>
        	<li><img src="../images/f3.jpg"width="100%"/></li>
    	</ul>
	</div>
	<br/></br>
	<div align="center">언제나 꽃과 함께,<br/><br/>
	Flo:be<br/><br/>
	방문해주셔서 감사합니다. <br/><br/>
	</div>
	<br/><br/><br/>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>