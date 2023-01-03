<%@page contentType="text/html; charset=utf-8" %>
<%-- <%@page import="java.util.*, model.*" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Q&A</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/qanda.css' />" type="text/css">
<style>
	a.list {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
		text-align: center;
		text-decoration: none;
		color: inherit;
		a:hover { color: gray; }
	}
	
	h2 {
	    font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    font-size: 25px;
	    line-height: 30px;
	    font-weight: 300;
	    color: rgb(65, 74, 67);
	    font-color: #414a43;
	}
	
	table.list {
		font-family: 'Nunito Sans', 'Noto Sans KR', sans-serif;
	    font-weight: 400;
	    border-spacing: 0;
	    border-collapse: collapse;
	    line-height: 60px;
	    color: #4e4c4a;
	    font-size: 13px;
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
	    margin-left: 6px;
	    width: 100px;
	}
</style>
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
	<table class="list" width="800" cellpadding="4" cellspacing="1">
		<tr>
			<td width="50"  align="center" height="30" bgcolor="#C4C8CC"><font color="#ffffff"><b>No.</b></font></td>
			<td width="400" align="center" bgcolor="#C4C8CC"><font color="#ffffff"><b>Title</b></font></td>
			<td width="100" align="center" bgcolor="#C4C8CC"><font color="#ffffff"><b>Name</b></font></td>
			<td width="100" align="center" bgcolor="#C4C8CC"><font color="#ffffff"><b>Date</b></font></td>
			<td width="70" align="center" bgcolor="#C4C8CC"><font color="#ffffff"><b>Hits</b></font></td>
		</tr>

	<c:forEach var="qna" items="${qnaList}">  			  	
  		<tr>
			<td align="center" width="150" height="50">
				${qna.qnaId}
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
				<a href="<c:url value='/qna/view'>
					<c:param name='qnaId' value='${qna.qnaId}'/></c:url>" class="list">
			  	${qna.title}</a>
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
		    	${qna.customerId}
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
		    	${qna.creationDate}
		  	</td>
		  	<td align="center" width="150" height="50" style="border-left: 1px solid #eeeeee;">
		    	${qna.viewCount}
		  	</td>
		</tr>
	  	</c:forEach> 
<%--
	  }
	}
--%>	 
	</table>	  	 
	<br>
	<table width="75%" cellpadding="0" cellspacing="0" >
		<tr>
		<td height="30" align="left">
			<h3></h3><a class="main" href="../main/main.jsp">MAIN</a></h3>
		</td>
		<td height="30" align="right">
			<h3><a href="<c:url value='/qna/register' />" class="write">WRITE</a></h3>
		</td>
		</tr>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
</div> 
<jsp:include page="../main/footer.jsp" />
</body>
</html>