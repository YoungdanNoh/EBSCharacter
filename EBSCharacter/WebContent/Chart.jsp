<%@page import="util.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute things</title>
<%
	int c=0;
	boolean check=true;

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<String> C_name = new ArrayList<String>(); 
	ArrayList<Integer> Number = new ArrayList<Integer>();
	try{
		conn = DatabaseUtil.getConnection();
		String sql = "SELECT * FROM EBS.Popular_vote";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();/*!!!!!!*/
		while(rs.next()){
			C_name.add(rs.getString("C_name"));
			Number.add(rs.getInt("Number"));
		}
	}finally{
		if(rs != null) rs.close();
		if(pstmt!= null) pstmt.close();
		if(conn != null) conn.close();
		
	}
	for(int i=0; i<C_name.size(); i++){
		c = c+Number.get(i);
	}
	if(c==0){
		check=false;
	}
%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	  /* 구글차트의 라이브러리를 로드한다. */
	  
      function drawChart() {
		var check = <%=check%>/* check값을 가져온다 */
		var data
		if(check){
        data = google.visualization.arrayToDataTable([
			/* 구글차트를 그릴 때 사용할 데이터를 넣어준다 */
			['Character', 'Popular'],
			['번개맨',  <%=Number.get(0)%>],
			['펭수',   <%=Number.get(1)%>] ,
			['뽀로로',  <%=Number.get(2)%>],
			['뿡뿡이',  <%=Number.get(3)%>],
			['뚝딱이',  <%=Number.get(4)%>]
        ]);}else{
				data = google.visualization.arrayToDataTable([
						['Character', 'Popular'],
						['투표수 없음', 1]]);
			}

        var options = {
          title: '인기투표 결과'
        };/* 차트의 타이틀을 설정한다 */
	
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
		/* chart 변수에서 원하는 chart 종류에 맞게 매칭 시킨 후 chart.draw() 함수로 차트를 그려준다 */
      }
    </script>
<link href="https://fonts.googleapis.com/css?family=Inconsolata|Pacifico&display=swap" rel="stylesheet">
<style>
	.font{
	  	font-family: 'Inconsolata', monospace;
		font-family: 'Pacifico', cursive;
		margin-bottom: 0px;
  	}
  	body {
		background-image: url("backgroundImg/Chart.jpg");
		background-repeat: no-repeat;
		background-size: 100% 200%; 
	}
</style>
</head>
<body>
	<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
	<br><br><br><br>
	<table align="center">
		<tr><td><h1 style="color:#ffffff">EBS 캐릭터 인기투표 결과</h1></td></tr>
		<tr>
			<td colspan="2">
				<div id="piechart" style="width: 900px; height: 500px;"></div>
				<%
					if(!check){
						%><h1 align="center">투표된 캐릭터가 존재하지 않습니다!</h1><%
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>