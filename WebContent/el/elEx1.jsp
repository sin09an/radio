<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--/jspstudy2/WebContent/el/elEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL(ǥ�����) ����</title>
</head>
<body>
<%
  session.setAttribute("test", "sesstion test �Ӽ�");
  session.setAttribute("today", new Date());
  //test,today �Ӽ� ���
%>
<form action="elEx2.jsp" method="post">
�̸�: <input type="text" name="name" value="ȫ�浿">
     <input type="submit" value="����">
</form>
</body>
</html>