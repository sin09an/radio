<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR"> 
<title >�Խù� �� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table style="margin-top: 35px;"> 
  <caption >�� ����</caption>
  <tr><th width="20">ID</th>
    <td width="80" style="text-align:left">${b.id}</td></tr>
  <tr><th>����</th>
    <td style="text-align:left">${b.title}</td></tr>
  <tr><th>�帣</th>
    <td style="text-align:left">${b.genre}</td></tr>
  <tr><th>�����</th>
    <td style="text-align:left">${b.date}</td></tr>
  <tr>  
  	<th>����</th>
    <td>
    	<table style="width:100%; height:250px;">
    	<tr>
    		<td style="border-width:0px; vertical-align:top; text-align:left">
    		${b.content}</td>     
  		</tr> 
  		</table>  
  	</td>
  </tr>
  <tr>
  <th>����</th>
  	<td>
  	 <c:if test="${empty b.poto}">&nbsp;</c:if>
       <c:if test="${!empty b.poto}">
       <a href="file/${b.poto}">${b.poto}</a>
     </c:if> 
   </td>  
  </tr>  
  <tr>     
  <td colspan="2"> 
  <a href="mylist3.do">[���]</a>    
  <div style="float: right;">
     <!-- <form action="updateForm.do" method="post" name="f">-->
    <input type="submit" class="w3-button w3-amber" value="����">
    <!-- </form>  -->
    <!-- <form action="deleteForm.do" method="post" name="f"> -->
    <input type="submit" class="w3-button w3-amber" value="����">
	<!-- </form> -->   
  </div> 
  </td>
  </tr> 
</table> 
<br><br><br><br><br><br><br><br>
<form action="review.do?num=${b.num}" method="post" name="f"> 
<input type="hidden" name="num" value="${b.num}">  
<input type="hidden" name="id" value="${sessionScope.login}"> 
<input type="hidden" name="req" value="${re.req}">  
<input type="hidden" name="boardtype" value="3">  
</form>
</body>
</html>