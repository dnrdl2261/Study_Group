<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
 <style>
 	#wrap{
		width:500px;
		margin-left:auto; 
		margin-right:auto;
		text-align:center;
		}
 </style>
</head>
<body>
	<br><br>
	<div id="wrap">
	<form action="logOut.jsp" method="post">
		<b>
			<font size="5" color="skyblue">메인화면</font>
		</b>
		<br><br>
		<h2>
			<font color="red"><%= name %>(<%= id %>)</font>님 로그인 되었습니다. 
		</h2>
		<br><br>
		<input type="submit" value="로그아웃">
		&nbsp;&nbsp;&nbsp;
		<input type="button" value="내정보" onclick="javascript:window.location='memberInfo.jsp'">
	</form>
	</div>
</body>
</html>