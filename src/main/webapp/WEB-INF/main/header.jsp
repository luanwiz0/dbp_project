<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script>
function loginFailed(){
	return confirm("로그인 해주세요.");	
}
</script>
<head>
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
	<link rel=stylesheet href="<c:url value='/css/main.css' />" type="text/css">
</head>
<body style="overflow-x: hidden">
<div class=page>
	<div class=header>
	    <div class=headerFrame>
	      <span class="logo">
	      	<a href="<c:url value='/main/view'></c:url>">Flo:be</a>
	      </span>
	      <div class=menuFrame>
	        <div class=topMenu>
		       
<%
	String id = (String)session.getAttribute("customerId");
%>
<%
	if(id!=null){
		%>
				<span class="login">
		<%=id %> 님
					<a href="<c:url value='/user/logout'></c:url>">로그아웃</a>
				</span>
		<%
	}else {
		//center에 값이 존재하는 경우에만 로그인버튼을 띄움.
		//처리를 안해주고 로그인 버튼을 누를시 LoginForm.jsp로 넘어가면 Top.jsp에 있는 로그인 버튼이 그대로 나옴.
		%>
				<span class="login">
					<a href="<c:url value='/user/login/form'></c:url>">로그인</a>
				</span>
		        <span class="join">
		        	<a href="<c:url value='/user/register'></c:url>">회원가입</a>
		        </span>
		<% 
	} 
	%>
	<%
	if(id!=null){
	%>
		        <span class="mypage">
		        	<a href="<c:url value='/mypage/view'></c:url>">마이페이지</a>
		        </span>
		        <span class="cart">
		       		<a href="<c:url value='/cart/view'></c:url>">장바구니</a>
		        </span>
	<%
	}else {
		//center에 값이 존재하는 경우에만 로그인버튼을 띄움.
		//처리를 안해주고 로그인 버튼을 누를시 LoginForm.jsp로 넘어가면 Top.jsp에 있는 로그인 버튼이 그대로 나옴.
	%>  
				<span class="mypage">
		        	<a href="<c:url value='/mypage/view'></c:url>" onclick="return loginFailed()">마이페이지</a>
		        </span>
		        <span class="cart">
		       		<a href="<c:url value='/cart/view'></c:url>" onclick="return loginFailed()">장바구니</a>
		        </span>
	<% 
	} 
	%>
	        </div>
	        <div class=menu id="menu">
	        <ul>
		        <li class="store">
		        	<a href="<c:url value='/main/store'></c:url>">STORE</a>
		        </li> 
		        <li class="food">
		        	<a href="<c:url value='/product/list?type=food'></c:url>">FOOD</a>
		        </li>
		        <li class="flower">
		        	<a href="<c:url value='/product/list?type=flower'></c:url>">FLOWER</a>
		        </li>
		        <li class="class">
		        	<a href="<c:url value='/class/list'></c:url>">CLASS</a>
		        </li>
		        <li class="commu">
		        	<a href="#">COMMUNITY</a>
			        	<ul>
			        		<li><a href="<c:url value='/qna/list'></c:url>">Q&amp;A</a></li>
			        		<li><a href="#">후기</a></li>
			        	</ul>
		        </li>
		        <li class="search">
		        	<a href="<c:url value='/product/search'></c:url>">SEARCH</a>
		        </li>
	        </ul>
	        </div>
	      </div>
	    </div>
	</div>
</div>
</body>
</html>