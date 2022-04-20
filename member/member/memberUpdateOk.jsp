<%@page import="member.MemberBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mb" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<% 
	String id = (String)session.getAttribute("id");
	mb.setMem_id(id);
	
	MemberDBBean manager = MemberDBBean.getInstance();
	int re = manager.updateMember(mb);
	
	if(re == 1){
%> 
	<script>
		alert("입력하신대로 회원 정보가 수정되었습니다.");
		document.location.href="main.jsp";
	</script>		
<%
	} else {
%> 
	<script>
		alert("수정이실패되었습니다.");
		history.back();
	</script>			
<%
	}
%>