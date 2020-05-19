<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--파일명 : CookieLogoutProc.jsp  --%>


<%
//로그아웃 처리를 위해 세션영역에 저장된 모든 속성을 지운다.
session.invalidate();

//페이지 이동. JSP코드가 우선순위가 높으므로 아래 JS코드는 무시된다.
response.sendRedirect("CookieLoginMain.jsp");
%>
<!--
JSP영역과 JS영역이 있을경우 JSP가 우선순위가 높기 때문에 아래 실행문은 실행되지 않는다.
실행을 확인하려면 JSP실행문을 주석으로 변경하고 테스트해봐야한다.
-->
<script>
	alert('로그아웃되었습니다.');
	location.href="CookieLoginMain.jsp";
</script>





















