<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberBean" %>    
<%@ page import="member.MemberDBBean" %>
<html>
<head>
    <title>���� �������� ���ȭ��</title>
    
    <style>
        table{
            margin-left:auto; 
            margin-right:auto;
            border:1px solid;
        }
        
        td{
            border:1px solid;
        }
        
        #title{
            background-color:skyblue
        }
    </style>
</head>
<body>
    <%
   		String id = (String)session.getAttribute("id");
        
        // ���ǿ� ����� ���̵� �����ͼ�
        // �� ���̵� �ش��ϴ� ȸ�������� �����´�.
        MemberDBBean manager = MemberDBBean.getInstance();
        MemberBean mb = manager.getUserInfo(id);
    %>
 	<center>
        <br><br>
        <b><font size="6">�� ����</font></b>
        <br><br><br>
                        <!-- ������ ȸ�������� ����Ѵ�. -->
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%= mb.getMem_id() %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%= mb.getMem_pw() %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td><%= mb.getMem_name() %></td>
            </tr>
                    
            <tr>
                <td id="title">�ֹι�ȣ</td>
                <td><%= mb.getMem_jumin() %></td>
            </tr>
                    
            <tr>
                <td id="title">��ȭ��ȣ</td>
                <td><%= mb.getMem_tel() %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td><%= mb.getMem_email() %></td>
            </tr>
            <tr>
                <td id="title">���ɺо�</td>
                <td><%= mb.getMem_interests() %></td>
            </tr>
            <tr>
                <td id="title">�Ұ���</td>
                <td><textarea><%= mb.getMem_introduce() %></textarea></td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="�ڷ�" onclick="javascript:window.location='main.jsp'">
        <input type="button" value="ȸ����������" onclick="javascript:window.location='memberUpdate.jsp'">
        <input type="button" value="ȸ��Ż��" onclick="javascript:window.location='delete.jsp'">
    </center>
</body>
</html>