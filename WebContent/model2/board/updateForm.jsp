<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- WenContent/model2/board/updateForm.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
   function file_delete(){ 
	   //���� ��ü�� �����Ǵ°��̾ƴϰ� db�� ���� ���� ���Ḹ �����ִ°�.
	   document.f.file2.value="";
	   file_desc.style.display="none";  
   } 
  <%--flie_desc=> div id--%>
</script> 
</head>
<body>  
<form action="update.do" method="post" 
      enctype="multipart/form-data" name="f">
  <input type="hidden" name="num" value="${b.num}">
  <input type="hidden" name="file2" value="${b.poto}"> 
  <table>   
    <caption>�Խ��� ���� ȭ��</caption>  
    <tr><th>�г���</th>
        <td><input type="text" name="nicname" value="${b.nicname}"></td>
    </tr>
    <tr><th>��й�ȣ</th> 
        <td><input type="password" name="pass"></td>
    </tr>
    <tr><th>����</th>
        <td><input type="text" name="title" value="${b.title}"></td>
    </tr>
    <tr><th>����</th>  
        <td><textarea rows="15" name="content" id="content1">${b.content}</textarea></td>
        <script>
        CKEDITOR.replace("content1",{filebrowserImageUploadUrl :"imgupload.do"});
        </script> 
    </tr>   
    <tr><th>÷������</th>
        <td style="text-align:left">      
          <c:if test="${!empty b.poto}"> 
          <div id="file_desc">${b.poto}
              <a href="javascript:file_delete()">[÷�����ϻ���]</a></div>
          </c:if>       
       <input type="file" name="poto"></td>
    </tr>
    <tr><td colspan="2"> 
        <a href ="javascript:document.f.submit()">[�Խù�����]</a></td>
    </tr>
  </table> 
</form>
</body>
</html>