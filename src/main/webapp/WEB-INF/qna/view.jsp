<!DOCTYPE html>
<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
<html>
<head>
<title>Q&A</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/qanda.css' />" type="text/css">
<style>
	h2 {
	    font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    font-size: 25px;
	    line-height: 30px;
	    font-weight: 300;
	    color: rgb(65, 74, 67);
	    font-color: #414a43;
	}
	
	.body{
		font-family:'Nunito Sans', 'Noto Sans KR', sans-serif;
		font-size:"5pt"; 
		font-weight:"bold"; 
	}
	
	table.list {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    font-weight: 400;
	    border-spacing: 0;
	    border-collapse: collapse;
	    line-height: 40px;
	    color: #4e4c4a;
	    font-size: 12px;
	    letter-spacing: -0.3px;
	    word-break: break-all;
    	word-wrap: break-word;
	    padding: 30px 0;
	    vertical-align: middle;
	    border-bottom: 1px solid #eeeeee;
	    width: 75%;
	    position: relative;
	    margin: 30px 0 0;
	    border: 1px solid #eeeeee;
	}
	
	tr {
		border: 1px solid #eeeeee;
	}
	a.reply {
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
	
	a.modify {
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
	    color: #4e4c4a;
	    text-align: center;
	    white-space: nowrap;
	    transition: 0.2s ease-in-out;
	    background-color: #eeeeee;
	    height: 40px;
	    line-height: 40px;
	    word-break: keep-all;
	    word-wrap: break-word;
	    margin-left: 6px;
	    width: 100px;
	}
	
	a.list, a.delete {
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
			<td width="800" height="50">&nbsp;&nbsp;<h2>Q&A</h2>&nbsp;&nbsp;</td>
		</tr>
	</table> 
	<br> 
			<table class="list" width="800" cellpadding="3" cellspacing="1">
		<tr>
			<td width="80" bgcolor="#C4C8CC" align="center"><font color="#ffffff"><b>Date</b></font></td>
			<td width="650" style="border:0px solid;">
			&nbsp&nbsp&nbsp&nbsp<%= qna.getCreationDate() %>
			</td>
		</tr>
		
		<tr>
			<td width="80" bgcolor="#C4C8CC" align="center"><font color="#ffffff"><b>Hits</b></font></td>
			<td width="650" style="border:0px solid;">
			&nbsp&nbsp&nbsp&nbsp<%= qna.getViewCount() %>
			</td>
		</tr>
		
		<tr>
			<td width="80" bgcolor="#C4C8CC" align="center"><font color="#ffffff"><b>Title</b></font></td>
			<td width="650" style="border:0px solid;">
			&nbsp&nbsp&nbsp&nbsp<%= qna.getTitle() %>
			</td>
		</tr>
		
		<tr>
			<td colspan='2' width="730" style="border:0px solid;" align="center" overflow="hidden" height="auto">
			<br><%=qna.getContent().replaceAll("\n","<br>") %><br><br>
			</td>
		</tr>
	</table>
	 	<br>
	    <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${updateFailed || deleteFailed}">
	    	<font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>  

		<table width="75%" cellpadding="3" cellspacing="1">
		<tr>
			<td width="80"align="left">
				<h3><a href="<c:url value='/qna/list' />" class="delete">LIST</a> </h3>
			</td>
			<td width="650" align="right">
				<a href="<c:url value='/qna/delete'/>" class="delete">DELETE</a>
				<a href="<c:url value='/qna/update'/>" class="modify">MODIFY</a>
				 <a href="<c:url value='/qna/reply'/>" class="reply">REPLY</a>
			</td>
		</tr>
	</table>
 	    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>