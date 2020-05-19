<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>forward된 페이지입니다</h2>
	<!--
	포워드 처리된 페이지에서는 page영역은 공유되지 않고 request영역만
	공유된다. 따라서 해당페이지의 가장 좁은 영역은 request영역이 된다.
	-->
	<h3>자바코드를 통해서 속성 읽기</h3>
	<ul>
		<li>pageContext.getAttribute("scopeVar") : 
			<%=pageContext.getAttribute("scopeVar") %></li>
			
		<li>request.getAttribute("scopeVar") : 
			<%=request.getAttribute("scopeVar") %></li>
			
		<li>session.getAttribute("scopeVar") : 
			<%=session.getAttribute("scopeVar") %></li>
			
		<li>application.getAttribute("scopeVar") :
			<%=application.getAttribute("scopeVar") %></li>
	</ul>
	
	<h3>xxxScope 미지정후 속성 읽기</h3>
	<ul>
		<li>가장좁은 영역 읽음 : ${scopeVar}</li>
		<li>포워드된 페이지에서는 가장좁은 영역인 request영역이 읽혀지게 된다. 
			page 영역은 포워드된 페이지에서는 공유되지 않는다.</li>
		
	</ul>
	
	
</body>
</html>