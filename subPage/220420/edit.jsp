<%@page import="subStudyGroup.groupStudyRecordDBBean"%>
<%@page import="subStudyGroup.groupStudyRecordBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class="subStudyGroup.groupStudyRecordBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="gsr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");
%>
<%
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	//String groupmember = request.getParameter("groupmember");
	//String tod = request.getParameter("tod");
%>
</body>
	<form method="post" name="edit">
		<textarea cols = '150' rows = '20' name='text' id='text' style='resize:vertical;'>
		
		</textarea>
		<input type="submit" value="update" onclick="javascript: edit.action='edit_process.jsp';"/>
	</form>
</html>