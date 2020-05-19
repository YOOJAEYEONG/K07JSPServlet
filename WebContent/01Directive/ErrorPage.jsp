<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
   
<%--
	isErrorPage 지시어
	: 현재 JSP페이지가 에러처리를 담당하는지 구분하는 속성으로
	false가 디폴트값이다. 에러처리를 위해서 true로 설정해야한다.
--%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>에러발생됨 : 관리자에게 문의하세요</h2>
	<h3>연락처 : 010-2365-41554</h3>
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWgLvY1xAUIB3gyklne3glx323aZKgXeNArmqSp8jROQTM7hEv&usqp=CAU" alt="" />
	<h3>
		에러내용 : <%=exception.getMessage() %>
	</h3>
</body>
</html>