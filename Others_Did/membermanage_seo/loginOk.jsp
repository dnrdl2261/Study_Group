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
		<script>alert('�������� �ʴ� ȸ��');</script>
<%
	}else {
		String name = mb.getMem_name();
		if(check == 1) { //���ǿ� ����� ���� �߰� ��, main.jsp�� �̵�
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("Member", "yes"); //���Ƿ� ȸ���� ��� yes���� �ش�
			response.sendRedirect("main.jsp");			
		}else if(check == 0) {
%>
			<script>
				alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
				history.go(-1);
			</script>		
<%
		}else { //������ �˻�� �������� case�� ó����
%>
			<script>
				alert('���̵� ���� �ʽ��ϴ�');
				history.go(-1);
			</script>				
<%
		}
	}
%>