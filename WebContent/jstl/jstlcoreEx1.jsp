<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--c => 접두어 
      입력한 주소의 파일의 태그를  c에 가져와서 사용하는 것--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%--/WebContent/jstl/jstlcoreEx1.jsp --%>
<!DOCTYPE html> 
<html>   
<head> 
<meta charset="EUC-KR">
<title>JSTL core 태그 예제: taglib 지시어 표시해야 한다.</title>
</head>
<body>
<h3>속성 설정 태그 : set, remove, out 태그</h3>
<% session.setAttribute("test", "Hello JSTL");%>
<c:set var="test" value="${'Hello JSTL'}" scope="session"/>
test 속성: ${sessionScope.test}<br>
<%--c:out => 더 안전하게 출력이 가능 --%>
test 속성: <c:out value="${test}" /><br>
<c:remove var="test" />
test 속성: ${test}<br> 
</body>
</html>