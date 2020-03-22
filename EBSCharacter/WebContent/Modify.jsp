<%@page import="util.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute things</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Inconsolata|Pacifico&display=swap" rel="stylesheet">
<style>
	.font{
  		font-family: 'Inconsolata', monospace;
		font-family: 'Pacifico', cursive;
		margin-bottom: 0px;
  	}
  	body {
		background-image: url("backgroundImg/view.jpg");
		background-repeat: no-repeat;
		background-size: 100% 200%; 
	}
</style>
</head>
<body>
<%
	String SbbsID = application.getAttribute("bbsID").toString();
	int bbsID = Integer.parseInt(SbbsID);

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String Title = null;
	String Content = null;
	try{
		conn = DatabaseUtil.getConnection();
		String sql = "select Title, Content from EBS.Board where bbsID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bbsID);
		rs = pstmt.executeQuery();/*!!!!!!*/
		while(rs.next()){
			Title = rs.getString("Title");
			Content = rs.getString("Content");
		}	
		
	}finally{
		if(rs != null) rs.close();
		if(pstmt!= null) pstmt.close();
		if(conn != null) conn.close();
	}
%>
	<div class="row">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 	<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
 	<br><br><br><br><br><br><br><br>
  	<form action="ModifyAction.jsp">
    	<table class="table table-striped">
    		<tr>
		     <td colspan="2"><h2 class="text-center">게시글 수정</h2></td>
	    	</tr>
		    <tr style="background-color: #FFFFFF;">
			     <td>제목</td>
			     <td><input type="text" class="form-control" name="title" value="<%=Title %>"></td>
			</tr>
 
		    <tr>
			     <td>글내용</td>
			     <td><textarea rows="10" cols="50" name="content" class="form-control"><%=Content %></textarea></td>
		    </tr>
		    
		    <tr>
			    <td colspan="2" style="background-color: #FFFFFF;" class="text-center">
			      <input type="submit" value="수정" class="btn btn-success">
			    </td>
		    </tr>
		
    	</table>
  	</form>
 	</div>
	</div>
</body>
</html>