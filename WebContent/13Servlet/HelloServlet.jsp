<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet</title>
</head>
<body>

<!--  
	[서블릿작성순서]

	step1. 서블릿 작성
	

-->
	<h2>서블릿(Servlet)만들기</h2>
	
	<h3>First Servlet</h3>
	
	<!--  
	서블릿을 호출하기위한 요청명을 먼저 결정한다. 아래경로는 
	상대경로이므로 컨텍스트 루트를 신경쓸 필요가 없다.
	
	컨텍스트루트를 제외한 나머지 경로가 서블릿 요청명이 된다.
	-->	
	
	
	<!--상대경로-->
	<!--13Servlet폴더   -->	
	<a href="./NoJSPServlet.do">JSP파일없이 화면에 결과 출력하기 (Servlet에서 바로출력)-상대경로</a>
	<br>
	<!--절대경로 : 닷이 없다-->	
	<a href="/K07JSPServlet/13Servlet/NoJSPServlet.do">
	JSP파일없이 화면에 결과 출력하기 (Servlet에서 바로출력)-절대경로</a>
	
	
	<h3>HelloServlet</h3>
	
	<h4>${message }-${HELLO }</h4>
	<h4><%=request.getAttribute("message") %></h4>
	<a href="HelloServlet.do">JSP파일(view)에서 화면 출력하기</a>
	<br>
	

	
	<h3>WebServlet - 어노테이션으로 서블릿 매핑하기</h3>
	<a href="AnnoWebServlet.do">AnnoWebServlet바로가기</a>
	
<!--  
		ServletConfig config = this.getServletConfig();
		//ServletConfig 객체를 획득한다.
		//실제로는 HttpServlet이 ServletConfig를 구현했기 때문에
		//이렇게 객체를 획득할 필요 없이 this를 사용해도 무방하다.

		String start = config.getInitParameter("start");
		String end = this.getInitParameter("end");
		//config 객체를 통해서도 this를 통해서도 초기화 매개변수를 획득할 수 있다
-->
	
	
	<h3>서블릿으로 간단한 사칙연산 계산기 만들기</h3>
	<form action="<%=request.getContextPath() %>/Servlet/Calculate.kosmo" method="get">
		<input type="text" name="firstNum" size="5"/>
		<select name="operator" id="">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
	<input type="text" name="secondNum" size="5"/>
	<input type="submit" value="연산결과" />
	<h4 style="color: red; font-size: 1.5em;">${calResult}</h4>
	</form>
	
	
	
	
	
	
	
	
	
</body>
</html>





























