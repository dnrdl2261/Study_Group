<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberBean" %>    
<%@ page import="member.MemberDBBean" %>    
<html>
<head>
    <title>ȸ�� ���� ó��</title>
</head>
<body>
    <%
 		String id = (String)session.getAttribute("id");
  		String pw = request.getParameter("mem_pw");
        
        // ���ǿ��� ���̵�, delete.jsp���� �Է¹��� ��й�ȣ�� �����´�.
        // ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
        MemberDBBean manager = MemberDBBean.getInstance();
        int check = manager.deleteMember(id, pw);
        
        if(check == 1){
            session.invalidate(); // �����ߴٸ� ���������� �����Ѵ�.
    %>
   		<center>
        <br><br>
        <b><font size="4">ȸ�������� �����Ǿ����ϴ�.</font></b>
        <br><br><br>
    
        <input type="button" value="Ȯ��" onclick="javascript:window.location='login.jsp'">
   		</center>
    
    <%    
         // ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
        }else{
    %>
        <script>
            alert("��й�ȣ�� ���� �ʽ��ϴ�.");
            history.go(-1);
        </script>
    <%
        } 
    %>
</body>
</html>