<%@page import="member.MemberBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>main</title>
</head>
<style>
	table{background-color: #ccc}
</style>
<body>
안녕하세요. <%= name %>(<%= id %>)님
	<div align="right">
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		//로그인을 하지 않았을 때 보여지는 화면
		if(id == null) {
	%>
		<input type="button" value="로그인" onclick="javascript:window.location='login.jsp'">
		&nbsp;
		<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
	<%
		//로그인이 되어 있는 상태에서 보여지는 화면
		}else{
	%>
		<input type="button" value="내정보" onclick="javascript:window.location='memberInfo.jsp'">
		&nbsp;
		<input type="button" value="나의 스터디" onclick="javascript:window.location='.jsp'">
		&nbsp;
		<input type="button" value="로그아웃" onclick="javascript:window.location='logOut.jsp'">
	<%
		}
	%>
	</div>
	<br><br><br><br><br><br><br>
	<table align="center">
		<form action="list.jsp" method="post">
			<tr>
				<td width="150" align="center">
					<select>
						<option value="지역" selected="selected">지역</option>
						<option value="seoul">서울</option>
						<option value="gyeonggi">경기</option>
						<option value="incheon">인천</option>
						<option value="busan">부산</option>
						<option value="daegu">대구</option>
						<option value="daejeon">대전</option>
						<option value="gwangju">광주</option>
						<option value="online">온라인</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="개발분야" selected="selected">개발 분야</option>
						<option value="backend">백엔드</option>
						<option value="frontend">프론트엔드</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="언어" selected="selected">언어</option>
						<option value="java">java</option>
						<option value="python">python</option>
						<option value="jsp">jsp</option>
						<option value="spring">spring</option>
					</select>
				</td>
			</tr>
		</form>
	</table>
	<div align="center">
		<br><br><br><br><br><br><br>
		<input type="submit" value="찾기">
	</div>
</body>
</html>