<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%--/WebContent/jstl/jstlfmtEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���İ��� �±� ���� 2</title>    
</head>     
<body>       
<h3>Format �� ���ڸ� �Ϲ� ���ڷ� ����</h3>  
<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
��:${num1 + num2 }<br>
��:<fmt:formatNumber value="${num1 + num2 }"   
                 pattern="##,###" var="num3"/>
  ${num3}<br>
<h3>Format �� ��¥�� �Ϲ� ��¥�� ����</h3> 
<fmt:parseDate value="2019-10-30 12:00:00"   
     pattern="yyyy-MM-dd HH:mm:ss" var="day"/> 
��¥:${day}<br>    
<h3>2019-10-30�� ���� ����ϱ�</h3>       
2019-10-30 : <fmt:formatDate value="${day}" pattern="E����"/>
</body>
</html>