<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title> 
</head> 
<body>     
<form method="post"> 
a:<input type="text" name="a" value="${param.a}" size="5">
  <select name="op">
    <option>+</option>
    <option>-</option>   
    <option>*</option> 
    <option>/</option>  
  </select>
  <script>
     var op ='${param.op}'
     if(op=='') op '+'; 
     document.f.op.value = op; 
  </script>    
b:<input type="text" name="b" value="${param.b}" size="5">
  <input type="submit" value="="> 
</form>
 <c:choose>  
   <c:when test="${param.op=='+'}">   
    <h3>${param.a} + ${param.b} = ${param.a + param.b}</h3>        
   </c:when>
    <c:when test="${param.op=='-'}">   
    <h3>${param.a} - ${param.b} = ${param.a - param.b}></h3>   
   </c:when>   
    <c:when test="${param.op=='*'}">   
     <h3>${param.a} * ${param.b} = ${param.a * param.b}</h3>       
   </c:when>
    <c:when test="${param.op=='/'}">     
     <h3>${param.a} / ${param.b} = ${param.a / param.b}</h3>        
   </c:when>
 </c:choose>
</body> 
</html>