<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new registration</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMdd");
%>

<%
	int gnum = Integer.parseInt(request.getParameter("gnum"));
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String groupmember = request.getParameter("groupmember");
	
	String tod = sdf.format(cal.getTime());
%>


<form method="post" action = input_process.jsp>
	<input type ="hidden" value ="<%=gnum %>" name ="tod">
	<input type ="hidden" value ="<%=pnum %>" name ="tod">
	<input type ="hidden" value ="<%=tod %>" name ="tod">
	<input type ="hidden" value ="<%=groupmember %>" name = "groupmember">
	<textarea cols = '150' rows = '20' name='content' id='content'></textarea>
	<input type="submit" value="기록하기">
</form>
	<input type="button" value ="그룹 페이지" onclick="javascript:window.location='groupframe.jsp'">
</body>
</html>