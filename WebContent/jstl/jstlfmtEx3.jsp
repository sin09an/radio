<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%--/WebContent/jstl/jstlfmtEx2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
<fmt:requestEncoding value="euc-kr"/> 
<form method="post" name="f">
이름:<input type="text" name="name" value="${param.name}"><br>
입사일:<input type="text" name="hiredate" value="${param.hiredate}">
 yyyy-MM-dd 형태로 입력<br>
 급여:<input type="text" name="salary" value="${param.salary}"><br>   
 <input type="submit" value="전송">
</form>
<hr> 
이름:${param.name}<br>
입사일:${param.hiredate}<br>
급여:${param.salary}<br>
<h3>입사일은 yyyy년MM월dd일 E요일 형태로 출력
     급여 세자리마다 ,를 출력하기
     연봉 급여*12 계산하고 3자리마다 ,를 출력</h3>
<c:catch var="formatexception"> 
<fmt:parseDate value="${param.hiredate}" var="hidate"  
                pattern="yyyy-MM-dd"/>
</c:catch>
<%--에러가 발생하지 않으면(예외발생안됨)--%>
<c:if test="${formatexception ==null}">
이름:${param.name}<br>  
입사일:  
<fmt:formatDate value="${hidate}"   
                pattern="yyyy년MM월dd일  E요일"/><br> 
급여:<fmt:formatNumber value="${param.salary}" 
     pattern="###,###"/><br>   
연봉:<fmt:formatNumber value="${param.salary*12}" 
     pattern="###,###"/>
</c:if>   
 <%--에러가 발생하면(예외발생)--%>   
<c:if test="${formatexception !=null}">
 <font color="red">입사일은 yyyy-MM-dd 형태로 입력하세요</font>
</c:if>
</body>
</html>