<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
<caption>ȸ�����</caption>
<tr><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>&nbsp;</th></tr>
<c:forEach var="m" items="${list1}">     
<tr><td><a href="info1.do?id=${m.id}">${m.id}</a></td>
<td>${m.name}</td> 
<td>${m.nicname}</td> 
<td>${m.tel}</td>
<td><a href="updateForm.do?id=${m.id}">[����]</a>
<c:if test="${m.id != 'admin'}">
<a href="delete1.do?id=${m.id}">[����Ż��]</a>
</c:if>
</td></tr>
</c:forEach>
</table>
</body>
</html>