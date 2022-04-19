<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new registration</title>
<script src="D:\space_magic\studyTogether\WebContent\js/jquery.js"></script>
<script>
var now = new Date();
var year = now.getFullYear();
var month = now.getMonth()+1;	// ì
var date = now.getDate();	// ì¼
var today = year +""+ month +""+ date;
	  
	$(function() {
		$("#save_data").click(function() {
			alert("succeess");
		        $.ajax({
		            url: "input_process.jsp",
		            type: "post",
		            data: { 
							content:$('#content').val(),
							tod : today,
			                success : function(data){
			                }
						  }
		        });
		});
	});
	
</script>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");
%>
<form method="post"><br><br>
	<textarea cols = '150' rows = '20' name='content' id='content'></textarea>
	<input type="submit" value="기록하기" id="save_data"/>
	<input type="button" value ="그룹 페이지" onclick="javascript:window.location='groupframe.jsp'">
</form>
</body>
</html>