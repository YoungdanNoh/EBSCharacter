<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I like cute things</title>
<style>
	#icon{
		width: 65px;
		height: 50px;
		align:center;
	}
	#icon{
		width: 65px;
		height: 50px;
		background-size: cover;
	}
	ul{
		list-style-type: none;
		margin:0;
		padding:0;
	
	}
	a:link, a:visited{
		display: block;
		font-weight: bold;
		color: #FFFFFF;
		width:120px;
		text-align: center;
		padding: 4px;	
		text-decoration: none;
		
	}
	a:hover{
		background-color: #7A991A;
	
	}
	
	input[id="menuicon"] {display:none;}
	input[id="menuicon"] + ul {
		display:block;
		position:fixed;/*화면을 움직여도 고정된 위치에 있게함*/
		right:0;top:25px;transform:translateY(-50%);/*위치지정*/
		transition:all .35s;/*움직이는 형태를 보여줌*/
		<!--text-align:right;-->
	}
	
	/*박스의 겉 테두리 설정*/
	input[id="menuicon"] + ul > li {
		display:block;
		width:50px;height:50px;border:1px solid #f1f1f1;
		position:relative;
		margin-top:-1px; 
	}

	/*박스의 크기와 배경색 설정*/
	input[id="menuicon"] + ul > li > label {
		display:block;
		cursor:pointer;
		width:auto;height:50px;background:#FFFFFF;
	}
	
	/*전체 span태그의 속성설정*/
	input[id="menuicon"] + ul > li:nth-child(1) label span {
		display:block;
		position:absolute;
		width:50%;height:3px;border-radius:30px;background:#333;
		transition:all .35s;
	}
	/*각각의 span태그의 설정*/
	input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(1) {
		top:30%;left:50%;
		transform:translateX(-50%);
		/*translateX(거리) 함수는 좌우(수평 방향)의 이동 거리 값을 지정합니다.*/ 
	}
	input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(2) {top:50%;left:50%;transform:translate(-50%,-50%);}
	input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(3) {bottom:30%;left:50%;transform:translateX(-50%);}
	
	/*체크되었을 때 설정*/
	input[id="menuicon"]:checked + ul {
		z-index:2;/*객체의 앞뒤 순서 설정*/
	}
	input[id="menuicon"]:checked + ul > li:nth-child(1) label {z-index:2;right:300px;}
	/*체크되었을 때 각각의 span태그의 설정*/
	input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {
		top:50%;left:50%;
		transform:translate(-50%,-50%) rotate(45deg);
	}
	input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(2) {opacity:0;}
	input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(3) {bottom:50%;left:50%;transform:translate(-50%,50%) rotate(-45deg);}
	div[class="sidebar"] {
		width:150px;height:100%;
		background-color: rgba( 255, 255, 255, 0 );/*배경을 투명하게*/
		position:fixed;
		top:0;
		right:-300px;
		z-index:1;
		transition:all .35s;
	}
	/*체크되었을때 슬라이드바가 나오게 하기*/
	input[id="menuicon"]:checked + ul + div {right:0;}
	
</style>
</head>
<body>
<%
	String ID = (String)session.getAttribute("ID");
	/* 속성명이 ID인 session의 값을 가져온다. */
%>
	<!-- <div id="icon"></div> -->
	<!-- <p style="font-size:42px;">Share Me</p> -->
	<input type="checkbox" id="menuicon">
		<ul>
			<li>
				<label for="menuicon">
					<span></span>
					<span></span>
					<span></span>
				</label>
			</li>
		</ul>
	<div class="sidebar">
		<ul>
			<li><br><br><br><br><br></li>
			<li><p style="font-size:24px">
				<%if(ID==null){%><a href="Login.jsp">Login</a><%}
					else{%><a href="Logout.jsp" onClick="alert('로그아웃 되었습니다.')">Logout</a><%}%>
					<!-- 로그인이 되어있으면 Logout, 로그인이 되어있지 않으면 Login이라는 글자를 띄운다. -->
				</p></li>
			<li><br><br><br><br></li>
			<li><p style="font-size:24px"><a href="Introduce.jsp">Introduce</a></p></li>
			<li><br><br><br><br></li>
			<li><p style="font-size:24px">
				<a <%if(ID==null){%>href="#" onClick="alert('로그인 먼저 해주세요.')"<%}
					else{%>href="Vote.jsp"<%}%>>Vote</a></p></li>
					<!-- 로그인이 되어있지 않으면 Vote페이지로 이동하지 못하게한다. -->
			<li><br><br><br><br></li>
			<li><p style="font-size:24px">
				<a <%if(ID==null){%>href="#" onClick="alert('로그인 먼저 해주세요.')"<%}
					else{%>href="Board.jsp"<%}%>>Community</a></p></li>
					<!-- 로그인이 되어있지 않으면 Board페이지로 이동하지 못하게한다. -->
			<li><br><br></li>
		</ul>
	</div>
</body>
</html>