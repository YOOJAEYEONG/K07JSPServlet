<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
/*
선언부 : 선언부 로직은 JSP가 아닌 자바 영역이다
따라서 jsp의 내장개체 out을 사용하기위해서는 파라미터로 전달해줘야한다.
*/
public void showGugudan(JspWriter out){
	
	try{
		out.println("<table border='1' width='700'>");
		
		for(int i=2 ; i<=9 ; i++){
			out.print("<tr>");
			for(int j=1 ; j<=9 ; j++){
				out.println("<td>"+i+"*"+j+"="+(i*j)+"</td>");
			}
			out.print("</tr>");
		}
		out.println("</table>");
	}catch(Exception e) {}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
</head>
<body>
	<h2>JSP로 구구단 출력하기</h2>
	
	<h3>구구단 출력1 - 메소드로 구현</h3>
	<%
		showGugudan(out);
	%>
	
	<h3>구구단 출력2 - 표현식로 구현</h3>

	<table border="1" width="700">

	<%
	for(int dan=2; dan<=9 ; dan++){
	%>
	<tr>
		<%
		for(int su=1; su<=9 ; su++){
		%>
		<td><%=dan %>*<%=su %>=<%=(dan*su) %> </td>
		<%
		}
		%>
	</tr>
	<%
	}
	%>
	</table>
	
	<table border="1" width="700">
		<% for(int dan=2; dan<=9 ; dan++) { %>
		<tr>
			<% for(int su=1 ; su<=9 ; su++) { %>
				<td><%=dan %>*<%=su %>= <%=(dan*su) %>
			<% } %>
		</tr>
		<% } %>
	</table>
</body>
</html>


















