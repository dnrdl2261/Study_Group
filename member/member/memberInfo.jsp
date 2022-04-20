<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.MemberBean" %>    
<%@ page import="member.MemberDBBean" %>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
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
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDBBean manager = MemberDBBean.getInstance();
        MemberBean mb = manager.getUserInfo(id);
    %>
 	<center>
        <br><br>
        <b><font size="6">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%= mb.getMem_id() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%= mb.getMem_pw() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%= mb.getMem_name() %></td>
            </tr>
                    
            <tr>
                <td id="title">주민번호</td>
                <td><%= mb.getMem_jumin() %></td>
            </tr>
                    
            <tr>
                <td id="title">전화번호</td>
                <td><%= mb.getMem_tel() %></td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td><%= mb.getMem_email() %></td>
            </tr>
            <tr>
                <td id="title">관심분야</td>
                <td><%= mb.getMem_interests() %></td>
            </tr>
            <tr>
                <td id="title">소개글</td>
                <td><textarea><%= mb.getMem_introduce() %></textarea></td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="javascript:window.location='main.jsp'">
        <input type="button" value="회원정보수정" onclick="javascript:window.location='memberUpdate.jsp'">
        <input type="button" value="회원탈퇴" onclick="javascript:window.location='delete.jsp'">
    </center>
</body>
</html>