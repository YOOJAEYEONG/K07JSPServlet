<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
<%

/*
dynamic web project로 만들었기때문에 WEB-INF하위에 lib폴더가 생성되어있다.
여기에 JDBC드라이버 ojdbc6.jar 파일을 붙여넣기 하면 된다.
*/

/* 
web.xml에 입력된 컨텍스트 초기화 파라미터를 가져온다. 
이때 application 객체를 사용한다.
홈페이지를 구축하다보면 수많은 페이지가 필요하고 페이지마다 각각 명시하다보면 
배포시 서버URL등을 전부다 바꿔야하는 수고를 예방한다.*/
String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");


//자바영역에 클래스가 생성되면 클래스는 반드시 컴파일이 되어야하기 때문에
//서버는 다시 시작해야한다.
//model패키지에 정의된 MemberDAO 클래스를 통해 오라클에 연결한다.
MemberDAO dao = new MemberDAO(driver, url);

//로그인 페이지에서 전송한 아이디, 패스워드 폼값을 받아 저장한다.
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pwd");

//저장된 변수를 isMember()의 파라미터로 전달한다.
boolean memberFlag = dao.isMember(id,pw);
if(memberFlag==true){
	//회원인증에 성공하면 true를 반환한다.
	System.out.println("회원입니다.");
	//location객체와 같이 페이지이동할때 사용한다.
	response.sendRedirect("../common/Welcome.jsp");
}
else{
	//실패하면 false를 반환한다.
	System.out.println("회원이 아닙니다.");
	
	String jsAlert = "<script>";
	jsAlert += "alert('회원이 아닙니다.');";
	jsAlert += "history.go(-1);";
	jsAlert += "</script>";
	
	out.println(jsAlert);
}
%>
</body>
</html>





















