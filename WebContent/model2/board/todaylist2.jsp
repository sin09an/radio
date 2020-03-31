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

	<form action="todaylist2.do" method="post" name="sf">
		<input type="hidden" name="boardtype" value="2"> 
		<input type="hidden" name="pageNum" value="1">
    	<div >
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
					<input type="hidden" name="find" value="${param.find}" style="width:50%;"> 
				    <input type="submit" value="�˻�">
				</div>
				</td>
			</tr>
		</table>
	  </div>
	</form>
  

	<table>
		<caption>������ ����</caption> 
		<c:if test="${boardcnt == 0}">
			<tr>
				<td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0}">
			<tr>
				<th width="10%">�����</th>
					<td><c:set var="today" value="<%=new java.util.Date()%>" /> <fmt:formatDate
							value="${today}" pattern="yyyy-MM-dd" var="t" /> <fmt:formatDate
							value="${b.date}" pattern="yyyy-MM-dd" var="r" /> <c:if
							test="${t==r}">
							<fmt:formatDate value="${b.date}" pattern="HH:mm:ss" />
						</c:if> <c:if test="${t!=r}">
							<fmt:formatDate value="${b.date}" pattern="yy-MM-dd  HH:mm" />
						</c:if></td>
				<th width="40%">������ ����</th>
					<td colspan="6">${b.calender}</td>
			</tr>
			<tr>
				<th width="10%">��ȣ</th>
				<th width="10%">ID</th>
				<th width="60%">����</th>
				<th width="10%">�帣</th>
				<th width="10%">��ȸ��</th>
			</tr>
			<c:forEach var="b" items="${tolist}"> 
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
			 <a href=todayreqlist2.do?num=${b.num}">${b.title}</a> 
					</td>				
					<td>${b.genre}</td>
					<td>${b.cnt}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7"><c:if test="${pageNum <= 1}">[����]</c:if> <c:if
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
		<tr>
			<td colspan="7" style="text-align: right"><a href="todaywriteForm.do">[�۾���]</a></td>
		</tr>
	</table>
</body>
</html>
