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
	String vCharacter = request.getParameter("Character");
	out.print(vCharacter);
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = DatabaseUtil.getConnection();
		String sql="update EBS.Popular_vote set Number=Number+1 where C_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,vCharacter);
		pstmt.executeUpdate();/*!!!!!!*/
		%>
		<script type="text/javascript">
			alert("투표되었습니다!");
			location.href = "Vote.jsp";
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