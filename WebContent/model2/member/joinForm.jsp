<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- WenContent/model2/member/loginForm.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
   function win_upload(){  
	   var op ="width=500, height=150, left=50, top=150";
	   open("pictureForm.do","",op);
   }
   
   function check(){
 	  f=document.f;
 	  if(f.id.value==""){
 		  alert("���̵� �Է��ϼ���");
 		  f.id.focus();
 		  return false;
 	  }
 	  if(f.pass.value==""){
 		  alert("��й�ȣ�� �Է��ϼ���");
 		  f.pass.focus();
 		  return false;
 	  }
 	  if(f.name.value==""){
 		  alert("�̸��� �Է��ϼ���");
 		  f.name.focus();
 		  return false;
 	  } 
 	  if(f.nicname.value==""){
 		  alert("�г����� �Է��ϼ���");
 		  f.nicname.focus();
 		  return false;
 	  } 
 	  if(f.tel.value==""){
 		  alert("��ȭ��ȣ�� �Է��ϼ���");
 		  f.tel.focus();
 		  return false;
 	  } 
 	  if(f.email.value==""){
 		  alert("�̸����� �Է��ϼ���");
 		  f.email.focus();
 		  return false;
 	  }    
   }
</script>
</head>    
<body> 
<form action="join.do" name="f" method="post" onsubmit="return check()">
<input type="hidden" name="picture" value="">
<table><tr><td rowspan="4" valign="bottom"> 
      <img src="" width="100" height="120" id="picture"><br>
      <font size="1">
      <a href="javascript:win_upload()">�������</a></font>
          </td>
          <th>���̵�</th><td><input type="text" name="id"></td></tr>
          <tr><th>��й�ȣ</th>
          <td><input type="password" name="pass"></td></tr>
          <tr><th>�̸�</th><td><input type="text" name="name"></td></tr>
          <tr><th>�г���</th><td><input type="text" name="nicname"></td></tr>        
          <tr><th>��ȭ��ȣ</th>
          <td colspan="2"><input type="text" name="tel"></td></tr>
          <tr><th>�̸���</th>
          <td colspan="2"><input type="text" name="email"></td></tr>
          <tr><td colspan="3">
          <input type="submit" value="ȸ������">   
          </td></tr>
</table> 
</form>
</body>
</html>