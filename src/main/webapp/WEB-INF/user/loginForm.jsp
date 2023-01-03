<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function login() {
	if (form.customerId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.customerId.focus();
		return false;
	} 
	if (form.pwd.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.pwd.focus();
		return false;
	}		
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.method="GET";		// register form 요청
	form.submit();
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div align="center">
<form name="form" method="POST" action="<c:url value='/user/login' />">
<br><br><br><br><br>
	<table class="login1" border="1" align="center" style="border: 1px solid white;">
	<br>
		<tr>
			<td width="500" bgcolor="ffffff" align="center">
				<h2><br><br>로그인<br><br></h2>
				<input type="text" style="width:400" name="customerId" placeholder="  아이디">
				<br>
				<input type="password" style="width:400" name="pwd" placeholder="  비밀번호">
				<br>
				<!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
				    <c:if test="${loginFailed}">
						<font color="red"><c:out value="${exception.getMessage()}"/></font>
					</c:if>	
				<h3 align="center"><input type="button" class="login2" value="로그인" onClick="login()"></h3>
				<br>
			</td>
		</tr>
	<br>
	</table>
	<table class="login1" border="1" align="center">
		<tr>
			<td width="500" bgcolor="ffffff" align="center">
				<br>
				<h2 align="center">아직 회원이 아니신가요?</h2>
				<h1>회원가입을 하시면 회원에게만 제공되는 다양한 혜택과</h1>
				<h1>이벤트에 참여하실 수 있습니다.</h1>
				<h3 align="center">
					<input type="button" class="joinus" value="회원가입" onClick="userCreate('<c:url value='/user/register'/>')">
					<br><br>
				</h3>
			</td>
		</tr>
	</table>
	<br>
	 
	<br><br><br><br><br><br><br><br><br><br><br>
</form>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>