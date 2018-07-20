<%-- 
    Document   : board
    Created on : 15-Jan-2017, 1:42:52 AM
    Author     : El Jefe
--%>

<%@page import="messages.MessageList"%>
<%@page import="client.ClientRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="board.BoardRetrieve" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title id="title">Board | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../code.jquery.com_jquery-2.1.0-rc1.min.js"></script>
<script src="board.js"></script>
<meta charset="utf-8" /> 
<style type="text/css">
  
  header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
   background: -webkit-linear-gradient(top, #000, #bababa);
   background: -moz-linear-gradient(top, #000, #bababa);
   background: -ms-linear-gradient(top, #000, #bababa);
   background: -o-linear-gradient(top, #000, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    opacity: 1.0;
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
    height: 100%;
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
  
  nav ul li .a.current
  {
    color: #e63;
  }
  
  nav ul li .a:link, nav ul li .a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
    background: -webkit-linear-gradient(top, #000, #bababa);
    background: -moz-linear-gradient(top, #000, #bababa);
    background: -ms-linear-gradient(top, #000, #bababa);
    background: -o-linear-gradient(top, #000, #bababa);
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
  nav ul li .a:hover, nav ul li .a:active
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
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 12px;
      color: #fff;
      text-decoration: none;
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
   padding-top: 3px;
   padding-bottom: 3px;
   -webkit-border-radius: 15px;
   -moz-border-radius: 15px;
   border-radius: 15px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 10px;
   font-family: Sans-Serif;
   text-decoration: none;
   text-align: center;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 5px;
   width: 150px;
   }
.button2:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button2:active {
   border-top-color: #2c3d00;
   background: #2c3d00;
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
      margin-top: 10px;
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
      width: 100%;
      height: 30px;
      margin-left: 0;
      margin-right: 0;
      background-color: #f50;
  }
  
  .flexsearch--wrapper {
	height: auto;
	width: 50%;
	overflow: hidden;
	background: transparent;
	margin: 0 auto;
	position: static;
}
	
.flexsearch--form 
{
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper 
{
	padding: 0 0px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}
.flexsearch--input {
  width: 100%;
}
/***********************
 * Configurable Styles *
 ***********************/
.flexsearch 
{
  padding: 0 50px 0 50px; /* Padding for other horizontal elements */
  float: left;
  display: none;
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 24px;
  padding: 0 10px 0 10px;
	border-color: #e63;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
  margin-top: 1px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 14px;
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
.flexsearch--input:focus 
{
  outline: none;
  border-color: #e63;
  padding-left: 40px;
}
.flexsearch--input:focus.flexsearch--submit 
{
 	color: #333; 
}
.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}
::-webkit-input-placeholder {
	color: #888;  
}
input:-moz-placeholder 
{
  color: #888;
}

html 
{
    overflow: scroll;
    overflow-x: hidden;
    height: 100%;
}
::-webkit-scrollbar 
{
    width: 6px;  /* remove scrollbar space */
    background: transparent;  /* optional: just make scrollbar invisible */
}
/* optional: show position indicator in red */
::-webkit-scrollbar-thumb 
{
    background: #777;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
}

#youtube-search
{
  padding: 0 0px 0 0px; /* Padding for other horizontal elements */
  display: block;
}
	
#search-form 
{
	overflow: hidden;
	position: relative;
}
	
.fieldcontainer 
{
	padding: 0 0px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}

.search-field
{
    width: 95%;
    margin-left: 1%;
    margin-right: 1%;
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 24px;
  padding: 0 0 0 3%;
	border-color: #e63;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
  margin-top: 1px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 14px;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.search-field:focus 
{
  outline: none;
  border-color: #e63;
}

iframe
{
    border: 0;
}

#middle
{
    width: 67%;
    margin-top: 2px;
    height: 100vh;
}

button 
{
    background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
}

    #menu 
    {
        float:left;
        width:16%;
        margin-top: 2px;
        height: 100vh;
    }
    
    #mainContent 
    {
        float:right;
        width:16%;
        margin-top: 2px;
        height: 100vh;
    }
    
    .ico
    
    {
        width: 10%;
    }
    
    .feed
    {
        color: #fff;
        float: left;
        height: 25px;
        width: 80px;
        margin-left: 20px;
        margin-top: 5px;
        font-size: 14px;
    }
    
    .subnav
    {
        color: #fff;
        text-decoration: none;
    }
    
    .subnav:focus
    {
        outline: 0;
    }
    
    #my-account
  {
      display: none;
      overflow: no-content;
      position: fixed;
      width: 190px;
      height: 250px;
      background-color: #FFF;
      border: 2px solid #f00;
      box-shadow: 0 1px 4px #333;
  }
  
  nav ul li .a:hover ~#my-account
  {
      display: block;
  }
    
    #my-account:hover
  {
      display: block;
  }
  
  .action-container
  {
      width: 160px;
      height: 35px;
      background-color: #f40;
      padding-top: 15px;
      padding-left: 15px;
      padding-right: 15px;
      float: right;
  }
  
  .action
  {
      color: #fff;
      font-size: 13px;
      text-decoration: none;
  }
  
  #logout-button-form
  {
      display: none;
  }
  
  #deck
  {
      height: 100vh;
      width: 1240px;
      margin-left: auto;
      margin-right: auto;
      border-left: 1px solid #aaa;
      border-right: 1px solid #aaa;
  }
  
  .center
  {
      height: 30px;
      width: 1240px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .pre-subheader-align
  {
      width: 42%;
      height: 20px;
      padding-top: 10px;
      padding-bottom: 10px;
      text-align: center;
      color: #FFF;
      font-size: 18px;
      font-weight: bold;
      float: left;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .pre-subheader-align-left
  {
      width: 27.5%;
      height: 20px;
      padding-top: 5px;
      padding-bottom: 15px;
      text-align: right;
      color: #FFF;
      font-size: 18px;
      font-weight: bold;
      float: left;
  }
  
  .pre-subheader-align-right
  {
      width: 30.5%;
      height: 20px;
      padding-top: 5px;
      padding-bottom: 15px;
      text-align: right;
      color: #FFF;
      font-size: 18px;
      font-weight: bold;
      float: left;
  }
  
  .pre-subheader
  {
      height: 40px;
      width: 100%;
      background-color: #f40;
      margin-top: 0;
      margin-bottom: 1px;
  }
    
    .feed2
    {
        color: #fff;
        float: left;
        height: 25px;
        width: 250px;
        margin-left: 0px;
        margin-top: 5px;
        font-size: 14px;
    }
  
  .center-upper
  {
      height: 40px;
      width: 1240px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .msg_input
  {
      border: transparent;
      border-top: 1px solid #bdc3c7;
      width: 100%;
      padding: 5px;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      font-family: sans-serif;
  }
  
  .chat_box,.msg_box
  {
      cursor: pointer;
      position: fixed;
      bottom: 0px;
      right: 10px;
      background: white;
      width: 250px;
      border-radius: 5px 5px 0px 0px;
  }
  
  .chat_head,.msg_head
  {
      background: #f40;
      padding: 15px;
      color: white;
      border-radius: 5px 5px 0px 0px;
  }
  
  .chat_body
  {
      height: 400px;
      display: none;
  }
  
  .msg_head
  {
      background: #f40;
  }
  
  .msg_body
  {
      height: 250px;
      font-size: 12px;
      overflow: auto;
  }
  
  .msg_body_content
  {
      min-height: 2px;
  }
  
  .msg_box
  {
      background: white;
      width: 250px;
      bottom: -5px;
      display: none;
  }
  
  .close
  {
      float: right;
  }
  
  .user
  {
      padding: 20px 25px;
      position: relative;
      cursor: pointer;
  }
  
  .user:hover
  {
      background: #F8F8F8;
  }
  
  .user:before
  {
      content: "";
      position: absolute;
      background: #2ecc71;
      width: 10px;
      height: 10px;
      left: 8px;
      top: 24px;
      border-radius: 5px;
  }
  
  .msg_a
  {
      margin-top: 10px;
      margin-right: 20px;
      margin-left: 20px;
      min-height: 15px;
      padding: 15px 10px;
      background: #eee;
      position: relative;
      border-radius: 5px;
  }
  
  .msg_a:before
  {
      content: "";
      position: absolute;
      width: 0px;
      height: 0px;
      bottom: 7px;
      left: -16px;
      border: 10px solid;
      border-color: transparent #eee transparent transparent;
  }
  
  .msg_b
  {
      margin-top: 10px;
      margin-right: 20px;
      margin-left: 20px;
      min-height: 15px;
      padding: 15px 10px;
      background: #F50;
      position: relative;
      border-radius: 5px;
      color: #FFF;
  }
  
  .msg_b:before
  {
      content: "";
      position: absolute;
      width: 0px;
      height: 0px;
      bottom: 7px;
      right: -16px;
      border: 10px solid;
      border-color: transparent transparent transparent #F50;
  }
  
  
  
  
  

  
</style>

<script type="text/javascript">
  

    function submitLogoutForm()
        
    {
        document.forms["logout-button-form"].submit(); 
    }

  
</script>

<script type="text/javascript">

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
  
  
  
  
  
  document.getElementById("query")
    .addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode == 13) {
        document.getElementById("search-btn").click();
    }
});
  
  
  function search()
  {
      var boardID = document.getElementById("board-id-span").value;
      document.getElementById("middle").contentWindow.document.getElementById("board-id-request").value = boardID;
      document.getElementById("middle").contentWindow.search();
      return false;
  }
  
  function goToLog()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "tutorials.jsp";
  }
  
  function goToVideos()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "users.jsp";
  }
  
  function goToMovies()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "movies.jsp";
  }
  
  function goToSeries()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "series.jsp";
  }
  
  function goToChannels()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "channels.jsp";
  }
  
  function goToSounds()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "sounds.jsp";
  }
  
  function goToGames()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "games.jsp";
  }
  
  function goToMusic()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "music.jsp";
  }
  
  function searchLog()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "tutorials.jsp";
  }
  
  function searchVideos()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "users.jsp";
  }
  
  function searchMovies()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "movies.jsp";
  }
  
  function searchSeries()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "series.jsp";
  }
  
  function searchMusic()
  {
      var streamContent = document.getElementById("middle");
      streamContent.src = "music.jsp";
  }
  
  function transferBoardIDToLeftFrame(boardID)
  {
      window.frames["menu"].document.getElementById("board-id-request").value = boardID;
      window.frames["menu"].document.getElementById("board-id-request-form").submit();
  }
  
  function transferBoardIDToMiddleFrame(boardID)
  {
      window.frames["middle"].document.getElementById("board-id-request").value = boardID;
      window.frames["middle"].document.getElementById("board-id-request-form").submit();
  }
  
  function transferBoardIDToRightFrame(boardID)
  {
      window.frames["mainContent"].document.getElementById("board-id-request").value = boardID;
      window.frames["mainContent"].document.getElementById("board-id-request-form").submit();
  }
  
  function sendAnEmailInvitation(boardID)
  {
      document.getElementById("email-board-id-request").value = boardID;
      document.getElementById("email-invitation-form").submit();
  }
  
  function submitMessageForm()
  {
      var message = document.getElementById("message").value;
      var senderClientID = document.getElementById("sender-client-id").value;
      var recipientClientID = document.getElementById("recipient-client-id").value;
      
      alert("working!");
      
      var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var messages = xml.responseXML.getElementsByTagName("message")[0].firstChild.nodeValue;
                //document.getElementById("movie-request-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "sender-client-id=" + senderClientID + "&recipient-client-id=" + recipientClientID + "&message=" + message;
    
    xml.open("GET", "../MessageServlet?" + post, true);
    xml.send();
      
  }
  
  
  
  
  
  
</script>

</head>

<body>
    
    
    
    <%
        
        if (session.getAttribute("account-number") == null)
        
        {
            response.sendRedirect("../signin.jsp");
        }
        
        
        long accountNumber = Long.parseLong((String) session.getAttribute("account-number"));
        System.out.println("Account Number: " + accountNumber);
        ClientRetrieve client = new ClientRetrieve(accountNumber);
        
        
        %>
        
        
        
    <%
        
        long boardID = -1;
        
        if (request.getParameter("board-id-request") != null)
        
        {
            boardID = Long.parseLong(request.getParameter("board-id-request"));
        }
        
        System.out.println("board.jsp page has board id of " + boardID);
        
        %>
        
        
        
        
      
      <%
                String pageRequestNumber = null;
                String pageNumber = null;
                String title = null;
                String channelTitle = null;
                String thumbnail = null;
                String description = null;
                
                System.out.println("Board stream requested " + request.getParameter("page-request-number"));
                
                if (request.getParameter("page-request-number") == null)
                
                {
                    pageRequestNumber = "1";
                    
                    if (request.getParameter("search-name") != null)

                    {
                        
                        pageNumber = request.getParameter("search-name");
                        
                    }
                    
                    else
                        
                    {
                        pageNumber = "-1";
                    }
                    
                }
                
                else 

                {
                    
                    if (request.getParameter("page-request-number").equals(""))
                        
                    {
                        pageRequestNumber = "-1";
                        pageNumber = pageRequestNumber;
                    }
                    
                    else
                        
                    {
                        pageRequestNumber = request.getParameter("page-request-number");
                        pageNumber = pageRequestNumber;

                        if (request.getParameter("title") != null)

                        {
                            title = request.getParameter("title");
                            channelTitle = request.getParameter("channel-title");
                            thumbnail = request.getParameter("thumbnail");
                            description = request.getParameter("description");
                        }
                        
                    }
                    
                }
                
                
                
                %>
        
        
        
        <form method="post" name="logout-button-form" id="logout-button-form" action="../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    
      <div class="head">
        
        <a href=""><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../carriers/terminal.jsp">My Channels</a></div>
                            <div class="action-container"><a class="action" href="../distributors/uploads.jsp">My Distributions</a></div>
                            <div class="action-container"><a class="action" href="../clients/account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="../clients/account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>    
                    <!--
                    <li><a class="a" href="../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../clients/packages.jsp" >Packages</a></li>
                    -->
                    <li><a class="a" href="../clients/job-boards.jsp" >Job Boards</a></li>
                    <li><a class="a" href="../clients/course-boards.jsp" >Course Boards</a></li>
                    <li><a class="a" href="../clients/leisure-boards.jsp">Leisure Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
        
        
        <%
            
            BoardRetrieve board = new BoardRetrieve(boardID);
            
            %>
      
      
    <div class="pre-subheader">
        
        <div class="center-upper">
            
            <div class="pre-subheader-align-left"></div>
            
            <div class="pre-subheader-align">
                
                <span>Board for <%= board.getBoardName() %></span>
                
            </div>
                
            <div class="pre-subheader-align-right">
                
                <form name="email-invitation-form" id="email-invitation-form" method="post" action="boarding-invitations.jsp">
                    
                    <input type="text" id="email-board-id-request" name="email-board-id-request" value="<%= boardID %>" hidden />
                    <div class="feed2"><button class="subnav" onclick='sendAnEmailInvitation(<%= boardID %>);' ><i class="fa fa-envelope" style="font-size:15px;color:#FFF"></i> &nbsp; <b>Invite a Course Member</b></button></div>
                    
                </form>
                
            </div>
                
        </div>

    </div>
    
    <div class="subheader">
        
        <div class="center">
            
            
            <!--
            <div class="feed"><button class="subnav" onclick='goToLog();' ><b>Work</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToMovies();'><b>Movies</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToVideos();'><b>Videos</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToSeries();'><b>Series</b></button></div>
            -->
                    
            
            <div id="youtube-search">
                
                <div class="flexsearch--wrapper">
                            <form id="search-form" name="search-form" onsubmit="return false">
                                    <div class="fieldcontainer">
                                            <input type="search" id="query" class="search-field" placeholder="YouTube Content Search" />
                                            <input class="flexsearch--department" type="text" name="search-department" value="tutorials" hidden>
                                    </div>
                                <input hidden type="submit" name="search-btn" id="search-btn" class="flexsearch--submit" onclick="search()" />
                            </form>
                </div>
                
            </div>
            
            <!--
            <div class="feed"><button class="subnav" onclick='goToMusic();'><b>Music</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToChannels();'><b>TV</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToSounds();'><b>Radio</b></button></div>
            <div class="feed"><button class="subnav" onclick='goToGames();'><b>Games</b></button></div>
            -->
            
        </div>
        
    </div>
        
        
        <input hidden id="board-id-span" type="text" value="<%= boardID %>" />
        <input hidden id="board-page-request-number" type="text" value="<%= pageNumber %>" />
        <input hidden type="text" id="tutorial-title" name="title" value="<%= title %>" />
        <input hidden type="text" id="channel-title" name="channel-title" value="<%= channelTitle %>" />
        <input hidden type="text" id="thumbnail" name="thumbnail" value="<%= thumbnail %>" />
        <input hidden type="text" id="description" name="description" value="<%= description %>" />
        
        
        
        
        
        <div id="deck">    
            
            <iframe id="menu" name="menu" src="profilepic.jsp"></iframe>
            <iframe id="middle" name="middle" src="tutorials.jsp"></iframe>
            <iframe id="mainContent" name="mainContent" src="frames2b.jsp"></iframe>
            
        </div>
        
        
        
        
        <!--
        <div class="chat_box">
            
            <div class="chat_head">Message box</div>
            <div class="chat_body">
                
                <div class="user">Jill Paxton</div>
                
            </div>
            
        </div>
        -->
        
        <div id="msg_box" class="msg_box" style="right:290px">
            
            <div class="msg_head"><span id="recipient-client-name">Jill Paxton</span>
                
                <div class="close">X</div>
                
            </div>
        
            
            
            
            
            <div class="msg_wrap">
                <div class="msg_body">
                    <div id="msg_body_content" class="msg_body_content">
                        
                        
                        
                    </div>
                    <div class="msg_hidden" hidden></div>

                </div>
                
                <form method="post" action="../MessageServlet">
                    
                    <div class="msg_footer"><textarea class="msg_input" id="message" name="message" rows="3" placeholder="Write a message."></textarea></div>
                    <input type="text" id="sender-client-id" name="sender-client-id" value="<%= client.getClientID() %>" hidden />
                    <input type="text" id="recipient-client-id" name="recipient-client-id" value="42" hidden />
                    
                    <input type="submit" hidden/>
                </form>
                
            </div>
        </div>
                    
                    

</body>
</html>

