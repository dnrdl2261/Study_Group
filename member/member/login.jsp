<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
	<style>
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>
	<center>
	<br><br>
	<form method="post" action="loginOk.jsp">
		<h1 align="center">�α���</h1>
		<table border="1" align="center">
			<tr>
				<td align="center" id="title">
					�� �� ��
				</td>
				<td>
					<input type="text" name="mem_id">
				</td>
			</tr>
			<tr>
				<td align="center" id="title">
					��й�ȣ
				</td>
				<td>
					<input type="password" name="mem_pw">
				</td>
			</tr>
		</table>
		
		<br>
		<input type="submit" value="�α���">
		<input type="button" value="ȸ������" onclick="javascript:window.location='register.jsp'">
	</form>
	</center>
</body>
</html>