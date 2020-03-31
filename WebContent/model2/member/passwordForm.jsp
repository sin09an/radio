<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<script>
  function pck(f){  
	  if(f.pass.value == ""){
		  alert("현재 비밀번호를 입력하세요")
		  f.pass.vlaue="";
		  f.pass.focus();
		  return false;
	  } 
	  else if(f.pass.value != "" && f.pass.value == f.ch.value){
		  alert("기존 비밀번호와 변경비밀번호는 같을 수 없습니다.")
		  f.ch.vlaue="";
		  f.ch.focus();
		  return false;
	  } else {
		  if(f.ch.value != f.re.value){
		  alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
		  f.ch.value="";
		  f.ch.focus();
		  return false;
		  }
	  }    
  }    
</script> 
<body>  
<form action="password.do" method="post" 
      onsubmit="return pck(this)">    
<table> 
  <caption>비밀번호 변경</caption> 
  <tr><th>현재비밀번호</th>
  <td><input type="password" name="pass"></td></tr>
  <tr><th>변경비밀번호</th><td>
  <input type="password" name="ch"></td></tr>
  <tr><th>변경비밀번호재입력</th><td>
  <input type="password" name="re"></td></tr>
  <tr><td colspan="3">
  <input type="submit" value="비밀번호변경"></td></tr>
</table>
</form>
</body> 
</html>