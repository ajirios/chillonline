
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <title id="title">Home | Chill Online</title>
<link rel="shortcut icon" type="image/png" href="3.png"/>
<meta charset="utf-8" /> 
<style type="text/css">
  
  header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#e63), to(#bababa));
   background: -webkit-linear-gradient(top, #e63, #bababa);
   background: -moz-linear-gradient(top, #e63, #bababa);
   background: -ms-linear-gradient(top, #e63, #bababa);
   background: -o-linear-gradient(top, #e63, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
  }
  
  .post-field
            {
                margin: 25px auto 25px auto;
                width: 800px;
                height: 300px;
                background-color: #fff;
                float: none;
                padding: 20px 20px 20px 20px;
                
            }
            
            .argument-field
            {
                margin: 5px 5px 5px 5px;
                width: 790px;
                height: 90px;
                text-align: left;
                
                
            }
            
            .spectator-field
            {
                margin: 5px 5px 5px 5px;
                width: 790px;
                height: 90px;
                
            }
            
            .comments
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .likes
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .dislikes
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .timestamp
            {
                color: #AAA;
                font-size: 12px;
                
            }
            
            .arguer h4 a
            {
                color: #e63;
                text-decoration: none;
            }
  
  .head
  {
      width: 90%;
      height: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0;
  }
  
  body
  {
    margin: 0;
    background-color: #EEE;
    font-family: sans-serif;
    height: 2000px;
  }
  
  nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin-right: 0;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 0;
  }
  nav ul li
  {
    float: right;
  }
  
  nav ul li a.current
  {
    color: #add9e6;
  }
  
  nav ul li a:link, nav ul li a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#e63), to(#bababa));
    background: -webkit-linear-gradient(top, #e63, #bababa);
    background: -moz-linear-gradient(top, #e63, #bababa);
    background: -ms-linear-gradient(top, #e63, #bababa);
    background: -o-linear-gradient(top, #e63, #bababa);
    opacity: 0.8;
    text-align: right;
    padding-top: 18px;
    padding-bottom: 18px;
    padding-left: 20px;
    padding-right: 20px;
    text-decoration: none;
    color: #fff;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 12px;
  }
  nav ul li a:hover, nav ul li a:active
  {
    color: #add9e6;
    opacity: 1.0;
  }
      
  .sept
  {
    background-color: #FFF;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 505px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 2px 5px #AAA;
  }
  
  .sept2
  {
    background-color: #EEE;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 500px;
    color: #000;
  }
  
  nav
  
  {
      
    margin-right: 0px;
    float: right;
      
  }
  
  footer
  {
    background-color: #FFF;
    margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
    height: 300px;
    box-shadow: 0px 2px 5px #AAA;
    opacity: 0.7;
    margin-top: -200px;
    font-size: 12px;
  }
  
  .logos
  {
      background-color: #333;
      margin-left: 10px;
      margin-right: 10px;
      height: 200px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -500px;
  }
  
  #logos
  {
      height: 50%;
      opacity: 1.0;
  }
  
  .button {
   border-top: 1px solid #d4003c;
   background: #780000;
   background: -webkit-gradient(linear, left top, left bottom, from(#b00000), to(#780000));
   background: -webkit-linear-gradient(top, #b00000, #780000);
   background: -moz-linear-gradient(top, #b00000, #780000);
   background: -ms-linear-gradient(top, #b00000, #780000);
   background: -o-linear-gradient(top, #b00000, #780000);
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 17px;
   font-family: 'Lucida Grande', Helvetica, Arial, Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border-top-color: #c90000;
   background: #c90000;
   color: #f2efef;
   }
.button:active {
   border-top-color: #a30a11;
   background: #a30a11;
   }
   
   .button2 {
   border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 17px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 5px;
   }
.button2:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button2:active {
   border-top-color: #a30a11;
   background: #a30a11;
   }
  
  .rimground
  {
    width: 100px;
    height: 150px;
    opacity: 1.0;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 5px;
    margin-right: 5px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 10px;
  }
    
  .bol
  {
      float: left;
      margin-top: 5px;
      margin-left: 0px;
      width: 150px;
  }
  
  #container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 70px;
      width: 90%;
      height: 500px;
  }
.moviediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}
.seriediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}
.musicdiv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}
.gamediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}
  .divers
  {
      margin-left: 0;
      margin-right: 0;
      margin-top: 0;
      height: 500px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 500px;
      width: 500px;
      background-color: #e63;
      float: left;
  }
  
  .createaccount
  {
      color: #FFF;
      width: 400px;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  .titles
  {
      width: 410px;
      height: 300px;
      margin-top: 20px;
      margin-left: 90px;
  }
  
  .names
  {
    width: 300px;
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 10px;
    font-size: 17px;
  }
  
  .boxes
  {
      width: 200px;
      height: 300px;
      margin-top: 20px;
      margin-left: 20px;
      background-color: #e45;
  }
.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
}
.click-agreement
{
    color: #fff;
    font-size: 9px;
}
.footnotes
{
    float: left;
    font-size: 12px;
    height: 230px;
    width: 200px;
    text-align: left;
}
.notes
{
    text-decoration: none;
    color: #000;
}
.notes:hover
{
    color: #e63;
}
  
  #epic
  {
      margin-left: 0px;
  }
  
  .subheader
  {
      margin-top: 0;
      height: 50px;
      margin-left: 0;
      margin-right: 0;
      background-color: #ccc;
  }
  
  .flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 100%;
	overflow: hidden;
	background: transparent;
	margin: 0;
	position: static;
}
	
.flexsearch--form {
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}
.flexsearch--input {
  width: 100%;
}
/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
  padding: 0 250px 0 250px; /* Padding for other horizontal elements */
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #888;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 5px;
  margin-top: 5px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 16px;
	-webkit-appearance: none;
	-moz-appearance: none;
}
	
.flexsearch--submit {
  position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 60px;
  padding: 0;
  border: none;
	margin-top: 20px; /* margin-top + border-width */
  margin-right: 5px; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 60px;
}
.flexsearch--input:focus {
  outline: none;
  border-color: #333;
}
.flexsearch--input:focus.flexsearch--submit {
 	color: #333; 
}
.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}
::-webkit-input-placeholder {
	color: #888;  
}
input:-moz-placeholder {
  color: #888
}

.middle
{
    width: 67%;
    height: 100%;
}

.menu {
      float:left;
      width:16%;
      height:100%;
    }
    .mainContent {
      float:right;
      width:16%;
      height:100%;
    }
  </style>

<script type="text/javascript">

document.getElementById("title").innerHTML = "Diego Poncho | Chill Online";

var pagesVisited = new Array();
function returnPagesVisited()
{
var returnValue = "So far you have visited the following pages\n";
var pageVisitedIndex;
var numberOfPagesVisited = pagesVisited.length;
for (pageVisitedIndex = 0; pageVisitedIndex < numberOfPagesVisited; pageVisited++)
{
returnValue = returnValue + pagesVisited[pageVisitedIndex] + "\n";
}
return returnValue;
}
function addPage(fileName)
{
var fileNameStart = fileName.lastIndexOf("/") + 1;
fileName = fileName.substr(fileNameStart);
pagesVisited[pagesVisited.length] = fileName;
return true;
}
</script>

<script type="text/javascript">
  
  
  
</script>

</head>

<body>
  
  <header>
      
    
      <div class="head">
        
        <a href=""><img class="bol" src="../chillonline-berlin-2.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a href="../index.jsp" >Logout</a></li>
                    <li><a href="../games/login.jsp">Games</a></li>
                    <li><a href="../music/login.jsp" >Music</a></li>
                    <li><a href="../videos/login.jsp" class="current">Videos</a></li>
                    <li><a href="../movies/login.jsp" >Movies</a></li>
                    <li><a href="../series/login.jsp" >Series</a></li>
                    <li><a href="../channels/login.jsp">Channels</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
    
    <div class="subheader">
        
      <div class="flexsearch">
		<div class="flexsearch--wrapper">
			<form class="flexsearch--form" action="#" method="post">
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search">
				</div>
				<input class="flexsearch--submit" type="submit" value="&#10140;"/>
			</form>
		</div>
      </div>
        
    </div>
    
    <iframe class="menu" src="profilepic.jsp"></iframe>
    <iframe class="middle" src="users.jsp"></iframe>
    <iframe class="mainContent" src="frames2b.jsp"></iframe>
    
    
    
  

</body>
</html>

