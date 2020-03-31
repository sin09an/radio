<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>  
<head>
<meta charset="EUC-KR">
<title>main</title> 
<style>  
	li {border:2px solid grey;}
</style> 

</head>   
<body class="body1">        
  <div class="w3-row-padding w3-center w3-margin-top ">
   <form action="search" method="post" name="f">
		<table>
				<tr>
					<td style="border-width: 0px;">
						<div style="position: relative; left: 40%">
							<select name="column" style="width: 200px; height: 34px;">
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
							<input type="hidden" name="find" value="${param.find}"> <input
								type="submit" value="검색">
						</div>
					</td>
				</tr> 
			</table>
			<div id ="container" style="width:75%;" >
	            <canvas id="canvas"></canvas>
           </div>
	</form> 
    </div>

   
  


   
   <div class="w3-row-padding w3-center w3-margin-top">
<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px">
  <a href="http://www.imbc.com/broad/radio/special_vod/viewradio/2018_index.html" class="w3-bar-item w3-button">MBC</a>
  <hr>
<img src="../img/11.PNG"   width="300" height="350" border="1"> 
  </div>
</div> 

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px">
  <a href="http://radio.kbs.co.kr/" class="w3-bar-item w3-button">KBS</a>
  <hr>
 <img src="../img/13.PNG"   width="300" height="350" border="1"> 
  </div>
</div> 

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px">
  <a href="https://www.sbs.co.kr/radio" class="w3-bar-item w3-button">SBS</a>
  <hr>
  <img src="../img/12.PNG"   width="300" height="350" border="1"> 
<!--  //크롤링 -->
 <%--  <%
   		String url = 
   				"http://w3.sbs.co.kr/schedule/scheduleSub.do?depth02=d2_3&depth03=power&channel=Power";//sbs라디오 편성표
   		String line =""; 
   		Document doc = null;// 최상단 루트 노드 <html> 상단에 있는 /
   		try{  			
   			doc = Jsoup.connect(url).get();//해당 url통해서 전달되는 소스보기 DOM객체
   			Elements el = doc.select("div");
   			for(Element ele : el){ //테이블 태그  -현재 테이블이 하나 밖에 없음.
   				//Elements e2 = ele.select("tr");//tr 태그들만 가져옴.
   				Elements e2 = ele.select(".current");//.tc 태그들만 가져옴.
   				for(Element ele2 : e2){
   				String temp = ele2.html();//tr내에 있는 내용들을 가지고 있음.
   				System.out.println("=========");
   				System.out.println(temp); 
   				line += "<li>"+temp+"</li>";
   				}
   				
   			}
   		}catch(IOException e){
   			e.printStackTrace();
   		}
   %>
   <table><%=line %></table>  --%>
  </div>
</div>


</div> 
 	
    <script>
    //통계 그래프
     $(function(){
        graphs()
     })
      
      var randomColorFactor = function(){
  	  return Math.round(Math.random()*255);//0~255
    }
     var randomColor = function(opacity){
  	   return "rgba("+randomColorFactor()+","//a 투명도
  			   +randomColorFactor()+","
  			   +randomColorFactor()+","
  			   +(opacity || '.3')+")";//0.3
     };   
     
     function graphs(){
    	 /*$.ajax({
				url : "../ajax/graph.do",
				type : "get",*/
  	   $.ajax("../ajax/graph.do",{//경로 확인 잘하기
  		   success: function(data){//json형태의 data
  			   console.log(data)
  			   pieGraphprint(data)			   		   
  		   },
  		   error: function(e){
  			   alert("서버오류:"+e.status)
  		   }
  	   })
     }
     function pieGraphprint(data){
  	   var rows =JSON.parse(data);
  	   var genres =[]; //label data
  	   var datas =[]; //cut data '건수'
  	   var colors =[]; //color data 
  	   //json 파일을 분석하여 필요한 데이터로 저장
  	   $.each(rows,function(index,item){
  		 genres[index] = item.genre;
  		   datas[index] = item.cnt;
  		   colors[index] = randomColor(1);
  	   })
  	   var config ={
  		   type:'pie',
  		   data:{
  			   datasets:[{   
  				   data:datas,
  				   backgroundColor:colors,
  			   }],
  			   labels:genres
  		   },
  		   options:{
  			   responsive:true,
  			   legend:{postion:'top',},
  			   title:{
  				   display:true,
  				   text:'장르 통계'
  			   }
  		   }
  	   }
  	   var ctx = document.getElementById("canvas").getContext("2d")
  	   new Chart(ctx,config)
     }
   </script>

</body>
</html>
