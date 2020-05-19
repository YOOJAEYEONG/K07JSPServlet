<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	
	
	
	
%>

<script>
	function signIn() {
		alert('<%=id %>님 가입이 완료되었습니다.');
		window.location.href="http://www.ikosmo.co.kr/"
	}
</script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegiStep03</title>
</head>
<body>
	<table >
            <tr>
                <td>아이디</td>
                <td><%=id %></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><%=pw %></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><%=email %></td>
            </tr>
            <tr>
                <td>성별</td>
                <td >
                    <%=request.getParameter("sex") %>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right;">
                    <button type="button" value="before" onclick="window.location.href='./RegiStep02.html';" >이 전</button>
                    <button type="submit" onclick="signIn();" >확 인</button>
                </td>
            </tr>
        </table>
    
</body>
</html>