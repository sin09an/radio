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
		  alert("���� ��й�ȣ�� �Է��ϼ���")
		  f.pass.vlaue="";
		  f.pass.focus();
		  return false;
	  } 
	  else if(f.pass.value != "" && f.pass.value == f.ch.value){
		  alert("���� ��й�ȣ�� �����й�ȣ�� ���� �� �����ϴ�.")
		  f.ch.vlaue="";
		  f.ch.focus();
		  return false;
	  } else {
		  if(f.ch.value != f.re.value){
		  alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
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
  <caption>��й�ȣ ����</caption> 
  <tr><th>�����й�ȣ</th>
  <td><input type="password" name="pass"></td></tr>
  <tr><th>�����й�ȣ</th><td>
  <input type="password" name="ch"></td></tr>
  <tr><th>�����й�ȣ���Է�</th><td>
  <input type="password" name="re"></td></tr>
  <tr><td colspan="3">
  <input type="submit" value="��й�ȣ����"></td></tr>
</table>
</form>
</body> 
</html>