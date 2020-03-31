<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--/WebContent/model2/member/decorator.jsp --%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- pageContext.request.contextPath => jspstudy2 -->
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style> 
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>

<style>
body, html {
  height: 100%;
  font-family: "Inconsolata", sans-serif;
}

.bgimg {
  background-position: center; 
  background-size: cover;
  background-image: url("");
  min-height: 75%;  
}

.menu {
  display: none;
} 


</style>

<decorator:head />
<body>

<!-- Links (sit on top) -->


 
  
<!-- Header with image -->
<header class="bgimg w3-grayscale-min" id="home" style="background-image: url('../img/radio6.jpg'); width: 100%;">
 <div class="w3-bottom">   
  <div class="w3-row w3-padding w3-black">  
   
    <div class="w3-col s3"> 
    <a href="${path}/model2/member/info1.do">      
       <img src="picture/${picture.picture}" width="35" height="35" border="1"></a> 
	   <a href="${path}/model2/member/main.do">main</a> &nbsp;
	   <c:if test="${sessionScope.login!='admin' }">        
       <a href="${path}/model2/board/buttonForm.do" >${sessionScope.login}</a> &nbsp;
       </c:if>      
	   <c:if test="${sessionScope.login=='admin' }">        
       <a href="${path}/model2/admin/towriteForm.do" >${sessionScope.login}</a> &nbsp;
       </c:if>    
	   <a href="${path}/model2/member/logout.do">로그아웃</a>       
	</div> 
    <div class="w3-col s3">
      <a href="../board/list.do" class="w3-button w3-block w3-black">이야기</a>
    </div> 
    <div class="w3-col s3">
      <a href="../board/todaylist.do" class="w3-button w3-block w3-black">오늘의 주제</a>
    </div>
    <div class="w3-col s3">
      <a href="../board/conlist.do" class="w3-button w3-block w3-black">콘테스트</a>
    </div>
  </div>
</div>
</header>


 <!-- Add a background color and large text to the whole page --> 
<div class="w3-sand w3-center w3-large"> 


<!-- 로그인하기 전 회원 가입 아이디 찾기 비밀번호 찾기 -->
<table> 
		<tr>  
			<td colspan="2" style="text-align: left; vertical-align: top">
			    <decorator:body /> <%--해당페이지의 body부분만 끊어서 가져옴 --%>
			</td>
		</tr>
	</table>
<div class="w3-row-padding w3-center w3-margin-top">  
</div> 
 
<!-- Menu Container 메인2
<div class="w3-container" id="menu">
  <div class="w3-content" style="max-width:700px">
 
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">THE MENU</span></h5>
  
    <div class="w3-row w3-center w3-card w3-padding">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Eat');" id="myLink">
        <div class="w3-col s6 tablink">Eat</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Drinks');">
        <div class="w3-col s6 tablink">Drink</div>
      </a>
    </div> -->

   <!--  <div id="Eat" class="w3-container menu w3-padding-48 w3-card">
      <h5>Bread Basket</h5>
      <p class="w3-text-grey">Assortment of fresh baked fruit breads and muffins 5.50</p><br>
    
      <h5>Honey Almond Granola with Fruits</h5>
      <p class="w3-text-grey">Natural cereal of honey toasted oats, raisins, almonds and dates 7.00</p><br>
    
      <h5>Belgian Waffle</h5>
      <p class="w3-text-grey">Vanilla flavored batter with malted flour 7.50</p><br>
    
      <h5>Scrambled eggs</h5>
      <p class="w3-text-grey">Scrambled eggs, roasted red pepper and garlic, with green onions 7.50</p><br>
    
      <h5>Blueberry Pancakes</h5>
      <p class="w3-text-grey">With syrup, butter and lots of berries 8.50</p>
    </div> -->

<!-- 
    <div id="Drinks" class="w3-container menu w3-padding-48 w3-card">
      <h5>Coffee</h5>
      <p class="w3-text-grey">Regular coffee 2.50</p><br>
    
      <h5>Chocolato</h5>
      <p class="w3-text-grey">Chocolate espresso with milk 4.50</p><br>
    
      <h5>Corretto</h5>
      <p class="w3-text-grey">Whiskey and coffee 5.00</p><br>
    
      <h5>Iced tea</h5>
      <p class="w3-text-grey">Hot tea, except not hot 3.00</p><br>
     
      <h5>Soda</h5>
      <p class="w3-text-grey">Coke, Sprite, Fanta, etc. 2.50</p>
    </div>  
    <img src="../../../img/pic.png" style="width:100%;max-width:1000px;margin-top:32px;">
  </div>
</div> 
-->

 
<%-- Contact/Area Container--%>
<div class="w3-container" id="where" style="padding-bottom:32px;">
 
 
  
</div>


<%-- 페이지 전체 범위 끝 div--%>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-48 w3-large">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

<!-- <script>
// Tabbed Menu 
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
}
document.getElementById("myLink").click();
</script> -->

</body>
</html>