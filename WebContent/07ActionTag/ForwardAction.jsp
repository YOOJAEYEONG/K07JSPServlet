<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
pageContext.setAttribute("pageVar", "페이지 영역입니다.");
request.setAttribute("reauestVar", "리퀘스트영역입니다.");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>액션테그를 이용한 포워딩</h2>
	<p>하나씩 주석으로 변경하면서 확인해보기</p>
	<%
	
	/*
	1. sendRedirect()로 페이지 이동
		-새로운 페이지에 대한 요청이므로 page, request영역 모두 공유되지 않는다.
		-URL창에는 마지막 요청된 페이지명이 보인다.
		-절대경로로 지정할 경우 Context루트명을 포함한 경로로 지정해야한다.
	*/
	/* response.sendRedirect(request.getContextPath()+
			"/07ActionTag/ForwardActionResult.jsp"); */
	
			
	/*	
	2. 포워드(자바코드사용)		
		-포워드된 페이지에서는 request영역이 공유된다.
		-URL창에는 최초 요청한 페이지의 경로가 보여지므로 사용자는 페이지 이동을 알수없다.
		-절대경로로 지정시 Context루트를 제외한 경로로 지정히야한다.
	*/
	/* request.getRequestDispatcher(
			"/07ActionTag/ForwardActionResult.jsp")
		.forward(request, response); */
	
	%>
	
	<!--
	3. 액션태그를 통한 포워드
		-액션태그에 page속성만 지정하면 되므로 표현이 간결하다.
		-나머지 특성은 모두 동일하다.
	-->
	
	<jsp:forward page="/07ActionTag/ForwardActionResult.jsp" />
	
<%-- 	
<jsp:include/> 와 <jsp:forward/> 차이 = request 제어권

Forward의 경우는 url1에서 forward해서 url2로 전달하게 되면 제어권을 다시 url1으로 전달받지 못합니다. 
따라서 url1에서 처리한 결과 화면이 전혀 보이지 않고 최종 클라이언트 브라우저에는 url2에서 처리한 화면만이 보여지게 됩니다.

Include의 경우는 url1에서 include를 하면 url2로 제어권을 잠시 빌려주고
 처리를 다 하면 다시 url1으로 제어권을 반납한다. 
 따라서 클라이언트화면에서는 url1의 내용속에 url2가 들어가서 보여진다.
--%>
	
	
</body>
</html>
































