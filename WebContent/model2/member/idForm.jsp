<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--/WebContent/model1/board/idForm.jsp --%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>   
<link rel="stylesheet" href="../../css/total.css">  
</head> 
<body>
<form action="id.do" method="post">
  <h3>���̵�ã��</h3> 
  <table>   
     <tr><th>�̸�</th> 
       <td><input type="text" name="name"></td></tr>
     <tr><th>��ȭ��ȣ</th> 
       <td><input type="text" name="tel"></td></tr>
     <tr><th>�̸���</th>
       <td><input type="text" name="email"></td></tr> 
       <tr>     
       <td colspan="2">
       <input type="submit" value="���̵�ã��">  
       </td>      
       </tr>           
  </table>
</form>
</body>
</html>