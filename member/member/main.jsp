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
�ȳ��ϼ���. <%= name %>(<%= id %>)��
	<div align="right">
	<%
		// ���� �������� �̵����� �� ���ǿ� ���� ����ִ��� üũ
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		//�α����� ���� �ʾ��� �� �������� ȭ��
		if(id == null) {
	%>
		<input type="button" value="�α���" onclick="javascript:window.location='login.jsp'">
		&nbsp;
		<input type="button" value="ȸ������" onclick="javascript:window.location='register.jsp'">
	<%
		//�α����� �Ǿ� �ִ� ���¿��� �������� ȭ��
		}else{
	%>
		<input type="button" value="������" onclick="javascript:window.location='memberInfo.jsp'">
		&nbsp;
		<input type="button" value="���� ���͵�" onclick="javascript:window.location='.jsp'">
		&nbsp;
		<input type="button" value="�α׾ƿ�" onclick="javascript:window.location='logOut.jsp'">
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
						<option value="����" selected="selected">����</option>
						<option value="seoul">����</option>
						<option value="gyeonggi">���</option>
						<option value="incheon">��õ</option>
						<option value="busan">�λ�</option>
						<option value="daegu">�뱸</option>
						<option value="daejeon">����</option>
						<option value="gwangju">����</option>
						<option value="online">�¶���</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="���ߺо�" selected="selected">���� �о�</option>
						<option value="backend">�鿣��</option>
						<option value="frontend">����Ʈ����</option>
					</select>
				</td>
				<td width="150" align="center">
					<select>
						<option value="���" selected="selected">���</option>
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
		<input type="submit" value="ã��">
	</div>
</body>
</html>