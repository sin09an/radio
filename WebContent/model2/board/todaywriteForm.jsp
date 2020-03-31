<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%-- WenContent/model2/board/writeForm.jsp--%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<script
   src = "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
<script>  
  function inputcheck(){
	  var f=document.f;
	  if(f.id.value==""){
		  alert("ID를 입력하세요");
		  f.id.focus();
		  return;
	  }
	  if(f.title.value==""){
		  alert("제목를 입력하세요");
		  f.title.focus();
		  return;
	  }
	  f.submit(); 
  }
</script>
<link rel="stylesheet" href="../../css/main.css">
</head>  
<body>   
<form action="todaywrite.do" method="post" name="f" enctype="multipart/form-data"> 
      <%--enctype="multipart/form-data 첨부파일 올리기~!!!--%>
      <input type ="hidden" name="boardtype" value="2">
   <table>
     <caption>오늘의 주제</caption>
     <tr><th>ID</td><td><input type="text" name="id"></th></tr>
     <tr><th>제목</td><td><input type="text" name="title"></th></tr>
     <tr><th>장르</th>
     <td>         
  	 	<select name="genre"> 
    		<option value="재미">재미</option> 
    		<option value="공포">공포</option>
    		<option value="화남">화남</option>
    		<option value="슬픔">슬픔</option>
    		<option value="가족">가족</option>
    		<option value="민망">민망</option>       
    		<option value="신남">신남</option>      
  		</select>
     </td>   
     </tr> 
     <tr><th>내용</th> 
       <td>
         <textarea rows="15" name="content" id="content"></textarea>
       </td>
    </tr>
     <script>
  <%--filebrowserImageUploadUrl : 이미지 업로드 설정 
      imgupload.do : 업로드를 위한 url 지정
   --%>
       CKEDITOR.replace("content",{filebrowserImageUploadUrl :"imgupload.do"});
     </script>
     <tr><th>첨부파일</th><td><input type="file" name="poto"></td></tr>
     <tr><td colspan="2">         
     <a href="javascript:inputcheck()">[저장]</a></td></tr>
   </table>
</form>    
</body>
</html>