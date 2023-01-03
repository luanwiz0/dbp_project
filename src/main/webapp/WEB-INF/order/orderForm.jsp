<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문 정보</title>
<style>
  div{
    margin : 20px;
    padding: 10px;
  }
  table{
    width: 500px;
    height: 200px;
    border-style: solid;
    border-width: thin;
    padding: 10px;
  }
</style>
<script type="text/javascript">
// '주문자 정보와 동일하게' 선택 시
function copy(){
	if(document.getElementById("cb1").checked){
	// 주문자 정보와 동일하게 이름과 전화번호 설정
	  document.getElementById("name2").value = document.getElementById("name").value;
	  document.getElementById("phone2").value = document.getElementById("phone").value;
	}
	if(document.getElementById("cb2").checked){
	// 주문자 정보와 동일하게 이름과 전화번호 설정
	 	document.getElementById("name3").value = document.getElementById("name").value;
	    document.getElementById("phone3").value = document.getElementById("phone").value;
	}
}
	
// 직접 수령/배송 중 하나 선택 시
  function check() {

	// 배송 선택
      if(document.getElementById("deliverCheck").checked){
    	  // 배송 폼 입력할 수 있게
          document.querySelector('#name2').disabled = false;
          document.querySelector('#phone2').disabled = false;
          document.querySelector('#sample4_postcode').disabled = false;
          document.querySelector('#sample4_roadAddress').disabled = false;
          document.querySelector('#sample4_jibunAddress').disabled = false;
          document.querySelector('#sample4_detailAddress').disabled = false;
          document.querySelector('#sample4_extraAddress').disabled = false;
          document.querySelector('#sample4_engAddress').disabled = false;
          
      	  // 직접 수령 폼 입력 못하게 막기
          document.querySelector('#name3').disabled = true;
          document.querySelector('#phone3').disabled = true;
          
          // 배송비 설정
          document.getElementById("deliverPrice").value = 3000;
          document.getElementById("priceSum").value 
          	= Number(document.getElementById("price").value)
          	+ Number(document.getElementById("deliverPrice").value);
          
      }
      
	// 직접 수령 선택
      if(document.getElementById("directCheck").checked){
    	// 직접 수령 폼 입력할 수 있게
          document.querySelector('#name3').disabled = false;
          document.querySelector('#phone3').disabled = false;
          
          // 배송 폼 입력 못하게 막기
          document.querySelector('#name2').disabled = true;
          document.querySelector('#phone2').disabled = true;
          document.querySelector('#sample4_postcode').disabled = true;
          document.querySelector('#sample4_roadAddress').disabled = true;
          document.querySelector('#sample4_jibunAddress').disabled = true;
          document.querySelector('#sample4_detailAddress').disabled = true;
          document.querySelector('#sample4_extraAddress').disabled = true;
          document.querySelector('#sample4_engAddress').disabled = true;
          
       // 배송비 설정
          document.getElementById("deliverPrice").value = 0;
          document.getElementById("priceSum").value 
        	= document.getElementById("price").value;
      }
}

function addOrder(){
	var chk_radio = document.getElementsByName('receive');
	var sel_type = null;
	for(var i=0;i<chk_radio.length;i++){
		if(chk_radio[i].checked == true){ 
			sel_type = chk_radio[i].value;
		}
	}
	if(sel_type == null){
            alert("수령 방법을 선택하세요."); 
		return false;
	}
	
	if(document.getElementById("directCheck").checked){ //직접수령
		if (form.name3.value == "") {
			alert("이름을 입력하십시오.");
			form.name3.focus();
			return false;
		}
		if (form.phone3.value == "") {
			alert("휴대폰 번호를 입력하십시오.");
			form.name3.focus();
			return false;
		}
		var phone3Exp = /^\d{11}$/;
		if(phone3Exp.test(form.phone3.value)==false) {
			alert("휴대폰 번호 형식이 올바르지 않습니다.");
			form.phone3.focus();
			return false;
		}
	}
	if(document.getElementById("deliverCheck").checked){ //배송
		if (form.name2.value == "") {
			alert("이름을 입력하십시오.");
			form.name2.focus();
			return false;
		}

		if (form.phone2.value == "") {
			alert("휴대폰 번호를 입력하십시오.");
			form.name2.focus();
			return false;
		}
		var phone2Exp = /^\d{11}$/;
		if(phone2Exp.test(form.phone2.value)==false) {
			alert("휴대폰 번호 형식이 올바르지 않습니다.");
			form.phone2.focus();
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
	}
	alert("주문이 완료되었습니다.");
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
<div class="page" align="center">
<form name="form" method="POST" action=<c:url value="/order/add"/>>
	<input type="hidden" name="customerId" value="${customer.customerId}">
	
	<!-- 배송 방식 선택 -->
	<div class="radio">
		<label><input type="radio" id="directCheck" name="receive" value="direct" onclick="check();">직접 수령</label><br>
    	<label><input type="radio" id="deliverCheck" name="receive" value="deliver" onclick="check();">배송</label>
	</div>
	
	<!-- 장바구니 목록 -->
	<div class="orderList">
    	<table width="60%">
	      <caption>주문 상품</caption>
	      <tr>
	        <th> </th>
	        <th>상품 정보</th>
	        <th>수량</th>
	        <th>상품 금액</th>
	        <th>결제 금액</th>
	      </tr>
	      <c:forEach var="cartItem" items="${cartItemList}">
	      <tr>
	        <td></td>
	        <td><input type="text" name="name" value="${cartItem.productName}" readonly></td>
	        <td><input type="number" name="quantity" value="${cartItem.quantity}" readonly></td>
	        <td>${cartItem.productPrice}</td>
	        <td>${cartItem.quantity * cartItem.productPrice}</td>
	      </tr>
	      </c:forEach>
	    </table>
	</div>
	
	<!-- 주문자 정보 -->
	<div class="orderInfo">
		  <table width="60%">
		    <caption>주문자 정보</caption>
		    <tr>
		      <td>주문자 이름 *</td>
		      <td><input id="name" value="${customer.name}" readonly></td>
		    </tr>
		    <tr>
		      <td>휴대폰 번호 *</td>
		      <td><input id="phone" value="${customer.phone}" readonly></td>
		    </tr>
		    <tr>
		      <td>이메일 *</td>
		      <td>${customer.email}</td>
		    </tr>
		  </table>
	</div>
	<br>
	
	<div class="deliver">
	  <label><input type="checkbox" id="cb1" onclick="copy();">주문자 정보와 동일</label>
	  <table width="60%">
		    <caption>배송 정보</caption>
		    <tr>
		      <td>받으시는 분 *</td>
		      <td><input type="text" id="name2" name="name2" size="28" required></td>
		    </tr>
		    <tr>
		      <td>휴대폰 번호 *</td>
		      <td>
		      	<input type="text" id="phone2" name="phone2" required>
		      </td>
		      </tr>
		      <tr>
		        <td>배송지 주소 *</td>
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
		      <tr>
		        <td>메모</td>
		        <td><textarea cols="42" rows="8"></textarea></td>
		      </tr>
	  </table>
	</div>
	
	<div class="directReceive">
	<label><input type="checkbox" id="cb2" onclick="copy();">주문자 정보와 동일</label>
	  <table width="60%">
	    <caption>수령 정보</caption>
	    <tr>
	      <td>받으시는 분 *</td>
	      <td><input type="text" id="name3" name="name3" size="28" required></td>
	    </tr>
	    <tr>
	      <td>휴대폰 번호 *</td>
	      <td>
	        <input type="text" id="phone3" name="phone3"required>
	      </td>
	    </tr>
	    <tr>
	      <td>메모</td>
	      <td><textarea cols="37" rows="8"></textarea></td>
	    </tr>
	  </table>
	</div>
	
	<div class="price">
		  <p>상품 합계 금액: </p>
		  	<c:set var="priceSum" value="0"></c:set>
		  	<c:forEach var="cartItem" items="${cartItemList}">
		  		<c:set var="priceSum" value="${priceSum + (cartItem.quantity * cartItem.productPrice)}"></c:set>
		  	</c:forEach>
		  <input id="price" name="price" value="${priceSum}" readonly> 
		  <p>배송비: </p>
		  <input id="deliverPrice" value="0" readonly>
		  <p>총 결제 금액: </p>
		  <input id="priceSum" name="priceSum" value="0" readonly>
	</div>
	
	<div class="payment">
		<input type="button" value="결제하기" onclick="addOrder();">
	</div>
</form>
</div>
<br><br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>