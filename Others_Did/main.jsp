<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	table{background-color: #ccc}
</style>
<body>
	<div align="right">
		<input type="button" value="로그인" onclick="javascript:window.location='login.jsp'">
		&nbsp;
		<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
	</div>
	<br><br><br><br><br><br><br>
	<table align="center">
		<form action=".jsp" method="post">
			<tr>
				<td width="150" align="center">
					<select>
						<option value="지역" selected="selected">지역</option>
						<option>서울</option>
						<option>경기</option>
						<option>인천</option>
						<option>부산</option>
						<option>대구</option>
						<option>대전</option>
						<option>광주</option>
						<option>온라인</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="개발분야" selected="selected">개발 분야</option>
						<option>백엔드</option>
						<option>프론트엔드</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="언어" selected="selected">언어</option>
						<option>java</option>
						<option>python</option>
						<option>jsp</option>
						<option>spring</option>
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