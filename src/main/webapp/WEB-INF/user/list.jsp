<%@page contentType="text/html; charset=utf-8" %>
<%-- <%@page import="java.util.*, model.*" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	@SuppressWarnings("unchecked") 
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");
--%>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<style>
	a.list {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
		text-align: center;
		text-decoration: none;
		color: inherit;
		a:hover { color: gray; }
	}
	
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
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div align="center">
<br><br><br><br>
	<table width="800" cellpadding="0" cellspacing="0">
		<tr>
			<td width="800" height="50">&nbsp;&nbsp;<h2>회원 목록</h2>&nbsp;&nbsp;</td>
		</tr>
	</table> 
	<br> 
	<table class="list" border="1" align="center">
		<tr>
			<td align="center" width="150" height="50" bgcolor="#eeeeee">아이디</td>
			<td align="center" width="150" height="50" bgcolor="#eeeeee" style="border-left: 1px solid #eeeeee;">이름</td>
			<td align="center" width="150" height="50" bgcolor="#eeeeee" style="border-left: 1px solid #eeeeee;">전화번호</td>
		</tr>
<%-- 
	if (userList != null) {	
	  Iterator<User> userIter = userList.iterator();
	
	  //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	  while ( userIter.hasNext() ) {
		User user = (User)userIter.next();
--%>	  	
	<c:forEach var="customer" items="${customerList}">  			  	
  		<tr>
			<td align="center" width="150" height="50">
		  		<a href="<c:url value='/user/view'>
					<c:param name='customerId' value='${customer.customerId}'/></c:url>" class="list">
				${customer.customerId}</a>	<%-- <%=user.getUserId()%> --%>
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
				<a href="<c:url value='/user/view'>
					<c:param name='customerId' value='${customer.customerId}'/></c:url>" class="list">
			  	${customer.name}</a>	<%-- <%=user.getName()%></a> --%>
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
		    	${customer.phone}	<%-- <%=user.getPhone()%> --%>
		  	</td>
		</tr>
	  	</c:forEach> 
<%--
	  }
	}
--%>	 
	</table>	  	 
	<br>
	<table width="60%" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30" align="left">
				<h3><a href="<c:url value='/user/logout' />" class="main">로그아웃<!--(&nbsp;${curUserId}&nbsp;)--></a></h3>
			</td>
			<td height="30" align="right">
				<h3><a href="<c:url value='/user/register' />" class="write">회원 추가</a></h3>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br> 
</div> 
<jsp:include page="../main/footer.jsp" />
</body>
</html>