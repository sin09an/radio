<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%-- WenContent/model2/board/writeForm.jsp--%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<script
   src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<script>  
  function inputcheck(){
	  var f=document.f;
	  if(f.calender.value==""){
		  alert("���ó�¥�� �Է��ϼ���"); 
		  f.calender.focus();
		  return;
	  }  
	  if(f.todayti.value==""){
		  alert("������ �Է��ϼ���");
		  f.todayti.focus();
		  return;
	  } 
	  f.submit();    
  }
</script>
<link rel="stylesheet" href="../../css/main.css">
</head>  
<body>     
<form action="towrite.do" method="post" name="f"> 
   <table style="margin-top: 35px;">
     <caption>������ ����</caption>
     <tr><td>calender</td><td><input type="text" name="calender"></td></tr>
     <tr><td>������ ����</td><td><input type="text" name="todayti"></td></tr>
     <tr><td colspan="2">         
     <a href="javascript:inputcheck()">[����]</a></td></tr>
   </table>
</form>    
</body>
</html> 