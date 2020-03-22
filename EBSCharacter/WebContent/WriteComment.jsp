<%@page import="util.DatabaseUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute things</title>
</head>
<body>
<%
	String ID = (String)session.getAttribute("ID");
	int bbsID = Integer.parseInt(request.getParameter("bbsID"));
	String content = request.getParameter("content");
	BoardDAO date = new BoardDAO();
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = DatabaseUtil.getConnection();
		String sql = "insert into Comment values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,bbsID);
		pstmt.setString(2,ID);
		pstmt.setString(3,content);
		pstmt.setString(4,date.getDate());
		pstmt.executeUpdate();/*!!!!!!*/
	}finally{
		if(rs != null) rs.close();
		if(pstmt!= null) pstmt.close();
		if(conn != null) conn.close();
		
	}
%>
<jsp:forward page="View.jsp"></jsp:forward>
</body>
</html>