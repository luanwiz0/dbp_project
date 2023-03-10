<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function userCreate() {
	var customerIdExp = /^[a-z0-9]{4,16}$/;
	if(customerIdExp.test(form.customerId.value)==false) {
		alert("아이디 형식이 올바르지 않습니다.");
		form.customerId.focus();
		return false;
	}
	
    var pwdExp = /^[a-zA-Z0-9#?!@$%^&*-]{8,16}$/;
    if(pwdExp.test(form.pwd.value)==false) {
    	alert("비밀번호 형식이 올바르지 않습니다.");
    	form.pwd.focus();
    	return false;
    }
    
	if (form.pwd.value != form.pwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.pw2.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
		
	var phone1Exp = /^\d{2,3}$/;
	if(phone1Exp.test(form.phone1.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone1.focus();
		return false;
	}
	
	var phone2Exp = /^\d{3,4}$/;
	if(phone2Exp.test(form.phone2.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone2.focus();
		return false;
	}
	
	var phone3Exp = /^\d{4}$/;
	if(phone3Exp.test(form.phone3.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone3.focus();
		return false;
	}

	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}

	if (form.addr1.value == "") {
		alert("주소를 입력하십시오.");
		form.addr1.focus();
		return false;
	}
	if (form.addr2.value == "") {
		alert("주소를 입력하십시오.");
		form.addr2.focus();
		return false;
	}
	if (form.addr3.value == "") {
		alert("주소를 입력하십시오.");
		form.addr3.focus();
		return false;
	}
	
	alert('회원가입이 완료되었습니다. 환영합니다.');
	form.submit();
}

function userList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            	extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
            	extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
            	extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                     
            document.getElementById("sample4_engAddress").value = data.addressEnglish;
                                   
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
            	document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
            	document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
            	var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
            	var expJibunAddr = data.autoJibunAddress;
            	guideTextBox.innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp(예상 지번 주소 : ' + expJibunAddr + ')';
            	guideTextBox.style.display = 'block';
            } else {
            	guideTextBox.innerHTML = '';
            	guideTextBox.style.display = 'none';
            }
		}
	}).open();
}
</script>
</head>
<body>	
<jsp:include page="../main/header.jsp" />
<div align="center">
<form name="form" method="POST" action="<c:url value='/user/register' />">
	<br><br><br><br>
		<table width="800" cellpadding="0" cellspacing="0">
			<tr>
				<td width="800" height="50">
				<h2>회원 가입</h2>
				</td>
			</tr>
		</table>
	    <br>
	    <table class="list" border="1" align="center">
	  		<tr>
				<td align="center" width="150" height="50" bgcolor="#eeeeee">
					아이디 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input name="customerId" type="text" size="15" maxlength="16" >
					&nbsp
					<font size="2">(영문 소문자/숫자, 4~16자)</font>
				</td>
			</tr>
	  	  	<tr>
				<td align="center" width="150" height="50" bgcolor="#eeeeee">
					비밀번호 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input name="pwd" type="password" size="15" maxlength="16">
					&nbsp
					<font size="2">(영문 대소문자/숫자/특수문자, 8~16자)</font>
				</td>
		  	</tr>
	  	  	<tr>
				<td align="center" width="150" height="50" bgcolor="#eeeeee">
					비밀번호 확인 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input name="pwd2" type="password" size="15" maxlength="16">
				</td>
		  	</tr>
	  	  	<tr>
				<td align="center" width="150" height="50" bgcolor="#eeeeee">
					이름 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input name="name" type="text" size="15" 
					<c:if test="${registerFailed}">value="${customer.name}"</c:if>>
				</td>
		  	</tr>
		  	<tr>
				<td align="center" width="150" height="50" bgcolor="#eeeeee">
					전화번호 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<select name="phone1" class="small" style="height:40px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
					-
				<input name="phone2" class="small" type="text" size="4" maxlength="4"> 
				<!--<c:if test="${registerFailed}">value="${customer.phone}"</c:if>-->
				-
				<input name="phone3" class="small" type="text" size="4" maxlength="4">
				</td>
		  	</tr>
	  	  	<tr>
	  	  		<td align="center" width="150" height="50" bgcolor="#eeeeee">
	  	  			이메일 <font color="blue">*</font>
	  	  		</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input name="email" type="text" size="30" 
					<c:if test="${registerFailed}">value="${customer.email}"</c:if>>
				</td>
		  	</tr>	
			<tr>
				<td align="center" width="150" height="100" bgcolor="#eeeeee">
					주소 <font color="blue">*</font>
				</td>
				<td>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="text" id="sample4_postcode" name="addr1" placeholder=" 우편번호">
					&nbsp&nbsp
					<input class="button" type="button"  onclick="sample4_execDaumPostcode()" value="주소 검색">
					<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input class="big" type="text" id="sample4_roadAddress" name="addr2" placeholder=" 기본주소" size="50" >
					<br>
					<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" size="50">
					<span id="guide" style="color:#999; display:none"></span>
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input class="big" type="text" id="sample4_detailAddress" name="addr3" placeholder=" 나머지 주소"  size="50">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목" size="50">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소" size="50" >
					<!-- <c:if test="${registerFailed}">value="${customer.address}"</c:if>> -->
				</td>
			</tr>		  
	    </table>
	    <br>
	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
 		<c:if test="${registerFailed}">
	    	<font color="red"><c:out value="${exception.getMessage()}"/></font>
	    </c:if>
	    <br>
		<h3 align="center">
			<input type="button" class="joinus" value="가입하기" onClick="userCreate()"> &nbsp;
		</h3>
		<br><br><br><br><br><br><br><br><br><br>
</form>
</div>
<br><br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>