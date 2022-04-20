<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subStudyGroup.groupStudyRecordDBBean"%>
<%@page import="subStudyGroup.groupStudyRecordBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class="subStudyGroup.groupStudyRecordBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="gsr"/>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
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
        .box1{
        	margin: 5px; padding: 5px;
	        float:left;
            width: 540px;
            height : 80px;
            margin-left : 10px;
            text-align: center;
            border: 1px solid black;
            
        }
    </style>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");
%>	
	<%	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일");
		String nowTime = sdf1.format(cal.getTime());
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMdd");
		String tod = sdf2.format(cal.getTime());
	%>
	<%--불러와야 하는거
		이름
		내용
	 --%>
	 <%
	 	//String groupmember = request.getParameter("groupmember");

	 	groupStudyRecordDBBean grdb = groupStudyRecordDBBean.getInstance();
	 	ArrayList<groupStudyRecordBean> conlist = grdb.contentList("홍길동");
	 	String groupmember = "홍길동";
	 %>
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
    <%		//사용자 이름		%>
    <div class ="confirm_wrap" id ="confirm">
        <div class = "in">
            <table class = "box"> 
            <tr>
                <td style="width: 400px;">
                	<h1><%=groupmember %></h1>
                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="location.href='groupframe.jsp';javascript:form.action='groupframe.jsp'">나가기</button>
                </td>
            </tr>
            </table>
        </div>
    </div>
    
    <%	   //작성한 글		%>
        <div class = "in" style="overflow: scroll; width: 540px; height: 300px;">
            <table class = "box1"> 
<% 
	for(int i =0; i< conlist.size();i++){
			gsr = conlist.get(i);
%>
            <tr>
                <td>
	<form method = "post" action = "show.jsp">
                <div>
	                <h1>
		                <input type= "hidden" name = "content" value = "<%=gsr.getContent() %>">
		                <input type= "hidden" name = "tod" value = "<%=tod %>">
		                <!--  <input type= "hidden%=" value = "<gsr.getGroupmember() %>">-->
		                	<%= (i+1)+". " + gsr.getTod()%>
	                </h1>
	             </div>
	             <div>
	             	<input type="submit" value="확인하기"/>
	             </div>
	</form>
                </td>
            </tr>
<% 		
	}	
%>
            </table>
        </div>
    </div>
</body>
</html>










