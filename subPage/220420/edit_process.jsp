<%@page import="subStudyGroup.groupStudyRecordDBBean"%>
<%@page import="subStudyGroup.groupStudyRecordBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "gsr" class = "subStudyGroup.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
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
	String tod = request.getParameter("tod");
	String groupmember = "홍길동";
	//String groupmember = request.getParameter("groupmember");
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	
	int check = gsrd.editBoard(gsr);
	if(check == 1){
		%>
		<script>
				alert("수정 성공");
		</script>
		<%		
			response.sendRedirect("show.jsp");
			}else{
		%>
		<script>
				alert("수정 실패");
				history.go(-1);
		</script>
		<%
			}
		%>


</body>
</html>