<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@page import="util.DatabaseUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute thingse</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gamja+Flower&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower|Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Inconsolata|Pacifico&display=swap" rel="stylesheet">
<style>
	.table{
		width:200px;
		margin-left:auto;
		margin-right:auto;
		background-color: #BBDEFB;
	}
	.title{
		font-family: 'Gamja Flower', cursive;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Do Hyeon', sans-serif;
	}
	.name{
		font-family: 'Sunflower', sans-serif;
	}
	.information{
		font-family: 'Sunflower', sans-serif;
		font-family: 'Gamja Flower', cursive;
	}
	.font{
	  	font-family: 'Inconsolata', monospace;
		font-family: 'Pacifico', cursive;
		margin-bottom: 0px;
  	}
  	.body{
  		background-color: #BBDEFB;
  	}
</style>
</head>
<body style="background-color: #BBDEFB;">
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sDisease_name=null;
	String sInformation=null; 
	ArrayList<String> C_img = new ArrayList<String>();
	ArrayList<String> C_info = new ArrayList<String>();
	ArrayList<String> C_name = new ArrayList<String>();
	try{
		conn = DatabaseUtil.getConnection();
		String sql = "select * from EBS.Character";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();/*!!!!!!*/
		while(rs.next()){
			C_img.add(rs.getString("C_img"));
			C_info.add(rs.getString("C_info"));
			C_name.add(rs.getString("C_name"));
		}	
	}finally{
		if(rs != null) rs.close();
		if(pstmt!= null) pstmt.close();
		if(conn != null) conn.close();
		
	}
%>
<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
<br><br>
<h1 class="title" align="center"><font size="10">EBS 캐릭터를 소개합니다!</font></h1>
<table class="table">
<%
	for(int i=0; i<C_img.size(); i++){%>
		<tr>
			<td align="center" style="padding-top:100px">
				<p class="name"><font size="7"><%=C_img.get(i)%></font></p>
			</td>
		</tr>
		<tr>
			<td align="center"><img src = "캐릭터//<%=C_name.get(i)%>.jpg"/></td>
		</tr>
		<tr>
			<td>
				<p class="information"><font size="5"><%=C_info.get(i)%></font></p>
			</td>
		</tr>
	<%}%>
</table>	
</body>
</html>