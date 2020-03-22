<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO" %>
<%-- <%request.setCharacterEncoding("UTF-8"); %> --%>
<%-- <jsp:useBean id="bbs" class="board.board" scope="page"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute thingse</title>
</head>
<body>
<%
	String ID = (String)session.getAttribute("ID");
	/* 속성명이 ID인 session의 값을 가져온다. */
%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
		BoardDAO bbsDAO = new BoardDAO();
		int result = bbsDAO.write(title,ID,content);
		if(result==-1){
			%>
			<script type="text/javascript">
				alert("글쓰기에 실패했습니다.");
				history.go(-1);
			</script>
			<% 
			return;
		}else{
			%>
			<script type="text/javascript">
				location.href = "Board.jsp";
			</script> 
			<%
		}
%>
</body>
</html>