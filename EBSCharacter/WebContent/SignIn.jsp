<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignIn</title>
<link href="https://fonts.googleapis.com/css?family=Inconsolata|Pacifico&display=swap" rel="stylesheet">
<style>
	.underline{
		/* input 태그의 형태를 네모난 박스 형태가 아닌 
		   밑줄의 형대로 보여주기 위한 css이다. */
  		font-size:18px;
  		padding:10px 10px 10px 5px;
  		display:block;
  		width:300px;
  		border:none;
  		border-bottom:1px solid #757575;
	}
	.table {
    	width: 300px;
    	height: 200px;
    	margin-left: auto;/* 정중앙에 위치시키기 위해 auto로 해준다. */
    	margin-right: auto;/* 정중앙에 위치시키기 위해 auto로 해준다. 자연스럽게 좌우 여백은 균등하게 배분된다. */
  	}
  	.button{
  		/* 버튼의 모양과 색상을 지정해주기 위한 css이다. */
  		width: 315px;
    	font-size: 14px;
    	color: white;
    	background-color: #1BBC9B;
    	padding: 10px;/* 내용과 border사이의 공간을 지정한다. */
    	border-radius: 5px;/* 테두리를 둥글게 만들어준다. */
  	}
  	.font{
  		font-family: 'Inconsolata', monospace;
		font-family: 'Pacifico', cursive;
		margin-bottom: 0px;
  	}
</style>
</head>
<body>
<br><br>
<br><br><br><br><br>
<table class="table">
	<tr><td><a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a></td></tr>
	<tr><td><h1>SignIn</h1><br></td></tr>
	<tr><td>
		<form action="SignInCheck.jsp"><!-- 버튼클릭 시 SignInCheck.jsp에서 처리한다. -->
			이름
			<input type="text" class="underline" name="Name">
			<br><br>
			ID
			<input type="text" class="underline" name="ID">
			<br><br>
			PASSWORD
			<input type="password" class="underline" name="Password">
			<!-- 비밀번호가 입력될때 그 문자를 보여주지 않기 위해 type을 password로 설정한다. -->
			<br><br>
			Email
			<input type="text" class="underline" name="Email">
			<br>
			<input type="submit" value="회원가입" class="button">
		</form>
	</td></tr>
</table>

</body>
</html>