<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��������ȸ</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>${info1.id}����  ������ ����</caption> 
		<tr>
			<td rowspan="6"><!-- �׸��� ���� ���� -->
			<img src="picture/${info1.picture}"
				width="150" height="180"></td>
			<th>���̵�</th>  
			<td>${info1.id}</td> 
		</tr>  
		<tr>  
			<th>�̸�</th>
			<td>${info1.name}</td> 
		</tr>
		<tr>
			<th>�г���</th>
			<td>${info1.nicname}</td> 
		</tr> 
		<tr>   
			<th>��ȭ</th>
			<td>${info1.tel}</td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td>${info1.email}</td>  
		</tr>
		<tr>  
			<td colspan="2">
			<a href="updateForm.do?id=${info1.id}">[����]</a>
				<c:if test="${info1.id!='admin' && sessionScope.login!='admin'}">
				   <a href="deleteForm.do?id=${info1.id}">[Ż��]</a>
				</c:if>   
			</td>
		</tr>
	</table>
</body>
</html>>