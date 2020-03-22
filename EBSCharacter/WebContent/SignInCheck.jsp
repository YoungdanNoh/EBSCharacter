<%@page import="java.util.ArrayList"%>
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
<title>SignInCheck</title>
</head>
<body>
<%
	String Name = request.getParameter("Name");
	String ID = request.getParameter("ID");
	String Password = request.getParameter("Password");
	String Email = request.getParameter("Email");
	
	if(Name.equals("")||ID.equals("")||Password.equals("")||Email.equals("")){
		%>
		<script type="text/javascript">
			alert("빈 공간이 없이 입력해주세요.");
			history.go(-1);/* SignIn.jsp로 페이지를 이동한다. */
		</script>
		<%
		return;
	}
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<String> e_ID = new ArrayList<String>();
	try{
		conn = DatabaseUtil.getConnection();
		String sql = "select * from EBS.member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();/*!!!!!!*/
		while(rs.next()){
			e_ID.add(rs.getString("ID"));
		}
		for(int i=0;i<e_ID.size();i++){
			out.print("OK");
			if(e_ID.get(i).equals(ID)){
				out.print("OK");
				%>
				<script type="text/javascript">
					alert("이미 존재하는 아이디 입니다. 다른 아이디를 입력해주세요.");
					history.go(-1);/* SignIn.jsp로 페이지를 이동한다. */
				</script>
				<%
				return;
			}
		}
		sql="insert into EBS.member values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,ID);
		pstmt.setString(2,Password);
		pstmt.setString(3,Name);
		pstmt.setString(4,Email);
		pstmt.executeUpdate();/*!!!!!!*/
		%>
		<script type="text/javascript">
			alert("회원가입 되었습니다!");
			location.href = "Main.jsp";
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