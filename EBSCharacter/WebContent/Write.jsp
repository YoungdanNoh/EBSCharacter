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
		background-image: url("backgroundImg/view.jpg");
		background-repeat: no-repeat;
		background-size: 100% 200%; 
	}
</style>
</head>
<body>
	<div class="row">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 	<a href="Main.jsp"><h1 align="center" class="font">I like cute things</h1></a>
 	<br><br><br><br><br><br><br><br>
  	<form action="WriteAction.jsp">
    	<table class="table table-striped">
    		<tr>
		     <td colspan="2"><h2 class="text-center">게시글 쓰기</h2></td>
	    	</tr>
		    <tr style="background-color: #FFFFFF;">
			     <td>제목</td>
			     <td><input type="text" class="form-control" name="title"></td>
			</tr>
 
		    <tr>
			     <td>글내용</td>
			     <td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
		    </tr>
		    
		    <tr>
			    <td colspan="2" style="background-color: #FFFFFF;" class="text-center">
			      <input type="submit" value="글쓰기" class="btn btn-success">
			    </td>
		    </tr>
		
    	</table>
  	</form>
 	</div>
	</div>
</body>
</html>