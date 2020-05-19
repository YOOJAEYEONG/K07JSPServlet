<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 지시어 : 공통으로 사용할 JSP파일을 생성한 후
		현재문서에 포함시킬때 사용한다. 각각의 JSP파일 상단에는
		반드시 page지시어(Directive)가 삽입되어야한다.
		**하나의 JSP파일에는 page지시어가 중복 삽입되어서는 안된다. 
 --%>
<%@ include file="IncludePage.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain</title>
    <link rel="stylesheet" href="./css/div_layout.css">
</head>
<body>
	<div class="AllWrap">
		<div class="header">
			<!-- GNB(Global Navigation Bar)영역 -전체 공통메뉴 -->
			<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
				<!-- LNB영역(Local Navigation Bar) - 로컬메뉴(보통좌측) -->
				<%@ include file="../common/Left.jsp" %>
			</div>
		</div>
		<div class="contents">
			<!-- Contents영역  -->
			<%--
			해당메뉴는 외부파일에 선언하여 본 문서에 include처리되었다.
			include는 문서자체를 포함시키는 개념으므로 에러가 발생하지 않는다.
			--%>
			<h2>오늘의 날짜 : <%=todayStr %></h2>
			<br /><br />
			독일 수도 베를린의 지하철에서 한국 유학생 부부가 인종차별을 비롯한 성희롱과 폭행을 당하는 사건이 발생했다.
			27일 연합뉴스에 따르면 이 유학생 부부는 26일(현지시간) 오전 0시20분쯤 마스크를 착용한 채 지하철 U7 노선을 타고 귀가하던 중 같은 칸의 독일 시민으로 보이는 성인 남녀 무리로부터 “코로나”라는 발언을 여러 차례 들었다.
			<br /><br />
		
		</div>
	
        <div class="copyright">
        <!-- copyright  -->
            <%@ include file="../common/Copyright.jsp" %>
        </div>
	</div>
    
</body>
</html>
























