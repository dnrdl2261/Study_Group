<%@page import="java.text.SimpleDateFormat"%>
<%@page import="subStudyGroup.groupStudyRecordDBBean"%>
<%@page import="subStudyGroup.groupStudyRecordBean"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "gsr" class = "subStudyGroup.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	String tod = request.getParameter("tod");
	String groupmember = "홍길동";
	//String groupmember = request.getParameter("groupmember");
	gsr = gsrd.getRecord(groupmember, tod);
%>

<%--
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMdd");
	String tod = sdf.format(cal.getTime());
--%>

<%--
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	String content = request.getParameter("content");
	//String groupmember = request.getParameter("groupmember");
	gsrd.getRecord("홍길동", tod);
	//gsrd.getRecord(groupmember, tod);
--%>
	<form method = "post" action ="edit.jsp">
		<textarea cols = '150' rows = '20' name='text' style='resize:vertical;'>
			<%=gsr.getContent() %>
		</textarea>
		<input type= "hidden" name = "tod" value = "<%=tod %>">
		<input type = "button" value = "글수정" onclick = "location.href='edit.jsp'">
	</form>
		<input type = "button" value = "글목록" onclick = "location.href='confirm.jsp'">
</body>
</html>   


