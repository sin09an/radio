<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--c => ���ξ� 
      �Է��� �ּ��� ������ �±׸�  c�� �����ͼ� ����ϴ� ��--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%--/WebContent/jstl/jstlcoreEx1.jsp --%>
<!DOCTYPE html> 
<html>   
<head> 
<meta charset="EUC-KR">
<title>JSTL core �±� ����: taglib ���þ� ǥ���ؾ� �Ѵ�.</title>
</head>
<body>
<h3>�Ӽ� ���� �±� : set, remove, out �±�</h3>
<% session.setAttribute("test", "Hello JSTL");%>
<c:set var="test" value="${'Hello JSTL'}" scope="session"/>
test �Ӽ�: ${sessionScope.test}<br>
<%--c:out => �� �����ϰ� ����� ���� --%>
test �Ӽ�: <c:out value="${test}" /><br>
<c:remove var="test" />
test �Ӽ�: ${test}<br> 
</body>
</html>