<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPool</title>
</head>
<body>
	<%
		/*
		JNDI(Java Naming Directory Interface)	
			: 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서
			참고(lookup) 하는 API로 쉽게말하면 외부에 있는 객체를
			이름으로 찾아오기 위한 기술이다.
		DBCP(Database Connection Pool : 커넥션풀)
			:DB와 연결된 커넥션 객체를 미리 만들어 풀( Pool)에 저장했다가
			필요할때 쓰고 반납하는 기법을 말한다. 엑세스할때마다 DB에 연결
			및 close() 의 반복작업 보다 DB의 부하를 줄이고 자원을
			효율적으로 관리할 수 있다. 게임에서는 풀링시스템(Pooling System)
			이라는 용어로 사용한다.
		*/

		//커넥션풀을 사용하기위한 절차

		//1. InitialContext객체를 생성한다.
		Context initCtx = new InitialContext();

		/*
		1. 위의 객체를 통해 JNDI서비스 구조의 초기 Root 디렉토리를 얻어온다.
		여기서 얻어오는 톰켓의 루트디렉토리명은 java:comp/env로
		이미 정해져있으므로 그대로 사용하면 된다. */
		Context ctx = (Context) initCtx.lookup("java:comp/env");

		//3. server.xml에 등록한 네이밍을 lookup하여 DataSource를 얻어온다.
		DataSource source = (DataSource) ctx.lookup("jdbc/myoracle");

		//4. 커넥션풀에 톰켓이 생성해 놓은 커넥션객체를 가져다가 사용한다.
		Connection con = source.getConnection();

		String conStr = "";
		if (con != null)
			conStr = "<h2>DBCP연결성공</h2>";
		else
			conStr = "<h2>DBCP연결실패</h2>";
		out.print(conStr);
		
		
		
	

	%>
</body>
</html>

<%--  
[server.xml의 GlobalNamingResources 태그안에 다음과 같이 설정한다.]
	<!-- 
		Global JNDI resources
    	Documentation at /docs/jndi-resources-howto.html
	-->
	<GlobalNamingResources>
    <!-- 
    	Editable user database that can also be used by
    	UserDatabaseRealm to authenticate users
    -->
    <Resource 
    	auth="Container" 
    	driverClassName="oracle.jdbc.OracleDriver" 
    	maxActive="20" 
    	maxIdle="10" 
    	maxWait="-1" 
    	name="jdbc/myoracle" 
    	username="kosmo"
    	password="1234" 
    	type="javax.sql.DataSource" 
    	url="jdbc:oracle:thin:@localhost:1521:orcl" /> 
  </GlobalNamingResources>
  
--%>
<!--
● maxActive : 커넥션 풀이 제공할 최대 커넥션 갯수. 기본값:8
● minIdle : 사용되지 않고 풀에 저장될 수 있는 최소 커넥션 갯수. 기본값:0
● maxIdle : 사용되지 않고 풀에 저장될 수 있는 최대 커넥션 갯수. 
			음수일 경우 제한이 없음. 기본값 : 8
● whenExhaustedAction : 커넥션 풀에서 가져올 수 있는 커넥션이 없을 때 어떻게 동작할지를 지정.
	0일 경우 : 에러 발생
	1일 경우 : maxWait 속성에서 지정한 시간만큼 커넥션을 구할때까지 기다림.
	2일 경우 : 일시적으로 커넥션을 생성해서 사용
● maxWait : whenExhaustedAction 속성의 값이 1일 때 사용되는 대기 시간. 
			단위는 1/1000초, 0보다 작을 경우 무한히 대기
-->

























