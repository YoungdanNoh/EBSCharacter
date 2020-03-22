<%@page import="util.DatabaseUtil"%>
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
</head>
<body>
<%
	String SbbsID = application.getAttribute("bbsID").toString();
	int bbsID = Integer.parseInt(SbbsID);

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn = DatabaseUtil.getConnection();
		String sql="update EBS.Board set bbsAvailable=0 where bbsID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,bbsID);
		pstmt.executeUpdate();/*!!!!!!*/
		%>
		<script type="text/javascript">
			alert("삭제되었습니다!");
			location.href = "Board.jsp";
		</script>
		<%
	}finally{
		if(rs != null) rs.close();
		if(pstmt!= null) pstmt.close();
		if(conn != null) conn.close();
		
	}
%>
</body>
</html>