<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String mem_id = request.getParameter("mem_id");
%>
<html>
<head>
    <title>ȸ��Ż��</title>
    <script type="text/javascript">
        // ��й�ȣ ���Է½� ���â
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
                return false;
            }
        }
    </script>
</head>
<body>
 	<center>
	    <br><br>
	    <b><font size="6">ȸ��Ż��</font></b>
	    <br><br><br>
	 
	    <form name="deleteform" method="post" action="deleteOk.jsp?mem_id=<%= mem_id %>"
	        onsubmit="return checkValue()">
	 
	        <table>
	            <tr>
	                <td bgcolor="skyblue">��й�ȣ</td>
	                <td><input type="password" name="mem_pw" maxlength="50"></td>
	            </tr>
	        </table>
	        
	        <br> 
	        <input type="button" value="���" onclick="javascript:window.location='main.jsp'">
	        <input type="submit" value="Ż��" /> 
	    </form>
	</center>
</body>
</html>
