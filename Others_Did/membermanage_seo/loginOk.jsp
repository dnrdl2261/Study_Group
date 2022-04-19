<%@page import="member.MemberDBBean"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("mem_id");
	String pw = request.getParameter("mem_pw");
	MemberDBBean manager = MemberDBBean.getInstance();
	
	int check = manager.userCheck(id, pw);
	MemberBean mb = manager.getMember(id);
	
	if(mb == null) {
%>
		<script>alert('존재하지 않는 회원');</script>
<%
	}else {
		String name = mb.getMem_name();
		if(check == 1) { //세션에 사용자 정보 추가 후, main.jsp로 이동
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("Member", "yes"); //임의로 회원일 경우 yes값을 준다
			response.sendRedirect("main.jsp");			
		}else if(check == 0) {
%>
			<script>
				alert('비밀번호가 틀렸습니다.');
				history.go(-1);
			</script>		
<%
		}else { //실제로 검사는 안하지만 case로 처리함
%>
			<script>
				alert('아이디가 맞지 않습니다');
				history.go(-1);
			</script>				
<%
		}
	}
%>