<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- WenContent/model1/member/pictureForm.jsp-->
<!DOCTYPE html>
<html> 
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>�������ε�</h3> 
<form action="picture.do" method="post"
      enctype="multipart/form-data">
      <input type="file" name="picture">  
      <input type="submit" value="�������">
</form>
</body>
</html>