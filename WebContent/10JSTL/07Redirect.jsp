<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07Redirect</title>
</head>
<body>
	<c:set var="requestVar" value="리퀘스트영역저장" scope="request"/>

	<!--  
	[redirect태그]
	-새로운 페이지에 대한 요청이므로 request영역은 공유되지 않는다.
	-절대경로로 설정시 url속성에 컨텍스트루트는 제외한다.
	-단, JSP내장객체의 response의 sendRedirect()로 이동하는 경우는
		컨텍스트루트를 포함해야한다.
	-->
	<h3>자바 코드로 리다이렉트</h3>
	<%
	 /* response.sendRedirect(request.getContextPath()+
		"/10JSTL/inc/ImportPage.jsp?"+
		"user_id="+URLEncoder.encode("KOREA[한국]", "UTF-8")+
		"&user_pw="+URLEncoder.encode("fighting[파이팅]", "UTF-8"));
	  */
	%>
	<!--위 코드 주석처리 필요  -->
	
	<h3>JSTL로 리다이렉트</h3>
	<!-- 인코딩이 자동으로 처리된다. -->
	 <c:redirect url="/10JSTL/inc/ImportPage.jsp">
		<c:param name="user_id" value="Korea[한국]"/>
		<c:param name="user_pw" value="Germany[독일]"/>
	
	</c:redirect> 
</body>
</html>
 