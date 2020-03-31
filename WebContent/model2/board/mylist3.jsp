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
	<form action="mylist3.do" method="post" name="sf">
		<input type="hidden" name="boardtype" value="3">  
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="id" value="${id}">
		<table>  
			<tr> 
				<td style="border-width: 0px;">  
				<div style="position: relative; left: 40%">
				<select name="column" style="width: 200px;">
		 				<option value="">�帣</option>
						<option value="���">���</option>
						<option value="����">����</option> 
						<option value="ȭ��">ȭ��</option> 
						<option value="����">����</option> 
						<option value="����">����</option>
						<option value="�θ�">�θ�</option>
						<option value="�ų�">�ų�</option>
				</select>
			    <script>
					document.sf.column.value = "${param.column}";
				</script> 
					<input type="hidden" name="find" value="${param.find}">
				    <input type="submit" value="�˻�">
				</div> 
				</td>
			</tr>
		</table>
	</form>  


	<table>
		<caption>���׽�Ʈ</caption>
		<c:if test="${boardcntmy == 0}">
			<tr>
				<td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcntmy > 0}">
			<tr>
				<th width="8%">��ȣ</th>
				<th width="10%">ID</th>
				<th width="47%">����</th>
				<th width="17%">�����</th>
				<th width="10%">�帣</th>
			</tr>
			<c:forEach var="b" items="${list3}"> 
				<tr> 
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum -1}" />
					<td>${b.id}</td>
					<td style="text-align: left">
						<%--÷������ ǥ���ϱ� --%> 
						<c:if test="${!empty b.poto}">
							<a href="file/${b.poto}" style="text-decoration: none;">@</a>
						</c:if> 
						<c:if test="${empty b.poto}">&nbsp;&nbsp;&nbsp;</c:if> 
			 <a href="mylistinfo3.do?num=${b.num}">${b.title}</a>
					</td>	 			
					<td><c:set var="today" value="<%=new java.util.Date()%>" /> <fmt:formatDate
							value="${today}" pattern="yyyy-MM-dd" var="t" /> <fmt:formatDate
							value="${b.date}" pattern="yyyy-MM-dd" var="r" /> <c:if
							test="${t==r}">
							<fmt:formatDate value="${b.date}" pattern="HH:mm:ss" />
						</c:if> <c:if test="${t!=r}">
							<fmt:formatDate value="${b.date}" pattern="yy-MM-dd" />
						</c:if></td>
					<td>${b.genre}</td> 
				</tr> 
			</c:forEach>  
			<tr>
				<td colspan="6"><c:if test="${pageNum <= 1}">[����]</c:if> <c:if
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