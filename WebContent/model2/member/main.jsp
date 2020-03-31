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
								<option value="">�帣</option>
								<option value="���">���</option>
								<option value="����">����</option>
								<option value="ȭ��">ȭ��</option>
								<option value="����">����</option>
								<option value="����">����</option>
								<option value="�θ�">�θ�</option>
								<option value="�ų�">�ų�</option>
							</select>
							<script>
								document.sf.column.value = "${param.column}";
							</script>
							<input type="hidden" name="find" value="${param.find}"> <input
								type="submit" value="�˻�">
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
<!--  //ũ�Ѹ� -->
 <%--  <%
   		String url = 
   				"http://w3.sbs.co.kr/schedule/scheduleSub.do?depth02=d2_3&depth03=power&channel=Power";//sbs���� ��ǥ
   		String line =""; 
   		Document doc = null;// �ֻ�� ��Ʈ ��� <html> ��ܿ� �ִ� /
   		try{  			
   			doc = Jsoup.connect(url).get();//�ش� url���ؼ� ���޵Ǵ� �ҽ����� DOM��ü
   			Elements el = doc.select("div");
   			for(Element ele : el){ //���̺� �±�  -���� ���̺��� �ϳ� �ۿ� ����.
   				//Elements e2 = ele.select("tr");//tr �±׵鸸 ������.
   				Elements e2 = ele.select(".current");//.tc �±׵鸸 ������.
   				for(Element ele2 : e2){
   				String temp = ele2.html();//tr���� �ִ� ������� ������ ����.
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
    //��� �׷���
     $(function(){
        graphs()
     })
      
      var randomColorFactor = function(){
  	  return Math.round(Math.random()*255);//0~255
    }
     var randomColor = function(opacity){
  	   return "rgba("+randomColorFactor()+","//a ����
  			   +randomColorFactor()+","
  			   +randomColorFactor()+","
  			   +(opacity || '.3')+")";//0.3
     };   
     
     function graphs(){
    	 /*$.ajax({
				url : "../ajax/graph.do",
				type : "get",*/
  	   $.ajax("../ajax/graph.do",{//��� Ȯ�� ���ϱ�
  		   success: function(data){//json������ data
  			   console.log(data)
  			   pieGraphprint(data)			   		   
  		   },
  		   error: function(e){
  			   alert("��������:"+e.status)
  		   }
  	   })
     }
     function pieGraphprint(data){
  	   var rows =JSON.parse(data);
  	   var genres =[]; //label data
  	   var datas =[]; //cut data '�Ǽ�'
  	   var colors =[]; //color data 
  	   //json ������ �м��Ͽ� �ʿ��� �����ͷ� ����
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
  				   text:'�帣 ���'
  			   }
  		   }
  	   }
  	   var ctx = document.getElementById("canvas").getContext("2d")
  	   new Chart(ctx,config)
     }
   </script>

</body>
</html>
