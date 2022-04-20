<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="subStudyGroup.groupStudyRecordBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subStudyGroup.groupStudyRecordDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class ="subStudyGroup.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
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
<script language = javascript>
	function btn_click(index){
		if(index == 1){
			document.form.action = 'input.jsp';
		}else if (index == 2){
			document.form.action = 'confirm.jsp';
		}
		document.form.submit();
	}
</script>
</head>
<body>
	<%-- GROUPING --%>
	<%
		//그룹번호 받아야함
		groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
		ArrayList<groupStudyRecordBean> list = gsrd.listRecord(1);
		ArrayList<groupStudyRecordBean> memlist = gsrd.memlist(1);
	%>
	<%-- 날짜 --%>
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
		for(int i =0; i<memlist.size();i++){
			gsr = memlist.get(i);
	%>
        		<tr>
        			<td class ="date">
				<form method = "post" name = "form">
		        		<b style="float: left;"><%=gsr.getGroupmember() %></b>&emsp;&emsp;
		        		<input type ="hidden" name ="gnum" value = "<%=gsr.getGnum() %>"/>
		        		<input type ="hidden" name ="pnum" value = "<%=gsr.getPnum() %>"/>
		        		<input type ="hidden" name ="groupmember" value = "<%=gsr.getGroupmember() %>"/>
		        		<div style="float: right;">
		        			<input type="submit" value="기록" onclick="javascript: form.action='input.jsp';"/>
		        			<input type="submit" value="확인" onclick="loaction.href='confirm.jsp';"/>
    						<!-- <input type="submit" value="수정" onclick="javascript: form.action='edit.jsp';"/> -->	
		        			<!--  <button onclick="location.href='input2.jsp'">기록</button>
		        			 <button onclick="location.href='edit.jsp';javascript:form.action='edit.jsp'">확인</button>--> 
		        		</div>
        	</form>
        			</td>
        		</tr>
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
		        		<b style="float: left;"><%=gsr.getGroupmember() %></b>&emsp;&emsp;
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
</body>
</html>