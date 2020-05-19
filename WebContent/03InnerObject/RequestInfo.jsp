<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//한글깨짐방지
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>사용자 요청과 관련된 정보들 출력하기</h2>
	<ul>
		<li>데이터 전송방식 : <%=request.getMethod() %></li>
		<li>전체URL : <%=request.getRequestURL() %></li>
		<li>도메인을 제외한 URL : <%=request.getRequestURI() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버명 : <%=request.getServerName() %></li>
		<!--  
		로컬 웹서버의 주소는 localhost 혹은 127.0.0.1과같은 루프백을 사용하거나
		request객체를 통해 출력하면 0:0:0:0:0:0:0:1 과 같이 출력된다.
		-->
		<li>사용자IP주소 : <%=request.getRemoteAddr() %></li>
		<li>서버포트 : <%=request.getServerPort() %></li>
		<li>QueryString : <%=request.getQueryString() %></li>
		<li>전송된값 확인 : <%=request.getParameter("paramHan") %></li>
	</ul>
</body>
</html>