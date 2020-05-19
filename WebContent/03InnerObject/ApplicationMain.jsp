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
<!--
웹어플리켕이션(컨텍스트)을 구성하는 모든 JSP(Servlet)에서
String 타입의 상수를 공유할 목적으로 사용한다.
web.xml에 <context-param> 엘리먼트를 통해 등록한다.
[사용방법] 
-컨테이너에 의해 미리 선언된 자바 클래스의 참조 변수를 통해 사용한다.
-별도의 객체 생성없이 각 내장 객체의 메소드들을 사용할 수 있다.
-문서 안의 스크립트렛과 표현식에서만 사용 가능하다.  
-선언부에서는 사용할수 없다. 

[활용]
-HTML의 폼에서 전송된 값을 서버에서 받을때
-세션 관련 작업을 처리할 때
-스크립트릿에서 브라우저 출력이 필요할 때
-사용자 요청을 다른 페이지로 전달할 때
-현재 JSP에 대한 각종 정보를 알고자 할 때
 -->
    <h3>web.xml에 설정한 내용 읽어오기</h3>
    <ul>
    	<li>오라클드라이버 : 
    	<%=application.getInitParameter("JDBCDriver") %></li>
    	
    	
    	
    	<li>오라클접속URL : 
    	<%=application.getInitParameter("ConnectionURL") %></li>
    </ul>
    
    <!--
    context 초기화 파라미터의 <param-name>을 통해 속성 전체를 가져온다.
      -->
    <h3>컨텍스트 초기화 파라미터명 전체 목록 보기</h3>
    <ul>
    <%
    Enumeration<String> names = application.getInitParameterNames();
    while(names.hasMoreElements()){
    	String name = names.nextElement();
    	String value = application.getInitParameter(name);
    %>
    <li><%=name %> : <%=value %></li>
    <%
    }
    %>
    </ul>
    
    
    
<!--
ServletContext의 메소드인 getRealPath()로 서버의 물리적 경로를
얻어올수 있다. 사용시 context root를 제외한 나머지 /로 시작하는 절대경로를
입력해야한다.
-->
    <h2>서버의 물리적 경로 얻어오기</h2>
    <ul>
    	<li>application 내장객체 : 
    	<%=application.getRealPath("/images") %></li>
    	<li>request내장객체 : 
    	<%=request.getServletContext().getRealPath("/images") %></li>
    	<li>request내장객체 (주로 서블릿에서 사용): 
    	<%=request.getRealPath("/images") %></li>
    	<li>session내장 객체 : 
    	<%=session.getServletContext().getRealPath("/images") %></li>
    	<li>config내장 객체 : 
    	<%=config.getServletContext().getRealPath("/images") %></li>
    	<li>this키워드(주로 선언부에서 사용) : 
    	<%=this.getServletContext().getRealPath("/images") %></li>
    </ul>
  
    
    
<!--
선언부에서 JSP의 내장객체를 사용할때는 해당 내장객체의 클래스타입으로 사용해야한다.
application객체는 ServletContext타입을 갖고있다.
  -->
    <h2>선언부에서 물리적경로 사용하기</h2>
    <%!
    //1.this키워드 사용하기
    String getRealpath(){
    	System.out.println(this);
    	//여기서 this는 context자체를 의미한다.
    	return this.getServletContext().getRealPath("/images");
    }
    
    //2.매개변수로 내장객체를 전달하기
    String getRealpath(ServletContext app1){
    	return app1.getRealPath("/images");
    }
    
    //3.멤버변수 사용하기
    ServletContext app2;
    String getRealPathString(){
    	return app2.getRealPath("/images");
    }
    %>
    
    <ul>
    	<li>this키워드로 사용 : <%=getRealpath() %></li>
    	<li>매개변수로 전달 : <%=getRealpath(application) %></li>
    	<% this.app2 = application; %>
    	<li>멤버변수 : <%=getRealPathString() %></li>
    </ul>
</body>
</html>
























