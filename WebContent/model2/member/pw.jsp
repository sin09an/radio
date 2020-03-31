<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
  function pwsend(){
	  self.close();
  }  
</script> 
</head>
<body>  
<form>
 <table>   
   <tr><th>비밀번호</th>  
   <td>${pw}**</td>    
   <td colspan="2">
     <input type="button" value="닫기" onclick="pwsend()"></td>
   </tr>    
 </table>  
</form>
</body>
</html>
