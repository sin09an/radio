<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <!-- WenContent/model2/member/picture.jsp
         1. opener ȭ�鿡 ��� ����  =>javascript����
         2. ���� ȭ�� close() =>javascript����
      -->  
 <script type="text/javascript">
    img = opener.document.getElementById("picture");
    img.src ="picture/${fname}";   
    opener.document.f.picture.value="${fname}";
    self.close();
</script>
