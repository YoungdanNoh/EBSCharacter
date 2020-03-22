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
		background-image: url("backgroundImg/vote.jpg");
		background-repeat: no-repeat;
		background-size: 100% 200%; 
	}
	#ul1 {
		  padding: 0;
	}
	#li1 {
		  display: inline-block;
		  font-size:30px;
		  color:#FFFFFF;
	}
</style>
</head>
<body>

<br>
<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
<br><br><br>
<h1 align="center" style="color:#FFFFFF;">당신의 최애 캐릭터를 뽑아주세요!</h1>
<br><br><br>
<div style="text-align:center;">
	<form action = "VoteResult.jsp">
	    	<ul id="ul1">
  				<li id="li1"><input type = "radio" name = "Character" value = "GP">펭수</li>
  				<br><br><br>
  				<li id="li1"><input type = "radio" name = "Character" value = "ttugttag">뚝딱이</li>
  				<br><br><br>
  				<li id="li1"><input type = "radio" name = "Character" value = "beongaeman">번개맨</li>
  				<br><br><br>
  				<li id="li1"><input type = "radio" name = "Character" value = "ppungppung">뿡뿡이</li>
  				<br><br><br>
  				<li id="li1"><input type = "radio" name = "Character" value = "pororo">뽀로로</li>
			</ul>
	    <input type = "submit" value ="투표하기">
	</form>
	<br><br><br>
	<a href="Chart.jsp" class="btn btn-info">인기투표 결과 보러가기</a>
</div>
</body>
</html>