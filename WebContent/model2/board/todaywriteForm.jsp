<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%-- WenContent/model2/board/writeForm.jsp--%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<script
   src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<script>  
  function inputcheck(){
	  var f=document.f;
	  if(f.id.value==""){
		  alert("ID�� �Է��ϼ���");
		  f.id.focus();
		  return;
	  }
	  if(f.title.value==""){
		  alert("���� �Է��ϼ���");
		  f.title.focus();
		  return;
	  }
	  f.submit(); 
  }
</script>
<link rel="stylesheet" href="../../css/main.css">
</head>  
<body>   
<form action="todaywrite.do" method="post" name="f" enctype="multipart/form-data"> 
      <%--enctype="multipart/form-data ÷������ �ø���~!!!--%>
      <input type ="hidden" name="boardtype" value="2">
   <table>
     <caption>������ ����</caption>
     <tr><th>ID</td><td><input type="text" name="id"></th></tr>
     <tr><th>����</td><td><input type="text" name="title"></th></tr>
     <tr><th>�帣</th>
     <td>         
  	 	<select name="genre"> 
    		<option value="���">���</option> 
    		<option value="����">����</option>
    		<option value="ȭ��">ȭ��</option>
    		<option value="����">����</option>
    		<option value="����">����</option>
    		<option value="�θ�">�θ�</option>       
    		<option value="�ų�">�ų�</option>      
  		</select>
     </td>   
     </tr> 
     <tr><th>����</th> 
       <td>
         <textarea rows="15" name="content" id="content"></textarea>
       </td>
    </tr>
     <script>
  <%--filebrowserImageUploadUrl : �̹��� ���ε� ���� 
      imgupload.do : ���ε带 ���� url ����
   --%>
       CKEDITOR.replace("content",{filebrowserImageUploadUrl :"imgupload.do"});
     </script>
     <tr><th>÷������</th><td><input type="file" name="poto"></td></tr>
     <tr><td colspan="2">         
     <a href="javascript:inputcheck()">[����]</a></td></tr>
   </table>
</form>    
</body>
</html>