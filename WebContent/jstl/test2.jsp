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
<%request.setCharacterEncoding("euc-kr");%>
<c:set var="name" value="${param.name}"/>
�̸�:<c:out value="${name}"/><br>
<c:set var="age" value="${param.age}"/>
����:<c:out value="${age}"/><br>
����:${param.gender ==1?"��":"��" }   
<c:set var="gender" value="${param.gender}"/>
<c:if test="${gender==1}">��</c:if>��
<br> 
<c:set var="year" value="${param.year}"/>
����⵵:<c:out value="${year}"/><br>
����:��${2019 - param.year}<br>

</body>
</html>