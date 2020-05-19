<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageInclude</title>
</head>
<body>
	<h2>포함된(include)페이지입니다.</h2>
	
	<!-- 현재페이지의 변수선언이 없어 에러나지만 main에서 포함되어진것이기때문이므로 정상실행됨.  -->
	<ul>
		<li>Integer타입 : <%=pageContext.getAttribute("pageNumber") %></li>
		<li>String 타입: <%=pageContext.getAttribute("pageString") %></li>
		<li>Date타입 : <%=dateString %></li>
		<li>MemberDTO타입1 : 아이디:<%=m2.getId() %>,
							비번 :<%=m2.getPass() %>,
							이름 :<%=m2.getName() %>,
							가입일:<%=m2.getRegidate() %>
		</li>
	</ul>
	
</body>
</html>