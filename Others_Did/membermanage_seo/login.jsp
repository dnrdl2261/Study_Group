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
					�� �� ��
				</td>
				<td>
					<input type="text" name="mem_id">
				</td>
			</tr>
			<tr>
				<td align="center">
					��й�ȣ
				</td>
				<td>
					<input type="password" name="mem_pw">
				</td>
			</tr>
			<tr>
				<td align="center">
					�̸���
				</td>
				<td>
					<input type="email" name="mem_email">
				</td>
			</tr>
			<tr>
				<td align="center">
					��    ��
				</td>
				<td>
					<input type="text" name="mem_name">
				</td>
			</tr>
			<tr>
				<td align="center">
					��ȭ��ȣ
				</td>
				<td>
					<input type="tel" name="mem_tel">
				</td>
			</tr>
			<tr>
				<td align="center">
					�ֹι�ȣ
				</td>
				<td>
					<input type="text" name="mem_jumin">
				</td>
			</tr>
			<tr>
				<td align="center">
					��   ��
				</td>
				<td>
					<input type="text" name="mem_address">
				</td>
			</tr>
			<tr>
				<td align="center">
					���ɺо�
				</td>
				<td>
					<input type="text" name="mem_interests">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="�α���">
					<input type="button" value="ȸ������" onclick="javascript:window.location='register.jsp'">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>