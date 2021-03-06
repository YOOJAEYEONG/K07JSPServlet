<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForTokens</title>
</head>
<body>



	<h2>forTokens태그</h2>
	<%
	
	/*  
	[StringTokenizer 클래스]
		: 문자열을 토큰(구분자)로 나눠서 출력할때 사용한다.
		boolean hasMoreTokens() : 꺼낼 토튼이 있으면 true
		String nextToken() : 해당 토큰을 반환
		int countTokens() : 토큰의 갯수를 반환
	*/
	String colors = "red,green,blue,grey";
	
	StringTokenizer tokens = new StringTokenizer(colors,",");
	out.print("<h3>StringTokenizer클래스사용</h3>");
	out.print("<h4>토큰수:"+tokens.countTokens()+"</h4>");
	
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();		
		out.print("<h5 style='color:"+tokens+"토큰</h5>");
	}
	
	
	/*  
	[String 클래스의 split() 메소드]
		: 문자열을 구분자로 잘라서 문자열배열로 반환해준다.
		JavaScript에도 동일한 함수가 존재한다.
	*/
	
	
	String[] colorArr = colors.split(",");
	out.print("<h3>String클래스 사용</h3>");
	
	for(String color : colorArr){
		out.print("<h5 style='color:"+color+"'>TOKEN</h5>");
	}
	%>
	
	
	
	
	<%--  
	forTokens의 속성
		items : 구분자를 포함한 문자열
		delims(delimiter) : 구분자(특수기호 가능)
		var : 구분자를 통해 잘라낸 토큰을 저장함
	--%>
	
	<h4>JSTL의 forTokens 태그 사용</h4>
	<c:forTokens items="<%=colors %>" delims="," var="color">
		<h5 style="color: ${color};">JSTL 조아용</h5>
	</c:forTokens>
	
	<c:forTokens items="<%=colors %>" delims="," var="color">
		<h5 style="color:${color};">forToken</h5>
	</c:forTokens>
</body>
</html>





























