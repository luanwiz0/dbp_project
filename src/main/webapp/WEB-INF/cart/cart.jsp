<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
	<link rel=stylesheet href="<c:url value='/css/cart.css' />" type="text/css">
<script>
function cartItemDelete() {
	return confirm("삭제하시겠습니까?");		
}
var chkList;
function test() {
    var obj_length = document.getElementsByName("chk").length;
	var checkedList = "";
    for (var i=0; i<obj_length; i++) {
        if (document.getElementsByName("chk")[i].checked == true) {
        	if (i == obj_length - 1)
        		checkedList += (document.getElementsByName("chk")[i].value);
        	else
        		checkedList += (document.getElementsByName("chk")[i].value) + ",";        
        }
    }
    //alert(checkedList);
    chkList = checkedList;
    form.submit();
    //return checkedList;
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<div class="page" align="center">
<div>
<table class="text">
	<tr>
		<th>CART</th>
	</tr>
</table>
</div>
<br/>
<!-- 장바구니 리스트 -->
<div>
<form name="form" method="POST" action="/cart/view">

    <table class="table1">
    <c:choose>
	<c:when test="${empty cartItemList}">
	
	<!-- 리스트가 비어있는 경우 -->
	<tr>
		<td colspan="9" class="t0">장바구니가 비어있습니다.</td>
	</tr>
	</c:when>
	<c:otherwise>
    <tr>
	    <th class="t1"></th>
	    <th class="t1">이미지</th>
	    <th class="t1">상품정보</th>
	    <th class="t1">가격</th>
	    <th class="t1">수량</th>
	    <th class="t1">합계</th>
	    <th class="t1"></th>
	</tr>
	
	<!-- 리스트가 비어있지 않은 경우 -->
	<c:forEach var="cartItem" items="${cartItemList}">
	<tr>
	    <td class="t1">
	    	<input type="checkbox" name="chk" value='${cartItem.cartItemId}'/>
	    </td>	<!-- 체크박스 -->
		<td class="t1">이미지</td>
		<td class="t1">${cartItem.productName}</td>
		<td class="t1">${cartItem.productPrice}원</td>
		<td class="t1">
			<select name="number">
				<option value="1" selected>1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			개
		</td>
		<td class="t1">${cartItem.productPrice}원</td>
		<td class="t1">
			<a href="<c:url value='/cart/delete'>
				<c:param name='cartItemId' value='${cartItem.cartItemId}'/>
			</c:url>" onclick="return cartItemDelete();">x</a>
		</td>	<!-- 삭제버튼 -->
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
    </table>
</form>
</div>
<br/><br/>
<!-- 총 금액 -->
<div>
	<table class="table2">
		<tr>
			<th id="tColor" class="t2">총 상품 금액</th>
			<th id="tColor" class="t2">결제 예정 금액</th>
		</tr>
		<tr>
			<td class="t2">
			<c:set var="priceSum" value="0"></c:set>
	  		<c:forEach var="cartItem" items="${cartItemList}">
	  			<c:set var="priceSum" value="${priceSum + (cartItem.productPrice)}"></c:set>
	  		</c:forEach>
			${priceSum}원</td>
			<td class="t2">
			<c:set var="priceSum" value="0"></c:set>
			<c:forEach var="cartItem" items="${cartItemList}">
	  			<c:set var="priceSum" value="${priceSum + (cartItem.productPrice)}"></c:set>
	  		</c:forEach>
			${priceSum}원</td>
		</tr>
	</table>
</div>
<br/></br>
<div class="btn">
<form>
	<a href="<c:url value='/order/checkedForm'>
				<c:param name='checkedList' value=''/>
			</c:url>">
			<button class="btn1" type="button" onclick='test();'>선택 상품 주문</button>
	</a>
	
	<a href="<c:url value='/order/form'>
				<c:param name='customerId' value='${customerId}'/>
			</c:url>">
			<button class="btn2" type="button">전체 상품 주문</button>
	</a>
</form>
</div>
</div>
<br/></br>
<jsp:include page="../main/footer.jsp" />
</body>
</html>