<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function win_upload() {
		var op = "width=500,height=150,left=50,top=150"
		open("pictureForm.do","",op); 
	}
	function change() {
			var op = "width=500,height=150,left=50,top=150"
			open("passwordForm.do","",op);
		} 
	function inputcheck(f){
		/* <c:if test="${sessionScope.login !='admin'}">  */
		  if(f.pass.value==""){
			  alert("��й�ȣ�Է��ϼ���");
			  f.pass.focus();
			  return false;
		  }    
		 </c:if>
	}            
</script> 
 
</head>
<body> 
	<form action="update1.do" name="f" method="post"
		onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${info1.picture}">
		<table>
			<caption>ȸ�� ���� ����</caption>
			<tr>   
				<td rowspan="4" valign="bottom"><img
					src="picture/${info1.picture}" width="100" height="120"
					id="picture"><br> <font size="1"><a
						href="javascript:win_upload()">��������</a></font></td>
				<th>���̵�</th>
				<td><input type="text" name="id" readonly value="${info1.id}">
					</td>          
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name" value="${info1.name}"></td>
			</tr>
			<tr>
				<th>�г���</th>
				<td><input type="text" name="nicname" value="${info1.nicname}"></td>
			</tr>
		
			<tr>    
				<th>��ȭ��ȣ</th>
				<td colspan="2"><input type="text" name="tel"
					value="${info1.tel}"></td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td colspan="2"><input type="text" name="email"
					value="${info1.email}"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="ȸ������"> <input
					type="button" value="��й�ȣ����" onclick="javascript:change()"></td>
			</tr>
		</table>
	</form>
</body>
</html>