<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- [
<c:forEach var="map" items="${json}" varStatus="stat1">
      <c:forEach var="m" items="${map}" varStatus="stat2">
      <c:if test="${m.key =='genre'}">{</c:if>
      <c:if test="${m.key !='genre'}">,</c:if>
         "${m.key}":"${m.value}"
      <c:if test="${m.key !='genre'}">}</c:if>
</c:forEach>
  <c:if test="${stat1.count < list.size()}">,</c:if>
</c:forEach>
] ���� �ٽ� Ǯ� ���ʿ���� ${json}���� �޾ƿ��� �ȴ�!!!!!!--%>
${json} 
