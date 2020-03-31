<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%-- WenContent/model2/board/writeForm.jsp--%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주제</title>
<script
   src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<script>  
  function inputcheck(){
	  var f=document.f;
	  if(f.calender.value==""){
		  alert("오늘날짜를 입력하세요"); 
		  f.calender.focus();
		  return;
	  }  
	  if(f.todayti.value==""){
		  alert("주제를 입력하세요");
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
     <caption>오늘의 주제</caption>
     <tr><td>calender</td><td><input type="text" name="calender"></td></tr>
     <tr><td>오늘의 주제</td><td><input type="text" name="todayti"></td></tr>
     <tr><td colspan="2">         
     <a href="javascript:inputcheck()">[저장]</a></td></tr>
   </table>
</form>    
</body>
</html> 