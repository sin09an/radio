<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- WenContent/model1/member/DeleteForm.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż�� ��й�ȣ �Է� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body> 
<form action="delete1.do" method="post"> 
<input type="hidden" name="id" 
        value='${param.id}'> 
   <table>
      <caption>ȸ����й�ȣ�Է�</caption>
      <tr><th>��й�ȣ</th>
          <td><input type="password" name="pass"></td></tr>
      <tr><td colspan="2">
          <input type="submit" value="Ż���ϱ�"></td></tr>
   </table>     
</form>
</body>
</html> 