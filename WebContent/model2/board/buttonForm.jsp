<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title> 
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
</style>
</head>
<body>
	<div class="w3-row-padding" id="about">
    <div class="w3-center w3-padding-64">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">My Board</span>
    </div>
<form action="mylist.do" method="post" name="f">
    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="../img/radio8_1.jpg" alt="John" style="width:100%">
        <div class="w3-container">
          <p><input type="submit" class="w3-button w3-light-grey w3-block" value="이야기"></p>
        </div>
      </div>   
    </div>
</form>

<form action="mylist2.do" method="post" name="f">
    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="../img/radio11_1.png" alt="Mike" style="width:100%">
        <div class="w3-container">
          <p><input type="submit" class="w3-button w3-light-grey w3-block" value="오늘의 주제"></p>
        </div>
      </div> 
    </div>
</form>

<form action="mylist3.do" method="post" name="f">
    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="../img/radio1_1.jpg" alt="Jane" style="width:100%">
        <div class="w3-container">
          <p><input type="submit" class="w3-button w3-light-grey w3-block" value="콘테스트"></p>
        </div>
      </div>
    </div>
</form>
  </div>
</body>
</html>