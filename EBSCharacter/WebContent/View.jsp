<%@page import="util.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO" %>
<%@page import="board.board" %>
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
		String sID = (String)session.getAttribute("ID");
		/* 속성명이 ID인 session의 값을 가져온다. */
	%>
	<%
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0){
			%>
			<script>
				alert('유효하지 않은 글입니다.');
				location.href = 'Board.jsp';
			</script>
			<%
		}
		board bbs = new BoardDAO().getbbs(bbsID);
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> ID = new ArrayList<String>();
		ArrayList<String> content = new ArrayList<String>();
		ArrayList<String> Date = new ArrayList<String>();
		try{
			conn = DatabaseUtil.getConnection();
			String sql = "select * from Comment where bbsID=? order by Date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			rs = pstmt.executeQuery();/*!!!!!!*/
			while(rs.next()){
				ID.add(rs.getString("ID"));
				content.add(rs.getString("content"));
				Date.add(rs.getString("Date"));
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
    	<table class="table table-striped">
    		<thead>
    			<tr style="background-color: #FFFFFF;">
    				<th colspan="3" style="backgound-color:#eeeeee; text-align:center;">글 보기</th>
    			</tr>
    		</thead>
			<tbody>
				<tr>
					<td style="width:20%;">제목</td>
					<td colspan="2"><%=bbs.getTitle() %></td>
				</tr>
				<tr style="background-color: #FFFFFF;">
					<td>작성자</td>
					<td colspan="2"><%=bbs.getID() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td colspan="2"><%=bbs.getDate().substring(0,11)+bbs.getDate().substring(11,13)+"시"+bbs.getDate().substring(14,16)+"분"%></td>
				</tr>
				<tr style="background-color: #FFFFFF;">
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align:left;"><%=bbs.getContent() %></td>
				</tr>
			</tbody>
    	</table>
    	<a href="Board.jsp" class="btn btn-info">목록</a>
    	<%
    		if(bbs.getID().equals(sID)){
    			application.setAttribute("bbsID", bbs.getBbsID());
    			%>
    			<a href="Modify.jsp" class="btn btn-info">수정</a>
    			<a href="Delete.jsp" class="btn btn-info">삭제</a>
    			<%
    		}
    	%>
 	</div>
	</div>
	<br>
	<div class="row">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 	<form action="WriteComment.jsp">
 		<input type="text" name="bbsID" value=<%=bbsID %> style="display:none"/>
 		
    	<table class="table table-striped">
			<tbody>
				<tr>
					<td>댓글쓰기</td>
					<td><input type="text" class="form-control" name="content"></td>
					<td><input type="submit" value="등록" class="btn btn-success"></td>
				</tr>
				<%
						for(int i=0; i<ID.size(); i++){
							if(ID.get(i).equals(sID)){
								application.setAttribute("bbsID", bbs.getBbsID());
								%>
								<tr style="background-color: #FFFFFF;">
									<td><%=ID.get(i) %></td>
									<td><%=content.get(i) %></td>
									<td>
										<a href="DeleteComment.jsp?Date=<%=Date.get(i) %>" class="btn btn-info">삭제</a>
									</td>
								</tr>
								<%
							}else{
								%>
								<tr style="background-color: #FFFFFF;">
									<td><%=ID.get(i) %></td>
									<td colspan="2"><%=content.get(i) %></td>
								</tr>
								<%
							}
						}
					%>
			</tbody>
    	</table>
    </form>
 	</div>
	</div>
</body>
</html>