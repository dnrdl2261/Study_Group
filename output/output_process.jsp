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
<jsp:useBean id = "gsr" class = "studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	response.setCharacterEncoding("UTF-8");
%>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	gsr = gsrd.getRecord(pnum);
%>
<%=gsr.getInout() %>

