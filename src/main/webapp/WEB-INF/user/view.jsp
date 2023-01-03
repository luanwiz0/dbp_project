<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Customer customer = (Customer)request.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<style>
	a.main {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    cursor: pointer;
	    display: inline-block;
	    box-sizing: border-box;
	    padding: 0 11px;
	    font-size: 13px;
	    font-weight: 300;
	    text-decoration: none;
	    vertical-align: middle;
	    letter-spacing: -0.3px;
	    color: #4e4c4a;
	    text-align: center;
	    white-space: nowrap;
	    transition: 0.2s ease-in-out;
	    background-color: transparent;
	    border: 1px solid #eeeeee;
	    height: 40px;
	    line-height: 40px;
	    word-break: keep-all;
	    word-wrap: break-word;
	    margin-left: 0px;
	    width: 100px;
	}
	
	a.write {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    cursor: pointer;
	    display: inline-block;
	    box-sizing: border-box;
	    padding: 0 11px;
	    border: 1px solid transparent;
	    font-size: 13px;
	    font-weight: 300;
	    text-decoration: none;
	    vertical-align: middle;
	    letter-spacing: -0.3px;
	    text-align: center;
	    white-space: nowrap;
	    transition: 0.2s ease-in-out;
	    color: #ffffff;
	    background-color: #222222;
	    height: 40px;
	    line-height: 40px;
	    word-break: keep-all;
	    word-wrap: break-word;
	    margin-left: 6px;
	    width: 100px;
	}
</style>
<script>
function userRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div align="center">
	<br><br><br><br><br>
		<table width="800" cellpadding="0" cellspacing="0">
			<tr>
				<td width="800" height="50">
				<h2>회원 정보</h2>
				</td>
			</tr>
		</table>
		<br><br><br>
	    <table class="list" border="1" align="center">
	  	  <tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">아이디</td>
			<td style="border-left: 1px solid #eeeeee;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=customer.getCustomerId()%>
			</td>
		  </tr>
		  <tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">이름</td>
			<td style="border-left: 1px solid #eeeeee;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=customer.getName()%>
			</td>
		  </tr>
		  <tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">전화번호</td>
			<td style="border-left: 1px solid #eeeeee;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${customer.phone} <%-- <%=user.getPhone()%> --%>
			</td>
		  </tr>	
		  <tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">이메일</td>
			<td style="border-left: 1px solid #eeeeee;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${customer.email} <%-- <%=user.getEmail()%> --%>
			</td>
		  </tr>		  
	  	<tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">주소</td>
			<td style="border-left: 1px solid #eeeeee;">
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${customer.address} <%-- <%=user.getAddress()%> --%>
			</td>
		  </tr>	
	 	</table>
	 	<br>
	    <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${updateFailed || deleteFailed}">
	    	<font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>  
	    <table width="60%" cellpadding="0" cellspacing="0">
			<tr>
				<td height="30" align="left">
					<h3><a href="<c:url value='/user/list' />" class="main">목록</a> </h3>
				</td>
				<td height="30" align="right">
					<h3>
					<a href="<c:url value='/user/update'>
		     		<c:param name='customerId' value='<%=customer.getCustomerId()%>'/>
		     		</c:url>" class="write">수정</a>
				 	</h3>
				</td>
			</tr>
		</table>
 	    <br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>