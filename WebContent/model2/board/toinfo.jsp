<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR"> 
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table> 
  <caption>상세 보기</caption>
  <tr><th>등록일</th>
    <td style="text-align:left"><input type="text" name="date" readonly value="${b.date}"></td></tr>
  <tr><th>오늘의 주제</th>
    <td style="text-align:left"><input type="text" name="calender" readonly value="${b.calender}"></td></tr>
  <tr>  
  <tr><th width="20">ID</th>
    <td width="80" style="text-align:left">${b.id}</td></tr>
  <tr><th>제목</th>
    <td style="text-align:left">${b.title}</td></tr>
  <tr><th>장르</th>
    <td style="text-align:left">${b.genre}</td></tr>
  	<tr>
  	<th>내용</th>
    <td>
    	<table style="width:100%; height:250px;">
    	<tr>
    		<td style="border-width:0px; vertical-align:top; text-align:left">
    		${b.content}</td>     
  		</tr> 
  		</table>  
  	</td>
  </tr>
  <tr>
  <th>사진</th>
  	<td>
  	 <c:if test="${empty b.poto}">&nbsp;</c:if>
       <c:if test="${!empty b.poto}">
       <a href="file/${b.poto}">${b.poto}</a>
     </c:if> 
   </td>  
  </tr>  
  <tr>     
  <td colspan="2">
  <a href="list.do">[목록]</a> 
  </td>
  </tr>
</table> 
<br><br><br><br><br><br><br><br>
<form action="review.do?num=${b.num}" method="post" name="f"> 
<input type="hidden" name="num" value="${b.num}">  
<input type="hidden" name="id" value="${sessionScope.login}"> 
<input type="hidden" name="req" value="${re.req}">  
<input type="hidden" name="boardtype" value="2">  
	<table>
		<caption>답글등록</caption>
		<tr> 
			<td>댓글</td>
			<td><textarea name="content" rows="3"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
			</td>
		</tr> 
	</table>  
	  <table>
		<caption>댓글목록</caption>   
		<c:if test="${reqcnt == 0}">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${reqcnt > 0}">
			<tr>
				<td colspan="5" style="text-align: right">글개수:${reqcnt}</td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">ID</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${reqnum}</td>
					<c:set var="reqnum" value="${reqnum -1}" />
					<td>${b.content}</td>
					<td>${b.id}</td>
					  
			</c:forEach>
			<tr>
				<td colspan="5"><c:if test="${pageNum <= 1}">[이전]</c:if> 
				<c:if test="${pageNum > 1}">
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
	</table>
</form>
</body>
</html>