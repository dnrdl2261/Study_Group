<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class ="studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
    <script>
        $(function () {
            $("#check").click(function () {
                $("#check").hide();
            })
            $("#write").click(function () {
                $("#check").show();
            })
        })
    </script>
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
        	float:left;
            width: 450px;
            height : 50px;
            text-align: center;
            border: 1px solid black;
        }
        .description{
            float: right;
			height : 50px;
            width : 450px;
            border: 1px solid black;
            text-align: center;
        }
        .box{
	        float:left;
            width: 430px;
            height : 80px;
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>
<body>
	<%-- GROUPING --%>
	<%
		groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
		ArrayList<groupStudyRecordBean> list = gsrd.listRecord(1);
	%>
	
	<%	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String nowTime = sdf.format(cal.getTime());
		
	%>
    	<div class ="title" >
      		  <h1>제목</h1>
    	</div>
    	<div class ="title" >
       		 <h1>목표</h1>
    	</div>
        <div>
        	<table class="box">
        		<tr>
        			<td class ="date" colspan="3">
			       		 <h2>Today -<%=nowTime %></h2>
        			</td>
        		</tr>
	<% 
		for(int i =0; i<list.size();i++){
			gsr = list.get(i);
			
	%>
        		
        	<form method = "post" name = "form">
        		<tr>
        			<td class ="date">
		        		<b style="float: left;"><%=gsr.getGroupmember() %></b>&emsp;&emsp;
		        		<input type ="type" name ="pnum" value = "<%=gsr.getPnum() %>"/>
		        		<div style="float: right;">
		        			<button onclick="location.href='input.jsp'">기록</button>
		        			 <!-- <button onclick="location.href='output.jsp';javascript:form.action='output.jsp'">확인</button> --> 
		        			 <button onclick="location.href='output2.jsp';javascript:form.action='output2.jsp'">확인</button> 
		        		</div>
        			</td>
        		</tr>
        	</form>
<% 		
	}	
%>        		
        	</table>
  
        </div>
		 <div>
		 	<table class="description">
		 		<tr>
		 			<td class="description">
				 		<h2>그룹 이름</h2>
		 			</td>
		 		</tr>
	 <% 
		for(int i =0; i<list.size();i++){
			gsr = list.get(i);
			
	%>
		 		<tr>
		 		<td class ="date">
		        		<b style="float: left;">이름</b>&emsp;&emsp;
		        		<div style="float: right;">
		        			<b>언어 / 분야</b>
		        		</div>
        			</td>
		 		</tr>
	<% 		
	}	
	%> 	 		
		 	</table>
	 	</div>
   		
    <!--   <div style="width: 600px">
        <div style="float:left; ">
          <input type = "text" style="width:100px; text-align: center;" value = "이름" >
        </div>
        <div style="margin-left: 485px" id="check">
	        <button onClick='location.href="write.jsp"'>기록하기</button>
			<button onClick='location.href="check.jsp"'>확인하기</button>
        </div>
        </div>
      </div>-->
</body>
</html>