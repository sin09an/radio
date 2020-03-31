<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--/WebContent/model1/board/idForm.jsp --%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>   
<link rel="stylesheet" href="../../css/total.css">  
</head> 
<body>
<form action="id.do" method="post">
  <h3>아이디찾기</h3> 
  <table>   
     <tr><th>이름</th> 
       <td><input type="text" name="name"></td></tr>
     <tr><th>전화번호</th> 
       <td><input type="text" name="tel"></td></tr>
     <tr><th>이메일</th>
       <td><input type="text" name="email"></td></tr> 
       <tr>     
       <td colspan="2">
       <input type="submit" value="아이디찾기">  
       </td>      
       </tr>           
  </table>
</form>
</body>
</html>