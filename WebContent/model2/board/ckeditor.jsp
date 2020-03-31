<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- WebContent/model2/board/ckeditor.jsp --%>
<script>
  window.parent.CKEDITOR.tools.callFunction
  (${param.CKEditorFuncNum} 'imgfile/${poto}','이미지 업로드 완료')
</script>                 