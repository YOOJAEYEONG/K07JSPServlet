<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
포워드된 페이지나 인클루드된 페이지로 파라미터를 전달한는 경우
한글이 포함되어있으면, 반드시 포워드 시키는 최초페이지에서 인코딩을 설정해야한다.
*/
request.setCharacterEncoding("UTF-8");
request.setAttribute("member",
		new MemberDTO("sung", "9999", "성춘향", null));

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamAction</title>
</head>
<body>
	<h2>인클루드 되는 페이지로 파라미터 전달하기</h2>
	<!--
	아래와 같이 설정하면 쿼리스트링 형태로 파라미터가 전달된다.
	***액션태그 사이의 주석은 사용할 수 없다. => 에러발생
	-->
		<!-- 주석을 아래로 이동후 실행해보기  -->
	<jsp:include page="ParamActionIncludeResult.jsp">
		<jsp:param value="이몽룡" name="name"/>
		<jsp:param value="Lee" name="id"/>
	</jsp:include>
	
	<%
	String pageURL= "ParamActionForwardResult.jsp?query=반갑습니다.";
	String paramValue = "KOSMO";
	
	request.setAttribute("member", 
			new MemberDTO("Lee", "7777", "이몽룡", null));
	%>
	<!-- 주석으로 변경해 확인해보기 -->
	<!--
	페이지되지만 URL이 변경되지 않는다.  
	전달되는 쿼리스트링도 보이지 않음.
	-->
	<jsp:forward page="<%=pageURL %>">
		<jsp:param value="한국소프트웨어인재개발원" name="name"/>
		<jsp:param value="<%=paramValue %>" name="id"/>
	</jsp:forward> 
	
	
</body>
</html>

























