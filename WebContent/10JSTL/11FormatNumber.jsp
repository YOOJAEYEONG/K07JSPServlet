<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--JSTL 코어 라이브러리를 사용하기위한 지시어 선언 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--JSTL 국제화 라이브러리를 사용하기위한 지시어 선언 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11FormatNumber</title>
</head>
<body>

	<fmt:formatNumber value="500500500"  />

	<h2>formatNumber</h2>
	
	<c:set var="money" value="10000"/>


	<h3>1. EL로 출력</h3>
	money : ${money } -> 10000
	
	<h3>2. JSTL 국제화 태그로 출력</h3>
	money:<fmt:formatNumber value="${money }"/> ->10,000
	
	<!-- groupingUsed : false면 콤마 생략됨 -->
	<h3>3. JSTL 국제화 태그로 출력 - 천단위 콤마 생략</h3>
	money:<fmt:formatNumber groupingUsed="false"  value="${money }"/>
	
	<h3>4. type="currency"이고 currencySymbol생략시 - 현재통화단위로 출력됨</h3>
	money:<fmt:formatNumber value="${money }" 
		type="currency" />
	
	
	<!-- value 속성값으로 전달되는 값을 %단위로 변환해서 출력한다.-->
	<h3>5. type="percent"</h3>
	money : <fmt:formatNumber value="0.02" type="percent"/>
	
	
	<h3>6. var속성 : 원하는 위치에 출력하고 싶을때</h3>
	<fmt:formatNumber value="${money }" type="currency"
		var="price"/>
		가격이 <strike>15,000원</strike> -> <span style="font-size: 1.5em;">${price }</span>로 내렸어요~
		
	<h2>자바코드로 1000단위 콤마 표시하기</h2>
	
	
	<%
	String moneyStr = pageContext.getAttribute("money").toString();
	int money = Integer.parseInt(moneyStr);
	NumberFormat nf = NumberFormat.getInstance();
	
	out.println("<h3>1. 천단위 콤마찍기전</h3>");
	out.print(money);
	
	out.println("<h3>1. 천단위 콤마찍은 후</h3>");
	String commaMoney = nf.format(money);
	out.print(commaMoney);
	
	
	//현지통화 기호 얻기
	Currency currency = nf.getCurrency();
	String currencySymbol = currency.getSymbol();
	out.print("<h3>2. 통화기호 추가</h3>");
	out.print(currencySymbol+commaMoney);

	%>
	<!-- 참 고 -->
	1.<%=currency.getCurrencyCode() %><!--KRW-->	
	2.<%=currency.getDisplayName() %><!--대한민국 원-->	
	3.<%=currency.getSymbol() %><!--￦-->	






























</body>
</html>