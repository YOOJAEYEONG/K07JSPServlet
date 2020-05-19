<%@page import="java.util.Collection"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
응답헤더 설정하기
	: 새로운 내용을 DB에 추가했는데도 변경된 내용이 웹브라우저에 
	출력되지 않는다면 이는 캐시에 저장된 내용을 출력하고 있기 때문임.
	아래 설정은 캐시를 사용하지 않고 매번 새로고침 한것처럼
	새로운 정보로 갱신하겠다는 응답헤더 설정이다.
*/
//Pragma는 http1.0에서 적용할때 사용(현재는 잘안쓰지만 호환성을 위해서 남겨둠)
response.setHeader("Pragma", "no-cache");
//http1.1에서 적용할때 사용
response.setHeader("cache-control", "no-cache");

/*
[파일다운로드 구현시 사용]
	:웹브라우져가 인식하지 못하는 MIME타입으로 설정하면 브라우져는
	해석하지 못하고 파일을 다운로드시켜버린다.
	jpg화 같은 이미지 파일은 웹브라우져가 인식하는 MIME타입이므로
	다운로드를위해서는 아래와 같은 설정이 필요하다.
	
//웹브라우저가 인직하지 못하는 mime타입중 하나이다
response.setContentType("binary/octect-stream");
*/



/*응답헤더 추가/설정하기
	add계열 : 기존의 헤더명이 존재할 경우 기존의 값을 유지하면서
		계속 추가한다. 없을때는 새롭게 생성한다.
	set계열 : 기존 헤더명이 존재할 경우 기존값이 변경한다.
		없을때는 새롭게 생성한다.
*/
long time = new Date().getTime();
System.out.println(time);
response.setDateHeader("currentDate", time);

SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
time = simple.parse("2017-12-31 10:30").getTime();
System.out.println(time);

response.addDateHeader("currentDate2", time);
response.addIntHeader("numberOfCrew", 100);//새로운헤더추가
response.setIntHeader("numberOfCrew", 99);//기존헤더덮어쓰기(99출력)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>응답헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = 
		response.getHeaderNames();
	
	for(String headerName : headerNames){
		String headerValue = response.getHeader(headerName);
	
	
	%>
	
		<li><%=headerName %> : <%=headerValue %></li>
	
	<%
	}
	%>
	
	<h2>응답헤더명 존재여부 확인하기</h2>
	<h3>currentDate 응답헤더명</h3>
	
	<%=response.containsHeader("currentDate") ?
			"존재함" : "존재하지 않음" %>
			
	
	<h3>Content-type 응답헤더명</h3>
	<%=response.containsHeader("Content-type") ?
			"존재함" : "존재하지 않음" %>
	
</body>
</html>




















