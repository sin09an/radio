
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<html>       
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css"> 
<script>
  function idsend(id){
	  opener.document.f.id.value=id;
	  self.close();
  }
</script> 
</head> 
<body>
<form> 
<table>
<tr><th>아이디</th>
  <td>${id}**</td></tr>  
  <tr><td colspan="2">
  <input type="button" value="아이디전송" 
  onclick="idsend('${id}')"></td></tr>
</table>
</form> 
</body>
</html>
  
