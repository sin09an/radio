<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%--/WebContent/jstl/jstlfmtEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt �±� : ���ڵ�</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/> 
<form method="post" name="f">
�̸�:<input type="text" name="name" value="${param.name}"><br>
�Ի���:<input type="text" name="hiredate" value="${param.hiredate}">
 yyyy-MM-dd ���·� �Է�<br>
 �޿�:<input type="text" name="salary" value="${param.salary}"><br>   
 <input type="submit" value="����">
</form>
<hr> 
�̸�:${param.name}<br>
�Ի���:${param.hiredate}<br>
�޿�:${param.salary}<br>
<h3>�Ի����� yyyy��MM��dd�� E���� ���·� ���
     �޿� ���ڸ����� ,�� ����ϱ�
     ���� �޿�*12 ����ϰ� 3�ڸ����� ,�� ���</h3>
<c:catch var="formatexception"> 
<fmt:parseDate value="${param.hiredate}" var="hidate"  
                pattern="yyyy-MM-dd"/>
</c:catch>
<%--������ �߻����� ������(���ܹ߻��ȵ�)--%>
<c:if test="${formatexception ==null}">
�̸�:${param.name}<br>  
�Ի���:  
<fmt:formatDate value="${hidate}"   
                pattern="yyyy��MM��dd��  E����"/><br> 
�޿�:<fmt:formatNumber value="${param.salary}" 
     pattern="###,###"/><br>   
����:<fmt:formatNumber value="${param.salary*12}" 
     pattern="###,###"/>
</c:if>   
 <%--������ �߻��ϸ�(���ܹ߻�)--%>   
<c:if test="${formatexception !=null}">
 <font color="red">�Ի����� yyyy-MM-dd ���·� �Է��ϼ���</font>
</c:if>
</body>
</html>