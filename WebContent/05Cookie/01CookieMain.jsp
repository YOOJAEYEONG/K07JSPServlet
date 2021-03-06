<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieMain</title>
</head>
<body>
	<h2>쿠키(Cookie)</h2>
	<h3>쿠키 설정</h3>
	
	<%
	/*
	1.쿠키객체생성 : new Cookie(쿠키명, 쿠키값);
		: 쿠키명을 설정하는 setName()함수가 별도로 존재하지 않으므로
		생성자를 통해 쿠키명을 설정한다.
	*/
	Cookie cookie = new Cookie("UserID", "KOSMO");
	
	
	
	
	/*
	2.쿠키의 적용 결로 설정 : 쿠키 설정시 쿠키가 적용될 경로를 설정한다.
		아래의 설정은 컨텍스트루트 경로를 사용하므로 웹사이트 전체에서
		사용가능한 쿠키를 생성하게 된다.
		컨텍스트루트 경로 : localhost:8282/를 제외한 다음경로를 말함
	*/
	System.out.print("request.getContextPath()"+
		request.getContextPath());//K07JSPServlet
	cookie.setPath(request.getContextPath());
	
	/*
	3.쿠키의 유효시간 설정(초단위)
		: 유료시간을 설정하지 않을경우 웹브라우저를 닫을때 자동으로삭제된다.
		그외에는 설정한 시간만큼 유지된다.
	*/
	
	cookie.setMaxAge(3600);//1시간
	
	/*
	4.응답헤더에 쿠키를 추가하여 클라이언트로 전송한다.
		이때 클라이언트측PC에 쿠키가 생성된다.
	*/
	response.addCookie(cookie);
	%>
	
	
	
	
	
	
	<!--
	쿠키는 첫 실행시에는 출력되지 않는다. 이유는 클라이언트측으로
	응답헤더를 통해 전송되어 생성은 되었으나, 서버측으로 다시
	응답헤더를 통해 전송해야만 확인이 가능하기 때문이다. 
	즉, 새로고침하거나 다른페이지로 요청이 있을때 쿠키를 확인할 수 있다.
	-->
	<!--
	[참고]
	JSESSIONID : 웹브라우저마다 자동으로 만들어진다. 
	페이지를 닫았다가 다시 접속하면 랜덤하게 새로 생성된다.
	-->
	<h2>쿠키를 설정하는 현제패이지에서 쿠기값 확인하기</h2>
	<%
	//request객체를 통해 쿠키값을 얻어온다. 다수의 값이므로
	//배열로 반환된다.
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			
			out.print(String.format("%s : %s <br>",
					cookieName, cookieValue));	
		}
	}
	%>
	
	<h2>페이지 이동후 쿠기값 확인하기</h2>
	<a href="CookieResult.jsp">쿠키값 다음페이지에서 확인하기</a>
	
</body>
</html>






















