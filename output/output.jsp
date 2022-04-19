<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="D:\space_magic\studyTogether\WebContent\js/jquery.js"></script>
<script>
	function sendRequest() {
		$.ajax({
	          url: "output_process.jsp",
	          type: "post",
	          data: {"pnum":0},
	          // dataType 생략가능
	          success:function(data){
	            document.getElementById("text").value = data;
	          },
	          error:function(){
	          }
	        });
	  }
</script>
</head>
<body>
	<button type="button" onclick="sendRequest()">pnum 전송</button>
	<textarea cols = '150' rows = '20' name='text' id='text' style='resize:vertical;'> </textarea>
</body>
</html>


