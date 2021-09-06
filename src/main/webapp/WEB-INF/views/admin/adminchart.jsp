<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  
<style type="text/css">
 
#donutchart{
	display: inline-block;
}

#top5{
	display: inline-block;
}

.top_table{
	margin-bottom: 10px;
}

</style>  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChartTop5);

      function drawChart() {
     

    	let genderList = new Array();    
   		<c:forEach items="${glist}" var="g" varStatus="i">
   			
   		genderList.push({m_gender : ${g.m_gender},
   	    					gcount : ${g.gcount}
   				       });
   		</c:forEach>
   	    
   	    
   	    var data = new google.visualization.DataTable();
   	      data.addColumn('string', 'gender');
   	      data.addColumn('number', 'rate');
   	      
   	      for(var i=0; i<genderList.length; i++){
           	  
         	  	var gender = (genderList[i].m_gender);
         	  	if(gender == 1){
         	  		gender = '선택안함';
         	  	} else if(gender == 2){
         	  		gender = '여성';
         	  	} else {
         	  		gender = '남성';
         	  	}

         		var rate = (genderList[i].gcount);

         	  data.addRows([
             	  [gender, rate]
             	]);
           }
   	    
        
        var options = {
          title: '이용자 분석',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      } 
      
      
      
      
    
      
      function drawChartTop5() {
    
    	
          let topList = new Array();    
     		<c:forEach items="${toplist}" var="t" varStatus="i">
     			
     		topList.push({p_name : "${t.p_name}",
     	    					num : ${t.num}
     				       });
     		</c:forEach>
         
   	    
   	      var data = new google.visualization.DataTable();
   	      data.addColumn('string', 'Product Name');
   	      data.addColumn('number', 'Amount');
   	      
   	      for(var i=0; i<topList.length; i++){
           	  
				var name = (topList[i].p_name);
         		var amount = (topList[i].num);

         	  data.addRows([
             	  [name, amount]
             	]);
           }
   	    
        
        var options = {
          title: '이번달 베스트 판매 상품 TOP5 ',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('top5'));
        chart.draw(data, options);
      }
      
      
      
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawLineChart);

    function drawLineChart() {
    	 let totalList = new Array();    
 		<c:forEach items="${mtlist}" var="mt" varStatus="i">
 			
 		totalList.push({o_time : "${mt.o_time}",
 	    					count : ${mt.cnt},
 	    					amount : ${mt.amount}
 				       });
 		</c:forEach>
 	   
 	  
 	    

 	     var data = new google.visualization.DataTable();
	      data.addColumn('string', '년-월');
	      data.addColumn('number', '매출액');
     
 	      
 	      for(var i=0; i<totalList.length; i++){
         	  
       	  	var date = (totalList[i].o_time);

       		var amount = (totalList[i].amount);

       	  data.addRows([
           	  [date, amount]
           	]);
         }

      var options = {
        chart: {
          title: '월별 매출액',
          subtitle: 'in millions of dollars (USD)'
        },
        width: 900,
        height: 350
      };

      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
      
      
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff); 

       function drawStuff() {
    	   
    	    let totalList = new Array();    
    		<c:forEach items="${mtlist}" var="mt" varStatus="i">
    			
    		totalList.push({o_time : "${mt.o_time}",
    	    					count : ${mt.cnt},
    	    					amount : ${mt.amount}
    				       });
    		</c:forEach>
    	   
    	    
    	    var data = new google.visualization.DataTable();
    	      data.addColumn('string', 'month');
    	      data.addColumn('number', 'amount');
    	      
    	      for(var i=0; i<totalList.length; i++){
            	  
          	  	var date = (totalList[i].o_time);

          		var amount = (totalList[i].amount);

          	  data.addRows([
              	  [date, amount]
              	]);
            }
    	    


        var options = {
          width: 800,
          legend: { position: 'none' },
          chart: {
            title: '월별 매출액 ',
            subtitle: '월 매출액 합계' },
          axes: {
            x: {
              0: { side: 'top', label: '월별 매출액'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      }; 
    </script>
  </head>
  <body>
	<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/main.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">매출 통계</b>
		</td>
	</tr>
	</table>
	
	
     <div id="linechart_material" style="margin-left:100px; text-align:center; width: 900px; height: 400px;"></div>
<!-- <div id="top_x_div" style="text-align:center; width: 800px; height: 450px;"></div> -->     
     <div id="top5" style="margin-left:50px; width: 500px; height: 430px;"></div>
	 <div id="donutchart" style="margin-left:50px; width: 500px; height: 430px;"></div>

  </body>
</html>



<!-- <html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Move', 'Percentage'],
          ["King's pawn (e4)", 44],
          ["Queen's pawn (d4)", 31],
          ["Knight to King 3 (Nf3)", 12],
          ["Queen's bishop pawn (c4)", 10],
          ['Other', 3]
        ]);

        var options = {
          width: 800,
          legend: { position: 'none' },
          chart: {
            title: 'Chess opening moves',
            subtitle: 'popularity by percentage' },
          axes: {
            x: {
              0: { side: 'top', label: 'White to move'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
    </script>
  </head>
  <body>
    <div id="top_x_div" style="width: 800px; height: 600px;"></div>
  </body>
</html> -->
