<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting03Main</title>
</head>
<body>
    <script>
	function chatWin03(){
		var id = document.getElementById("chat_id");
		if(id.value==""){
			alert("닉네임을 입력후 채팅창을 열어주세요");
			id.focus();
			return; 
		}
		window.open("chatting03.jsp?chat_id="+id.value, 
				"창이름",
				"width=500,height=400");
		id.value="";
	}
	</script>
	<h2>웹소켓03 - 아이디 적용해서 채팅창 띄워주기</h2>
	아이디 : <input type="text" id="chat_id" />
	<button type="button" onclick="chatWin03();">채팅창열기</button>
    
<!-- 



 -->




















</body>
</html>