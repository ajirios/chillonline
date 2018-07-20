<%-- 
    Document   : sounds
    Created on : 17-Sep-2016, 2:06:35 AM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.ClientRetrieve"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">

              
   header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#bababa));
   background: -webkit-linear-gradient(top, #ffffff, #bababa);
   background: -moz-linear-gradient(top, #ffffff, #bababa);
   background: -ms-linear-gradient(top, #ffffff, #bababa);
   background: -o-linear-gradient(top, #ffffff, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    opacity: 1.0;
    text-indent: 30px;
  }
  
  #post-field
            {
                margin: 10px auto 10px auto;
                width: 710px;
                height: 630px;
                background-color: #fff;
                float: none;
                padding: 5px 5px 5px 5px;
                
            }
            
            .argument-field
            {
                margin: 5px 5px 5px 5px;
                width: 700px;
                height: 90px;
                text-align: left;
                background-color: #fff;
                font-size: 12px;
            }
            
            .spectator-field
            {
                margin: 5px 5px 5px 5px;
                width: 690px;
                height: 90px;
                
            }
            
            .comments
            {
                width: 200px;
                height: 90px;
                font-size: 11px;
                color: #f40;
                float: left;
            }
            
            .likes
            {
                width: 200px;
                height: 90px;
                font-size: 11px;
                color: #f40;
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
                width: 500px;
                height: 50px;
                padding-left: 50px;
            }
            
            .arguer h4 a
            {
                color: #f40;
                text-decoration: none;
                font-size: 13px;
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
  /*  background: transparent;  /* optional: just make scrollbar invisible */
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
  
     .logos
  {
      background-color: #333;
      margin-left: 0px;
      margin-right: 0px;
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -980px;
  }
  
  #logos
  {
      height: 70%;
      opacity: 1.0;
  }
  
  .arguer
  {
      width: 500px;
      height: 50px;
      padding-left: 50px;
  }
  
  .aholder
  {
      width: 600px;
      height: 100px;
  }
  
  .cholder
  {
      height: 100px;
      width: 100px;
      float: left;
  }
  
.circular {
	width: 100px;
	height: 100px;
	border-radius: 50px;
	-webkit-border-radius: 50px;
	-moz-border-radius: 50px;
	background: url(../image4.jpg) no-repeat;
        background-size: 200px;
        float: left;
	}

.circular img {
	opacity: 0;
	filter: alpha(opacity=0);
	}
        
        .image
        {
            float: right;
        }
 
#controls
{
    width: 800px;
    height: 100px;
    background-color: #fff;
    float: none;
    box-shadow: 0px 2px 2px #999;
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 15px;
}

#descript
{
    width: 794px;
    height: 40px;
    background-color: #fff;
    float: none;
    margin-top: 5px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 5px;
    text-align: center;
    border-left: 3px solid #f50;
    border-right: 3px solid #f50;
}

#descript-internal
{
    width: 794px;
    height: 20px;
    background-color: #fff;
    float: none;
    padding-top: 10px;
    margin-left: auto;
    margin-right: auto;
    padding-bottom: 10px;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
}

#title-holder
{
    margin-left: 15px;
    width: 770px;
    height: 30px;
}

#title
{
    margin-top: 5px;
}
  
  .content-comments
  {
      width: 100%;
      height: 2500px;
      background-color: #fff;
      margin-top: 10px;
  }
  
  #post-new-text
  {
      background-color: #eee;
      border: 1px solid #999;
  }
  
  #post-new-textarea
  {
      width: 700px;
      height: 200px;
      padding-top: 20px;
      margin-left: 50px;
      margin-right: 50px;
      padding-bottom: 20px;
  }
  
  .post
  {
      width: 96%;
      height: 930px;
      margin-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      margin-bottom: 10px;
  }
  
  #post-collapsed
  {
      width: 96%;
      height: 610px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
  }
  
  .commenter-area
  {
      width: 100%;
      height: 60px;
  }
  
  .commenter
  {
      width: auto;
      height: 60px;
      float: left;
  }
  
  #comment-time
  {
      
  }
  
  #commenter-address
  {
      width: 100%;
      height: 30px;
      font-size: 13px;
      color: #bbb;
  }
  
  #commenter-name
  {
      width: 100%;
      height: 30px;
      font-size: 14px;
      color: #f40;
  }
  
  #commenter-pic-area
  {
      width: 80px;
      height: 625px;
      float: left;
      background-color: #fff;
  }
  
  #commenter-pic
  {
      width: 60px;
      height: 60px;
      border-radius: 30px;
      background: url("../clients/imageme2.jpg");
      background-size: contain;
  }
  
  #original-comment-area
  {
      width: 100%;
      height: 430px;
      font-size: 13px;
  }
  
  #original-comment
  {
      
  }
  
  .interact-area
  {
      width: 20%;
      height: 30px;
      float: right;
  }
  
  .interact-review-area
  {
      width: 100%;
      height: 30px;
      float: left;
      background-color: #fed;
  }
  
  .interactions-area
  {
      width: auto;
      height: 20px;
      font-size: 13px;
      color: #f40;
      background-color: #fed;
      padding-top: 5px;
      padding-bottom: 5px;
  }
  
  .interactions-border
  {
      width: auto;
      height: 2px;
  }
  
  #like-button
  {
      width: 20%;
      height: 20px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  #reply-button
  {
      width: auto;
      height: 20px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  .written
  {
      margin-left: 2%;
      margin-right: 2%;
  }
  
  #reply-field
  {
      margin-left: 80px;
      width: auto;
      height: 350px;
      background-color: #fed;
  }
  
  .commentaries
  {
      width: 100%;
      height: 20px;
      padding-top: 25px;
      padding-left: 15px;
      padding-right: 15px;
      padding-bottom: 25px;
  }
  
  .comment-link-design
  {
      text-decoration: none;
      color: #f40;
  }
  
  .pep-link-design
  {
      text-decoration: none;
      color: #f40;
  }
  
  #passageway
  {
      width: 720px;
      padding-top: 2px;
      margin-left: auto;
      margin-right: auto;
      padding-bottom: 20px;
  }
  
  .blackscreen
  {
      width: 720px;
      height: 405px;
      background-color: #000;
      text-align: center; 
  }
  
  #movieteaser
  {
      display: inline-block;
      width: 720px;
      height: 100%;
      vertical-align: middle;
  }
  
  ::-webkit-media-controls 
  
  {
      display:none !important;
  }

  video::-webkit-media-controls 
  {
      display:none !important;
  }

  video::-webkit-media-controls-enclosure 
  {
      display:none !important;
  }
  
  .toggles
  {
      width: 30%;
      float: left;
  }
  
  #number-of-peppers
  {
      color: #333;
      font-size: 12px;
      font-weight: bold;
  }
  
  #program-name
  {
      width: 100%;
      height: 25px;
      font-size: 24px;
      padding-bottom: 6px;
  }
  
  #distributor-name
  {
      width: 100%;
      height: 12px;
      font-size: 11px;
      font-weight: bold;
  }
  
  .title
  {
      color: #f40;
      font-size: 13px;
      font-weight: bold;
      padding-top: 2px;
      padding-bottom: 2px;
  }
  
  .distributor
  {
      color: #f40;
  }
  
  .views
  {
      color: #f40;
      padding-top: 2px;
      padding-bottom: 2px;
  }
  
  .clickable-text
  {
      text-decoration: none;
  }
  
  .upper-interactions
  {
      width: 100%;
      height: 65px;
      background-color: #fff;
      box-shadow: 0 1px 0px #aaa;
      margin-bottom: 1px;
  }
  
  .lower-interactions
  {
      width: 100%;
      height: 35px;
      background-color: #fff;
      margin-bottom: 10px;
  }
  
  .upper-interactions-left
  {
      width: 98%;
      height: 55px;
      float: left;
      background-color: #fff;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .upper-interactions-right
  {
      width: 98%;
      height: 55px;
      float: left;
      background-color: #fff;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .lower-interactions-left
  {
      width: 23%;
      height: 15px;
      float: left;
      background-color: #fff;
      padding-top: 7px;
      padding-bottom: 13px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .lower-interactions-right
  {
      width: 73%;
      height: 15px;
      float: left;
      background-color: #fff;
      padding-top: 7px;
      padding-bottom: 13px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .views2
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 20px;
  }
    
  .distributor-logo-area
  {
      float: left;
      width: 50px;
      height: 50px;
      border-radius: 25px;
      background-image: url("../disney.jpg");
      background-size: contain;
  }
  
  .distributor-name-area
  {
      width: auto;
      float: left;
      padding: 5px 15px 5px 15px;
  }
  
  #program-description-area
  {
      width: 96%;
      height: 50px;
      padding-top: 25px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 25px;
      background-color: #FFF;
      font-size: 12px;
      white-space: pre-line;
  }
  
  
  
        
        
        
            
        </style>
        
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
        
        
        <div id="passageway">
        
      
      <%
                String pageRequestNumber = null;
                long pageNumber;
                
                
                %>
                
                        
                
                <form hidden id="board-id-request-form" method="post" action="users.jsp">
                    
                    <input type="text" id="board-id-request" name="board-id-request" />
                    <input type="submit" />
                    
                </form>
                
                
                
                <div id="page-request-form-div" hidden>

                    <form id="page-request-form" method="post" action="users.jsp" hidden>

                        <input type="text" id="page-request-number" name="page-request-number" value="<%= pageRequestNumber %>" />
                        <input type="submit" id="page-request-number-submit" />

                    </form>

                </div>
                    
                    
    
    
    <script type="text/javascript" language="javascript">
        
     //$('body').on('contextmenu', 'img', function(e) {return false;});
        //$('body').on('contextmenu', 'video', function(e) {return false;});
        
        
    if (document.addEventListener) 
    { // IE >= 9; other browsers
        document.addEventListener('contextmenu', function(e) 
        
        {
            //alert("You've tried to open context menu"); //here you draw your own menu
            e.preventDefault();
        }, false);
    } 
    
    else 
    
    { // IE < 9
        document.attachEvent('oncontextmenu', function() 
        
        {
            //alert("You've tried to open context menu");
            window.event.returnValue = false;
        });
    }
        
        
        
    </script>
    
        
        
        
        
        
        <div class=""></div>
            <div class="blackscreen">
                
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area"></div>
                    <div class="distributor-name-area">
                        <div id="program-name"></div>
                        <div id="distributor-name"></div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    
                    <a class="clickable-text" href="javascript:submitVideoPepperSubmitForm();" title='Pep up this video.' >
                        <span id="number-of-peppers">0 &nbsp; </span><i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Pep</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Share this video to a board.' >
                        <span id="number-of-peppers">0 &nbsp; </span><i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Share</span>
                    </a>
                    <a class="clickable-text" href="javascript:feedToAccount();" title='Feed this video to your account.' >
                        <span id="number-of-peppers">0 &nbsp; </span><i class="fa fa-home" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Feed</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Pin this video.' >
                        <span id="number-of-peppers">0 &nbsp; </span><i class="fa fa-thumb-tack" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Pin to board</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Announce.' >
                        <span id="number-of-peppers"> &nbsp; </span><i class="fa fa-bullhorn" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">News</span>  &nbsp; &nbsp; 
                    </a>
                    
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                    
                    
            <div id="program-description-area">
                No description available.
            </div>
                    
                    
                    
                    
        
        <div hidden id="descript"><div id="descript-internal">Board >> Winnipeg Community</div></div>
        
                
        
  
        
        
        </div>
        
        
        
        
<script type="text/javascript">
    
    
    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var packageID = 0;
var type = "movie";
var business = "rental";
        
var myVideo = document.getElementById("movieteaser"); 

function replay() 

{

    myVideo.pause();
    myVideo.currentTime = 0;
    myVideo.play();

}

function playPause() 

{ 
    if (myVideo.paused) 
        myVideo.play(); 
    else 
        myVideo.pause(); 
} 

function fullscreen()

{
    
    myVideo.webkitEnterFullScreen();
    
}

function transferMovieByID(movieID, transaction)

{
    packageID = movieID;
    type = "movie";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
    
}

function transferSeriesByID(seriesID, transaction)

{
    packageID = seriesID;
    type = "series";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferVideoByID(videoID)

{
    packageID = videoID;
    type = "video";
    
    if (videoID > 0)
        
    {
        document.getElementById("page-request-number").value = videoID;
        document.getElementById("page-request-form").submit();
    }
    
}

function transferMusicByID(musicID, transaction)

{
    packageID = musicID;
    type = "music";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferTVChannelByID(tvChannelID, transaction)

{
    packageID = tvChannelID;
    type = "tv";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferRadioChannelByID(radioChannelID, transaction)

{
    packageID = radioChannelID;
    type = "radio";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferGameByID(gameID, transaction)

{
    packageID = gameID;
    type = "game";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}




    
    
</script>
        
  
    </body>
</html>
