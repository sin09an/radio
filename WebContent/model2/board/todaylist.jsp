<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- WenContent/model2/board/list.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function listdo(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
</head>
<body>

	<form action="todaylist.do" method="post" name="sf">
		<input type="hidden" name="pageNum" value="1"> 
	</form> 


	<table style="margin-top: 35px;">
		<caption>������ ����</caption>
		<c:if test="${boardcnt == 0}">
			<tr>
				<td colsapn="5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0}">
			<tr>
				<th width="10%">��ȣ</th>
				<th width="30%">�����</th>
				<th width="60%">������ ����</th>
			</tr>
			<c:forEach var="b" items="${tolist}">  
				<tr>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum -1}" />
					<td>
				 <a href="todaylist2.do?num=${b.num}">${b.calender }</a>  
						</td>
					 <td>
					${b.todayti}
					 </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3"><c:if test="${pageNum <= 1}">[����]</c:if> <c:if
						test="${pageNum > 1}">
						<%-- pageNum - 1 : ���� �������� ���ư�--%>
						<a href="javascript:listdo(${pageNum -1})">[����]</a>
					</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}">[${a}]</c:if>
						<c:if test="${a!=pageNum}">
							<a href="javascript:listdo(${a})">[${a}]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNum >= maxpage}">[����]</c:if> <c:if
						test="${pageNum < maxpage}">
						<a href="javascript:listdo(${pageNum + 1})">[����]</a>
					</c:if></td>
			</tr>
		</c:if>
	</table>
</body>
</html>
  