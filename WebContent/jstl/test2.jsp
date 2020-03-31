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
이름:<c:out value="${name}"/><br>
<c:set var="age" value="${param.age}"/>
나이:<c:out value="${age}"/><br>
성별:${param.gender ==1?"남":"여" }   
<c:set var="gender" value="${param.gender}"/>
<c:if test="${gender==1}">남</c:if>여
<br> 
<c:set var="year" value="${param.year}"/>
출생년도:<c:out value="${year}"/><br>
나이:만${2019 - param.year}<br>

</body>
</html>