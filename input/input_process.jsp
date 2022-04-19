<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "gsr" class = "studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<%
	response.setCharacterEncoding("UTF-8");
%>
<%	
	String tod = request.getParameter("tod");
	String inout = request.getParameter("inout");
	
	gsr.setTod(tod);
	gsr.setInout(inout);
	groupStudyRecordDBBean gsrdb = groupStudyRecordDBBean.getInstance();
%>
<% 
	int re = gsrdb.insertRecord(gsr);
	if(re == 1){
%>
<script>
		alert("추가 완료");
		
</script>
<%		
	}else{
%>
<script>
		alert("추가 실패");
</script>
<%
}
%>
