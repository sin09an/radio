 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!-- WenContent/model2/member/loginForm.jsp-->
<!DOCTYPE html> 
<html>   
<head>
<meta charset="EUC-KR">          
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">




<!-- <style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
</style>
 -->
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
function win_open(page) { 
	var op = "width=500,height=300,left=50,top=150"
	open(page+".do","",op);
}     
</script>
</head>          
<body>      
   <div class="login-page">
  <div class="form"> 

    <form action="login.do" method="post" name="f" class="login-form">
      <input type="text" name="id"  placeholder="ID"/>
      <input type="password" name="pass" placeholder="pw"/>
       <input type="submit" value="�α���">  
     <input type="button" value="ȸ������"
            onclick="location.href='joinForm.jsp'">
     <input type="button" value="���̵�ã��"
            onclick="win_open('idForm')"> 
     <input type="button" value="��й�ȣã��"
            onclick="win_open('pwForm')">
    </form>
  </div>
</div>
   
    
</body>
</html>