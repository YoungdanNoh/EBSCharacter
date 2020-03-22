<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>I like cute things</title>
    <link href="https://fonts.googleapis.com/css?family=Inconsolata|Pacifico&display=swap" rel="stylesheet">
    <style>
    	.font{
	  		font-family: 'Inconsolata', monospace;
			font-family: 'Pacifico', cursive;
			margin-bottom: 0px;
  		}
		* {margin: 0; padding: 0;}
        #ul1 {
		  padding: 0;
		}
		#li1 {
		  display: inline-block;
		  font-size:35px;
		}
        a {text-decoration: none;}
        body {background: #D8CEF6}
        
        #main {
            height: 100vh;
            width: 100%;
            position: absolute;
            -webkit-clip-path:polygon(0% 0%, 0% 100%, 100% 100%, 100% 0%, 0% 0%);
            overflow: hidden;
            transition: all 0.5s;
        }
        #slider {
            width: 300%;
            position: relative;
            left: 0;
        }
        #slider img {
            width: 33.333%;
            float: left;
        }
        #nxtbtn,#prvbtn {
            height: 35px;
            width: 35px;
            background-color: #fff;
            font-size: 25px;
            text-align: center;
            line-height: 35px;
            border-radius: 35px;
            position: fixed;
            top: 85%;
            left: 53%;
            cursor: pointer;
        }
        #prvbtn {
            left: 47%;
        }
      
	</style>
</head>
<body>
    <div id="main">
        <div id="slider">
        	<jsp:include page="Main_menu.jsp" flush="false"></jsp:include>
        	<ul id="ul1">
  				<li id="li1" class="font" style="padding-left: 21em;">I like cute things</li>
  				<li id="li1" class="font" style="padding-left: 41em;">I like cute things</li>
  				<li id="li1" class="font" style="padding-left: 41em;">I like cute things</li>
			</ul>
            <img src="backgroundImg/GP.png" alt="">
            <img src="backgroundImg/dduk.png" alt="">
            <img src="backgroundImg/Pororo.jpg" alt="">
        </div>
        
        <div id="nxtbtn">&#8594;</div>
        <div id="prvbtn">&#8592;</div>
    </div>
   
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $count = 1;
        
        $("#nxtbtn").click(function(){
            if($count == 1){
                shrink();
                $("#slider").delay(1000).animate({left:"-100%"},1000);
                zoom();
                $count = 2;
            } else if($count == 2){
                shrink();
                $("#slider").delay(1000).animate({left:"-200%"},1000);
                zoom();
                $count = 3;
            }
        });
        
        $("#prvbtn").click(function(){
            if($count == 3){
                shrink();
                $("#slider").delay(1000).animate({left:"-100%"},1000);
                zoom();
                $count = 2;
            } else if($count == 2){
                shrink();
                $("#slider").delay(1000).animate({left:"0%"},1000);
                zoom();
                $count = 1;
            }
        });
        
        function shrink(){
            $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 100% 100%, 100% 0, 10% 20%)"});

            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 100% 100%, 90% 20%, 10% 20%)"});
            },150);
            
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 90% 80%, 90% 20%, 10% 20%)"});
            },300);
            
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 10% 80%, 90% 80%, 90% 20%, 10% 20%)"});
            },450);
        } 
        
        function zoom(){
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 90% 80%, 90% 20%, 10% 20%)"});
            },2000);
            
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 100% 100%, 90% 20%, 10% 20%)"});
            },2150);
            
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(10% 20%, 0% 100%, 100% 100%, 100% 0, 10% 20%)"});
            },2300);
            
            setTimeout(function(){
                $("#main").css({'-webkit-clip-path':"polygon(0% 0%, 0% 100%, 100% 100%, 100% 0, 0% 0%)"});
            },2450);
        }
        
    </script>
</body>
</html>







