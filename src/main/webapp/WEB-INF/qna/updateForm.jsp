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
		font-family:"굴림";
		font-size:"5pt"; 
		font-weight:"bold"; 
	}

	.hidden {
	
	    display:none;
	
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
	
	input.write {
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
	
	a.cancel {
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
<script type="text/javascript">
	function fnUpdate(num){
		var frm = document.boardForm;
		frm.num.value = num;
		frm.action = "qandaProc.jsp";
		frm.submit();
	}
	
    function validate() {
        if(boardForm.content.value=="") {
            alert("내용을 입력하세요.");
            boardForm.content.focus();
            return false;
        }
        
        if(boardForm.password.value=="") {
            alert("비밀번호를 입력하세요.");
            boardForm.password.focus();
            return false;
        }
    }
function qnaModify() {
	if (form.content.value == "") {
		alert("내용을 입력하십시오.");
		form.content.focus();
		return false;
	}
	alert('수정되었습니다.');
	form.submit();
}

function qnaList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div align="center">
<form name="form" method="POST" action="<c:url value='/qna/update' />">
<br><br><br><br><br><br><br>
  <input type="hidden" name="customerId" value="${qna.customerId}"/>	  
		<table width="800" cellpadding="0" cellspacing="0">
			<tr>
				<td width="800" height="50">
				<h2>Q&A</h2>
				</td>
			</tr>
		</table>
	    <br>	
	    ${customer.pwd}  
	    	<table class="list" width="800" cellpadding="3" cellspacing="1">
	
		<tr class="hidden">
			<td width="80" class="label" align="center" ><font color="#ffffff"><b>작성자</b></font></td>
			<td width="800" style="border:1px solid;" >
			<input type="text" name="writer" value="${qna.customerId}"  class="input">
			</td>
		</tr>
		<tr>
			<td width="80" class="label" align="center"><font color="#ffffff"><b>Title</b></font></td>
			<td width="800" style="border:0px solid;">
			&nbsp&nbsp&nbsp&nbsp<input type="text" name="title" value="${qna.title}" class="input" style="vertical-align:middle;" readonly>
			</td>
		<tr>
			<td colspan='2' width="680" style="border:0px solid;">
			<textarea name="content" class="textarea">${qna.content}</textarea>
			</td>
		</tr>
		<tr class="hidden">
			<td width="80" class="label" align="center"><font color="#ffffff"><b>PASSWORD</b></font></td>
			<td width="800" style="border:1px solid;">
			<input type="password" name="pwd" value="${qna.pwd}" class="input">
			</td>
		<tr>
		<tr>
			<td width="80" class="label" align="center" ><font color="#ffffff"><b>SECRET</b></font></td>
			<td width="800" style="border:0px solid;" >
			&nbsp&nbsp&nbsp&nbsp<input name="secret" type="radio" value="Y" onclick="return false">공개글
			&nbsp<input name="secret" type="radio" value="N" checked onclick="return false">비밀글
			</td>
		</tr>
	</table>
	    <br>
		<c:if test="${registerFailed}">
	    	<font color="red"><c:out value="${exception.getMessage()}"/></font>
	    </c:if>
		<h3 align="center">
			<input type="button" class="joinus" value="WRITE" onClick="qnaModify()">
		</h3>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</form>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>