<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="script.js" charset="UTF-8"></script>
</head>
<body>
	<table border="1">
		<form name="reg_frm" method="post" action="registerOk.jsp">
			<tr>
				<td colspan="2" align="center">
					<h1>Sign Up</h1>
					'*' 표시 항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					ID *
				</td>
				<td>
					<input type="text" size="20" name="mem_id">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					비밀번호 *
				</td>
				<td>
					<input type="password" size="20" name="mem_pw">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					비밀번호 확인 *
				</td>
				<td>
					<input type="password" size="20" name="pw_check">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					이    름 *
				</td>
				<td>
					<input type="text" size="20" name="mem_name">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					주민번호 *
				</td>
				<td>
					<input type="text" size="20" name="mem_jumin">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					전화번호 *
				</td>
				<td>
					<input type="text" size="20" name="mem_tel">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					E-mail
				</td>
				<td>
					<input type="text" size="30" name="mem_email">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					주    소 *
				</td>
				<td>
					<input type="text" size="40" name="mem_address">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					관심분야 *
				</td>
				<td>
					<input type="checkbox" name="mem_interests" value="backend">백엔드&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="mem_interests" value="frontend">프론트엔드
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					소개글
				</td>
				<td>
					<textarea name="mem_introduce" rows="10" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록" onclick="check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시입력">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="가입안함" onclick="javascript:window.location='login.jsp'">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>