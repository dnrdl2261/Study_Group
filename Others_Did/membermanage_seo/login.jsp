<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<form method="post" action="loginOk.jsp">
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
				<td align="center">
					이메일
				</td>
				<td>
					<input type="email" name="mem_email">
				</td>
			</tr>
			<tr>
				<td align="center">
					이    름
				</td>
				<td>
					<input type="text" name="mem_name">
				</td>
			</tr>
			<tr>
				<td align="center">
					전화번호
				</td>
				<td>
					<input type="tel" name="mem_tel">
				</td>
			</tr>
			<tr>
				<td align="center">
					주민번호
				</td>
				<td>
					<input type="text" name="mem_jumin">
				</td>
			</tr>
			<tr>
				<td align="center">
					주   소
				</td>
				<td>
					<input type="text" name="mem_address">
				</td>
			</tr>
			<tr>
				<td align="center">
					관심분야
				</td>
				<td>
					<input type="text" name="mem_interests">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>