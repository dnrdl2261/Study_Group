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
		<input type="button" value="�α���" onclick="javascript:window.location='login.jsp'">
		&nbsp;
		<input type="button" value="ȸ������" onclick="javascript:window.location='register.jsp'">
	</div>
	<br><br><br><br><br><br><br>
	<table align="center">
		<form action=".jsp" method="post">
			<tr>
				<td width="150" align="center">
					<select>
						<option value="����" selected="selected">����</option>
						<option>����</option>
						<option>���</option>
						<option>��õ</option>
						<option>�λ�</option>
						<option>�뱸</option>
						<option>����</option>
						<option>����</option>
						<option>�¶���</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="���ߺо�" selected="selected">���� �о�</option>
						<option>�鿣��</option>
						<option>����Ʈ����</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="���" selected="selected">���</option>
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
		<input type="submit" value="ã��">
	</div>
</body>
</html>