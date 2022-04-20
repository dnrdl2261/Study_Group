<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String mem_id = request.getParameter("mem_id");
%>
<html>
<head>
    <title>회원탈퇴</title>
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
</head>
<body>
 	<center>
	    <br><br>
	    <b><font size="6">회원탈퇴</font></b>
	    <br><br><br>
	 
	    <form name="deleteform" method="post" action="deleteOk.jsp?mem_id=<%= mem_id %>"
	        onsubmit="return checkValue()">
	 
	        <table>
	            <tr>
	                <td bgcolor="skyblue">비밀번호</td>
	                <td><input type="password" name="mem_pw" maxlength="50"></td>
	            </tr>
	        </table>
	        
	        <br> 
	        <input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
	        <input type="submit" value="탈퇴" /> 
	    </form>
	</center>
</body>
</html>
