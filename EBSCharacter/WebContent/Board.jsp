<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO" %>
<%@page import="board.board" %>
<%@page import="java.util.ArrayList" %>
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
  	a,a:hover{
  		color:#000000;
  		text-decoretion:none;
  	}
</style>
</head>
<body>
	<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
	<br><br><br><br><br><br>
	<%
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#D8F781; text-align:center;">번호</th>
						<th style="background-color:#D8F781; text-align:center;">제목</th>
						<th style="background-color:#D8F781; text-align:center;">작성자</th>
						<th style="background-color:#D8F781; text-align:center;">작성일</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO bbsDAO = new BoardDAO();
						ArrayList<board> list = bbsDAO.getList(pageNumber);
						for(int i=0; i<list.size(); i++){
					%>
					<tr>
						<td><%=list.get(i).getBbsID() %></td>
						<td><a href="View.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getTitle() %></a></td>
						<td><%=list.get(i).getID() %></td>
						<td><%=list.get(i).getDate().substring(0,11)+list.get(i).getDate().substring(11,13)+"시"+list.get(i).getDate().substring(14,16)+"분"%></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<%
				if(pageNumber!=1){
			%>
				<a href="Board.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-warning btn-arrow-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber+1)){
			%>
				<a href="Board.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-warning btn-arrow-left">다음</a>
			<%
				} 
			%>
			<a href="Write.jsp" class="btn btn-info pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>