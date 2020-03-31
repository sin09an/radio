<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보조회</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>${info1.id}님의  프로필 정보</caption> 
		<tr>
			<td rowspan="6"><!-- 그림이 들어가는 공간 -->
			<img src="picture/${info1.picture}"
				width="150" height="180"></td>
			<th>아이디</th>  
			<td>${info1.id}</td> 
		</tr>  
		<tr>  
			<th>이름</th>
			<td>${info1.name}</td> 
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${info1.nicname}</td> 
		</tr> 
		<tr>   
			<th>전화</th>
			<td>${info1.tel}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${info1.email}</td>  
		</tr>
		<tr>  
			<td colspan="2">
			<a href="updateForm.do?id=${info1.id}">[수정]</a>
				<c:if test="${info1.id!='admin' && sessionScope.login!='admin'}">
				   <a href="deleteForm.do?id=${info1.id}">[탈퇴]</a>
				</c:if>   
			</td>
		</tr>
	</table>
</body>
</html>>