<%@page import="studyTogether.record.groupStudyRecordDBBean"%>
<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class="studyTogether.record.groupStudyRecordBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="gsr"/>
<%
	String content = request.getParameter("content");
	
	int pnum = gsr.getPnum();
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	gsr = gsrd.getRecord(pnum);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
    <script>
    </script>
    <style>
        <style>
        *{margin: 5px; padding: 5px;}
        li{list-style: none;}
        body{width: 1025px}
        a{text-decoration: none;}
        .title{
            width: 1000px;
            height : 50px;
            text-align: center;
            border: 1px solid black;
            margin-bottom: 10px;
            float: left;

        }
        .date{
        	margin: 5px; padding: 0;
        	float:left;
            width: 1000px;
            height : 40px;
            text-align: center;
            border: 1px solid black;
        }
        .confirm_wrap{
            width: 600px;
            text-align: center;
            border: 1px solid black;
            }

           .confirm_wrap .in{
            display: block;
            }
        .box{
        	margin: 5px; padding: 5px;
	        float:left;
            width: 450px;
            height : 80px;
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>
<body>
	<%	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String nowTime = sdf.format(cal.getTime());
		String groupmember = request.getParameter("groupmemeber");
		out.print(groupmember);
	%>
	
 	<form action="editInput.jsp" method="post">
    <div style="width : 1080px;">
    	<div>
            <table class ="title" >
                <tr >
                    <td>
                        <h1>그룹</h1>
                    </td>
                </tr>
            </table>
    	</div>
        <div>
            <table class ="date" >
                <tr >
                    <td>
                        <h1>Today - </h1>
                        <h4><%= nowTime %></h4>
                    </td>
                </tr>
            </table>
        </div>
      
    <div class ="confirm_wrap" id ="confirm">
        <div class = "in">
            <table class = "box"> 
            <tr>
                <td style="width: 1080px;"><h1>오늘 공부한 내용</h1></td>
            </tr>
            <tr>
                <td>
                    <textarea style="width: 980px; resize:vertical;" cols = '150' rows = '10' name='text' >
                    <%= gsr.getContent() %></textarea>
                </td>
            </tr>
            <tr>
                <td>
                	<input type="submit" value="수정">
                    <!-- <button onclick="location.href='groupframe.jsp';javascript:form.action='groupframe.jsp'">나가기</button> -->
                    <button onclick="location.href='groupframe.jsp'">나가기</button>
                </td>
            </tr>
            </table>
        </div>
    </div>
    </div>
    </form>
</body>
</html>










