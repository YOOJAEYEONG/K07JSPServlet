<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>요청 헤더정보 출력하기</h2>
	어떤 프로토콜을 이해하려면 프로토콜의 헤더만 알면 된다
	프로토콜의 헤더의 내용은 특정 프로토콜의 기능을 제공하기 위해 담고 있는 최소한의 정보기 때문이다.

	<%
	//모든헤더의 이름을 리턴한다.
	Enumeration headers = request.getHeaderNames();
	
	while(headers.hasMoreElements()){
		
		String headerName = (String)headers.nextElement();
		
		//String getHeader(String name) : 모든 헤더의 이름을 return한다.
		String headerValue = 
				request.getHeader(headerName);
		
		out.println(String.format("헤더명:%s, 헤더값: %s<br>",
				headerName, headerValue));
	}
	%>
	
	
	<h2>요청헤더명으로 브라우저 종류 알아내기</h2>
	<%
	String webBrowser = request.getHeader("user-agent");
	if(webBrowser.toUpperCase().contains("MSIE")){
		out.print("인터넷익스플로러");
	}
	else if(webBrowser.toUpperCase().contains("FIREFOX")){
		out.print("파폭");
	}
	else if(webBrowser.toUpperCase().contains("CHROME")){
		out.print("크롬");
	}
	else {
		out.print("기타");
	}
	%>
</body>
</html>














