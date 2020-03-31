<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- WenContent/model2/board/list.jsp--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
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
						<option value="">장르</option>
						<option value="재미">재미</option>
						<option value="공포">공포</option>
						<option value="화남">화남</option>
						<option value="슬픔">슬픔</option>
	 					<option value="가족">가족</option>
						<option value="민망">민망</option>
						<option value="신남">신남</option>
				</select>
			    <script>
					document.sf.column.value = "${param.column}";
				</script>
					<input type="hidden" name="find" value="${param.find}" style="width:50%;"> 
				    <input type="submit" value="검색">
				</div>
				</td>
			</tr>
		</table>
	  </div>
	</form>
  

	<table>
		<caption>오늘의 주제</caption> 
		<c:if test="${boardcnt == 0}">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0}">
			<tr>
				<th width="10%">등록일</th>
					<td><c:set var="today" value="<%=new java.util.Date()%>" /> <fmt:formatDate
							value="${today}" pattern="yyyy-MM-dd" var="t" /> <fmt:formatDate
							value="${b.date}" pattern="yyyy-MM-dd" var="r" /> <c:if
							test="${t==r}">
							<fmt:formatDate value="${b.date}" pattern="HH:mm:ss" />
						</c:if> <c:if test="${t!=r}">
							<fmt:formatDate value="${b.date}" pattern="yy-MM-dd  HH:mm" />
						</c:if></td>
				<th width="40%">오늘의 주제</th>
					<td colspan="6">${b.calender}</td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="10%">ID</th>
				<th width="60%">제목</th>
				<th width="10%">장르</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="b" items="${tolist}"> 
				<tr> 
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum -1}" />
					<td>${b.id}</td>
					<td style="text-align: left">
						<%--첨부파일 표시하기 --%> 
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
				<td colspan="7"><c:if test="${pageNum <= 1}">[이전]</c:if> <c:if
						test="${pageNum > 1}">
						<%-- pageNum - 1 : 이전 페이지로 돌아가--%>
						<a href="javascript:listdo(${pageNum -1})">[이전]</a>
					</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==pageNum}">[${a}]</c:if>
						<c:if test="${a!=pageNum}">
							<a href="javascript:listdo(${a})">[${a}]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNum >= maxpage}">[다음]</c:if> <c:if
						test="${pageNum < maxpage}">
						<a href="javascript:listdo(${pageNum + 1})">[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="7" style="text-align: right"><a href="todaywriteForm.do">[글쓰기]</a></td>
		</tr>
	</table>
</body>
</html>
