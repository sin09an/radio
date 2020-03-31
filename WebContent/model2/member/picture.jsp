<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <!-- WenContent/model2/member/picture.jsp
         1. opener 화면에 결과 전달  =>javascript영역
         2. 현재 화면 close() =>javascript영역
      -->  
 <script type="text/javascript">
    img = opener.document.getElementById("picture");
    img.src ="picture/${fname}";   
    opener.document.f.picture.value="${fname}";
    self.close();
</script>
