<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<form method="post" action="loginOk.jsp">
		<h1 align="center">로그인</h1>
		<table border="1" align="center">
			<tr>
				<td align="center">
					아 이 디
				</td>
				<td>
					<input type="text" name="mem_id">
				</td>
			</tr>
			<tr>
				<td align="center">
					비밀번호
				</td>
				<td>
					<input type="password" name="mem_pw">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>