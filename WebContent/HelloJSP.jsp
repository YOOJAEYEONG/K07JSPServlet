<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String firstStr = "Hello JSP";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP.jsp</title>
</head>
<body>
	<h2>안녕하세요</h2>
	
	<h3><%=firstStr %></h3>
	
	<%
	String str = "010-26415-3556";
	String[] strArr = str.split("-");
	for(String s : strArr){
		System.out.println(s);
		out.println(s + "<br>");
	}
	%>
</body>
</html>