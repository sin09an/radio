<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- WenContent/model1/board/deleteForm.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css"> 
</head>    
<body>
<form action="delete.do" name="f" method="post">
<input type="hidden" name="num"
        value="${param.num}">
    <table> 
       <caption>�Խñ� ���� ȭ��</caption>
       <tr><th>�Խñ� ��й�ȣ</th> 
       <td><input type="password" name="pass"></td>
       </tr>
       <tr><td colspan="2">  
          <input type="submit" value="�Խñ� ����"></td>
       </tr>
    </table>
</form>
</body>
</html>