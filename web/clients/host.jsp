<%-- 
    Document   : host
    Created on : 29-Sep-2017, 12:12:38 PM
    Author     : El Jefe
--%>

<%@page import="board.BoardRetrieve"%>
<%@page import="client.ClientRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="account.movie.*" %>
<%@page import="account.series.*" %>
<%@page import="account.video.*" %>
<%@page import="account.music.*" %>
<%@page import="account.connections.*" %>
<%@page import="account.requests.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Host | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8" /> 
<style type="text/css">
  @font-face {
    font-family: 'Pacifico'; /*a name to be used later*/
    src: url('Pacifico.ttf'); /*URL to font*/
  }

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
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
    
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

  nav ul li .a:link, nav ul li .a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
    background: -webkit-linear-gradient(top, #000, #bababa);
    background: -moz-linear-gradient(top, #000, #bababa);
    background: -ms-linear-gradient(top, #000, #bababa);
    background: -o-linear-gradient(top, #000, #bababa);
    opacity: 1.0;
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
    color: #e63;
    opacity: 1.0;
  }
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 17px;
      color: #fff;
      text-decoration: none;
      float: left;
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
    background: url(https://s3.ca-central-1.amazonaws.com/pegbucket/clients/wallpapers/icecap.jpg);
    background-size: cover;
    margin-right: 0;
    margin-top: 0;
    width: 70%;
    height: 400px;
    color: #000;
    float: right;
  }
  
  #sept2
  {
    background: url(https://s3.ca-central-1.amazonaws.com/pegbucket/clients/wallpapers/icecap.jpg);
    background-size: cover;
    margin-right: 0;
    margin-top: 0;
    width: 100%;
    height: 400px;
    color: #000;
    float: right;
  }
  
  #change-wall-paper-div
  {
      position: absolute;
      margin-top: 20px;
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
    margin-top: 100px;
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
      margin-left: auto;
      margin-right: auto;
      margin-top: 40px;
      width: 1200px;
      height: 2300px;
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

.grey
{
    margin: 25px auto 25px auto;
    height: 50px;
    background-color: #eee;
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
      height: 400px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 400px;
      width: 30%;
      background-color: #f50;
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
      margin-left: 65px;
  }
  
  .names
  {
    width: 400px;
    height: 30px;
    padding: 4px;
    margin: 5px 10px 5px auto;
    border-radius: 1px;
    font-size: 15px;
    border: none;
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

.disclaimer
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
    font-size: 7px;
    text-decoration: none;
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

#content
{
    float: left;
    width: 64%;
    height: 2200px;
    margin-left: 1px;
    background-color: #fff;
}

#posts
{
    float: right;
    width: 35%;
    height: 2000px; 
    margin-right: 1px;
}

#profilepic
{
    width: 100%;
    height: 200px;
    margin-left: 0px;
    margin-right: 0px;
}

.pic
{
    width: 200px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    background: url("../male.jpg");
    background-size: contain;
    border-radius: 100px;
}

#pic
{
    width: 200px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 0px;
    background: white;
    background-size: contain;
    border-radius: 100px;
}

#clientname
{
    height: 50px;
    width: 90%;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    color: #fff;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

#phonenumber
{
    height: 30px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    color: #fff;
}

#address
{
    height: 15px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    color: #fff;
    font-size: 11px;
}

#connect
{
    height: 50px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}
  
#epic
{
    margin-left: 0px;
}
  
  #program-description-area
  {
      width: 96%;
      height: 250px;
      padding-top: 25px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 25px;
      margin-bottom: 10px;
      background-color: #FFF;
      font-size: 12px;
      white-space: pre-line;
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

#overview-area
{
    width: 100%;
    background-color: #fff;
    height: 1000px;
    margin-bottom: 10px;
}

#album-area
{
    padding-top: 20px;
    padding-bottom: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 350px;
}

#overview2-area
{
    width: 100%;
    background-color: #fff;
    height: 450px;
    margin-bottom: 10px;
}

#album2-area
{
    padding-top: 20px;
    padding-bottom: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 350px;
}

#connections-number
{
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 20px;
    margin-right: 20px;
    font-size: 13px;
    font-weight: bold;
    text-align: center;
    background-color: #f40;
    color: #fff;
}

#picture
{
    background: url("../male.jpg");
    background-size: cover;
    width: 85px;
    height: 85px;
}

.picture-container
{
    width: 90px;
    height: 120px;
    float: left;
}

  
  .toggles
  {
      width: 30%;
      float: left;
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
  
  .poster
  {
      float: left;
  }
  
  #product-poster2
  {
      width: 140px;
      box-shadow: 0 1px 4px #777;
      margin-bottom: 5px;
      background-color: #fff;
      float: left;
  }
  
  #loadmore
  {
      background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ccc));
   background: -webkit-linear-gradient(top, #fff, #ccc);
   background: -moz-linear-gradient(top, #fff, #ccc);
   background: -ms-linear-gradient(top, #fff, #ccc);
   background: -o-linear-gradient(top, #fff, #ccc);
      width: 96%;
      height: 20px;
      margin-top: 5px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 10px;
      text-align: center;
      font-size: 12px;
      box-shadow: 0 1px 2px #333;
  }
  
  .section
  {
      width: 70%;
      padding-left: 20px;
      padding-top: 5px;
      padding-bottom: 5px;
  }
  
  .clickable-text
  {
      text-decoration: none;
  }
  
  .clickable-text:hover
  {
      background-color: #eee;
  }
  
  #post-event-field
  {
      margin: 0 auto 25px auto;
    width: 100%;
    height: 130px;
    background-color: #ccc;
    float: none;
    padding: 5px 5px 5px 5px;
  }
  
  #post-event-area
  {
      width: 400px;
      height: 120px;
      margin-left: auto;
      margin-right: auto;
  }
  
  #post-event-textarea
  {
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 2px;
  }
  
  #post-event-buttons-field
  {
      width: 100%;
      height: 30px;
      padding-top: 5px;
  }
  
  #post-event-submit
  {
      width: 20%;
      height: 30px;
      float: left;
  }
  
  #post-event-picture
  {
      width: 40%;
      height: 30px;
      float: left;
  }
  
  #post-event-video
  {
      width: 40%;
      height: 30px;
      float: left;
  }
  
  #logout-button-form
  {
      display: none;
  }
  
  .posts-label
  {
      width: 90%;
      height: 75px;
      font-size: 50px;
      padding: 25px 10px 0px 10px;
      color: #bbb;
  }
  
  .connections-posts-label
  {
      width: 90%;
      height: 75px;
      font-size: 50px;
      padding: 0px 10px 0px 10px;
      color: #bbb;
  }
  
  #hidden-connections
  {
      display: none;
  }
  
  #hidden-connections2
  {
      display: none;
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
  
  .form-place
  {
      width: 80%;
      padding-left: 5%;
      padding-right: 5%;
      height: 2000px;
      margin-top: 20px;
      margin-left: 5%;
      margin-right: 5%;
      background-color: #F8F8F8;
  }
  
  #delete-area
  
  {
      width: 70%;
      height: 60px;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  #delete-style
  {
      text-decoration: none;
      color: #F40;
      text-align: center;
  }
  
  
  
  
  

  
</style>



</head>

<body>
    
    
    
    <%
        //long accountNumber = -1;
        
        if (session.getAttribute("account-number") == null)
        
        {
            response.sendRedirect("../signin.jsp");
        }
        
        
        long accountNumber = Long.parseLong((String) session.getAttribute("account-number"));
        System.out.println("Account Number: " + accountNumber);
        ClientRetrieve client = new ClientRetrieve(accountNumber);
        long boardID = -1;
        BoardRetrieve board = null;
        
        if (request.getParameter("board-management-board-id") != null)
        
        {
            boardID = Long.parseLong(request.getParameter("board-management-board-id"));
            board = new BoardRetrieve(boardID);
        }

        
        %>
        
        
        
        <form name="logout-button-form" id="logout-button-form" action="../Logout">
            
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
                            <div class="action-container"><a class="action" href="account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">My Account Billing</a></div>
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
        
    
<script>
        
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
        
        
          
<script type="text/javascript">
  

            

    function submitLogoutForm()
        
    {
        document.forms["logout-button-form"].submit(); 
    }
    
    function changeMoviesAreaLength(listingSize, areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('movies-area').style.height = stringAreaSize;
        var stringListingSize = listingSize.toString() + "px";
        document.getElementById('movie-listing-area').style.height = stringListingSize;
    }
    
    function changeSeriesAreaLength(listingSize, areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('series-area').style.height = stringAreaSize;
        var stringListingSize = listingSize.toString() + "px";
        document.getElementById('series-listing-area').style.height = stringListingSize;
    }
    
    function changeVideosAreaLength(listingSize, areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('videos-area').style.height = stringAreaSize;
        var stringListingSize = listingSize.toString() + "px";
        document.getElementById('video-listing-area').style.height = stringListingSize;
    }
    
    function changeMusicAreaLength(listingSize, areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('music-area').style.height = stringAreaSize;
        var stringListingSize = listingSize.toString() + "px";
        document.getElementById('music-listing-area').style.height = stringListingSize;
    }
    
    function changeConnectionsAreaLength(listingSize, areaSize)
    
    {
        
        
        if (document.getElementById('hidden-connections').style.display === "none")
            
        {
            var stringAreaSize = areaSize.toString() + "px";
            document.getElementById('overview-area').style.height = stringAreaSize;
            var stringListingSize = listingSize.toString() + "px";
            document.getElementById('album-area').style.height = stringListingSize;
            document.getElementById('hidden-connections').style.display = "block";
            document.getElementById('connections-view-message').innerHTML = "Collapse";
        }
        
        else if (document.getElementById('hidden-connections').style.display === "block")
            
        {
            document.getElementById('overview-area').style.height = "450px";
            document.getElementById('album-area').style.height = "350px";
            document.getElementById('hidden-connections').style.display = "none";
            document.getElementById('connections-view-message').innerHTML = "View all";
        }
        
        else
            
        {
            var stringAreaSize = areaSize.toString() + "px";
            document.getElementById('overview-area').style.height = stringAreaSize;
            var stringListingSize = listingSize.toString() + "px";
            document.getElementById('album-area').style.height = stringListingSize;
            document.getElementById('hidden-connections').style.display = "block";
            document.getElementById('connections-view-message').innerHTML = "Collapse";
        }
        
    }
    
    function submitConnectionIDRequestForm(accountNumber)
        
    {
        document.getElementById("connection-id-request").value = accountNumber;
        document.forms["connection-id-request-form"].submit(); 
    }
    
    function changeRequestsAreaLength(listingSize, areaSize)
    
    {
        
        if (document.getElementById('hidden-connections2').style.display === "none")
            
        {
            var stringAreaSize = areaSize.toString() + "px";
            document.getElementById('overview2-area').style.height = stringAreaSize;
            var stringListingSize = listingSize.toString() + "px";
            document.getElementById('album2-area').style.height = stringListingSize;
            document.getElementById('hidden-connections2').style.display = "block";
            document.getElementById('requests-view-message').innerHTML = "Collapse";
        }
        
        else if (document.getElementById('hidden-connections2').style.display === "block")
            
        {
            document.getElementById('overview2-area').style.height = "450px";
            document.getElementById('album2-area').style.height = "350px";
            document.getElementById('hidden-connections2').style.display = "none";
            document.getElementById('requests-view-message').innerHTML = "View all";
        }
        
        else
            
        {
            var stringAreaSize = areaSize.toString() + "px";
            document.getElementById('overview2-area').style.height = stringAreaSize;
            var stringListingSize = listingSize.toString() + "px";
            document.getElementById('album2-area').style.height = stringListingSize;
            document.getElementById('hidden-connections2').style.display = "block";
            document.getElementById('requests-view-message').innerHTML = "Collapse";
        }
        
    }
    
    function submitConnectionRequestIDForm(accountNumber)
        
    {
        document.getElementById("connection-request-id").value = accountNumber;
        document.forms["connection-request-id-form"].submit(); 
    }
    
    function submitScreenMovieRequestForm(programID)
        
    {
        var type = "movie";
        document.getElementById("screen-programID").value = programID;
        document.getElementById("screen-program-department").value = type;
        document.forms["screen-program-request-form"].submit(); 
    }
    
    function submitScreenSeriesRequestForm(programID)
        
    {
        var type = "series";
        document.getElementById("screen-programID").value = programID;
        document.getElementById("screen-program-department").value = type;
        document.forms["screen-program-request-form"].submit(); 
    }
    
    function submitScreenVideoRequestForm(programID)
        
    {
        var type = "video";
        document.getElementById("screen-programID").value = programID;
        document.getElementById("screen-program-department").value = type;
        document.forms["screen-program-request-form"].submit(); 
    }
    
    function submitScreenMusicRequestForm(programID)
        
    {
        var type = "music";
        document.getElementById("screen-programID").value = programID;
        document.getElementById("screen-program-department").value = type;
        document.forms["screen-program-request-form"].submit(); 
    }
    
    function updateProfilePicture()
    
    {
        document.forms["profile-picture-update-form"].submit(); 
    }
    
    function updateWallPaper()
    
    {
        document.forms["wall-paper-update-form"].submit(); 
    }
    
    function submitDeleteBoardForm()
    
    {
        document.forms["board-delete-form"].submit(); 
    }
    

  
</script>
        
    
    <div class="divers">
    <div class="right">
        <div id="profilepic">
            
            <div class="pic">
                
                <%

                if (board.getTeamLogo() != null) {

                System.out.println(board.getTeamLogo());

                    %>


                <img id="pic" src="<%= board.getTeamLogo() %>" alt="wallpaper" />


                <%
                    
                }
                
                else
                
                {
                
                    %>


                <img id="pic" src="../male.jpg" alt="wallpaper" />


                <%
                    
                }

                    %>
                
            </div>
                
        </div>
        <div id="clientname"><h3><%= board.getBoardName() %></h3></div>
        <div id="address"><%= board.getBoardCity() %>, <%= board.getBoardProvince() %>, <%= board.getBoardCountry() %></div> 
        <div id="phonenumber"><h3><%= board.getNumberOfMembers() %> <%= board.getMemberType() %></h3></div>
        <div id="connect">
                
                        
                        
                        <form id="profile-picture-update-form" method="post" enctype="multipart/form-data" action="../LogoBoardUpdateServlet">
                            
                            <input hidden type="text" name="board-id" value="<%= boardID %>"/>
                            <label for="profile-picture" class="subnav" title="Change profile picture"><i class="material-icons" style="font-size:40px;color:white">edit</i></label>
                            <input id="profile-picture" style="visibility:hidden;" type="file" name="profile-picture" onchange="updateProfilePicture()"/>
                            <input hidden type="submit" value="Submit"/>
                            
                        </form>
                        
            
        </div>
    </div>
    <div class="sept2">
        
        
        
        <div id="change-wall-paper-div" style="margin-left:10px">
            
                        <form id="wall-paper-update-form" method="post" enctype="multipart/form-data" action="../BannerBoardUpdateServlet">
                            
                            <input hidden type="text" name="board-id" value="<%= boardID %>"/>
                            <label for="wall-paper" class="subnav" title="Change wall paper"><i class="material-icons" style="font-size:45px;color:white">edit</i></label>
                            <input id="wall-paper" style="visibility:hidden;" type="file" name="wall-paper" onchange="updateWallPaper()"/>
                            <input hidden type="submit" value="Submit"/>
                            
                        </form>
                            
        </div>
                            
                            
        
        <%
            
        if (board.getBoardPoster() != null) {
            
            %>
        
            
        <img id="sept2" src="<%= board.getBoardPoster() %>" alt="wallpaper" />
        
        
        <%
            
        }
        
        else
        
        {
            
            %>
        
            
        <img id="sept2" src="<%= client.getWallPaper() %>" alt="wallpaper" />
        
        
        <%
            
        }
            
            %>
        
    </div>
        
        <script type="text/javascript"></script>
        
    </div>
    
  
        <div id="container">
            
            
            <div id="posts">
                
                
                <form hidden id="connection-id-request-form" method="post" action="connections.jsp">
                    
                    <input type="text" id="connection-id-request" name="connection-id-request" />
                    <input type="submit" />
                    
                </form>
                
                
                        
                
                
                
                
                
                <div id="overview-area">
                    
                    
                    
                </div>
                
                
                
                
                
            </div>
            
            <div id="content">
                
                
                
                <div class="form-place">
                    
                        <br>
                    
                    <input hidden type="text" id="account-number" name="account-number" value="<%= accountNumber %>">
                    
                    
                <form method="post" action="../NameBoardUpdateServlet">
                <div><h3>Update your board's name.</h3></div>
                <div>Board Name*: <br><input required type="text" class="names" id="board_title" name="board-name" placeholder="Board name">
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input type="submit" value="Update" />
                </div>
                </form>
                
                
                
                <form method="post" action="../PurposeBoardUpdateServlet">
                <div><h3>Update the board's purpose.</h3></div>
                <input required type="radio" id="leisure" name="purpose" value="leisure"/> &nbsp; &nbsp; 
                <label for='leisure'>Leisure &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="course" name="purpose" value="course"/> &nbsp; &nbsp; 
                <label for='course'>Course &nbsp; &nbsp; </label><br><br>
                 <input required type="radio" id="job" name="purpose" value="job"/> &nbsp; &nbsp; 
                 <label for='job'>Job &nbsp; &nbsp; &nbsp; &nbsp; </label><br><br>
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input type="submit" value="Update" /><br><br><br>
                </form>
                    
                    
                <form method="post" action="../DisclaimerBoardUpdateServlet">
                <div><h3>Update the identification disclaimer.</h3></div>
                <div>*This board is for 
                    <input required type="text" class="names" id="member-type" name="member-type" placeholder="member type (e.g. members, students, attendees, employees)"> of 
                    <input required type="text" class="names" id="team-name" name="team-name" placeholder="team name">
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input type="submit" value="Update" />
                </div><br>
                </form>
                
                <form method="post" action="../AffiliateBoardUpdateServlet">
                <div><h3>Update the affiliate or parent organization (if applicable).</h3></div>
                <div>Organization Name*: <br><input type="text" class="names" id="organization-name" name="organization-name" placeholder="Organization name">
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input type="submit" value="Update" />
                </div><br>
                </form>
                
                <form method="post" action="../CityBoardUpdateServlet">
                <div><h3>Update the board's city of operation.</h3></div>
                <div>Board City*: <br><input required type="text" class="names" id="board_city" name="board-city" placeholder="City">
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input type="submit" value="Update" />
                </div>
                </form>
                
                <form method="post" action="../ProvinceBoardUpdateServlet">
                <div><h3>Update the board's state or province of operation.</h3></div>
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <div>Board State or Province*: <br><input required type="text" class="names" id="board_province" name="board-province" placeholder="State or province">
                <input type="submit" value="Update" />
                </div>
                </form>
                
                <form method="post" action="../CountryBoardUpdateServlet">
                <div><h3>Update the board's country of operation.</h3></div>
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <div>Board Country*: <br><input required type="text" class="names" id="board_country" name="board-country" placeholder="Country">
                <input type="submit" value="Update" />
                </div>
                </form>
                
                <br>
                
                
                
                
                <%
                    
                    if (board.getBoardClass() == 1)
                    
                    {
                        
                    %>
                
                    
                <form method="post" action="">
                <div><h3>Upgrade the board class.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="text" class="names" name="account-number" value="<%= accountNumber %>" hidden />
                
                
                <input required type="radio" id="class2" name="class" value="2"> &nbsp; &nbsp; <label for='class2'>Class 2 (maximum 30 members) &nbsp; &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class3" name="class" value="3"> &nbsp; &nbsp; <label for='class3'>Class 3 (maximum 200 members) &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class4" name="class" value="4"> &nbsp; &nbsp; <label for='class4'>Class 4 (maximum 1000 members) &nbsp; </label><br><br>
                <input required type="radio" id="class5" name="class" value="5"> &nbsp; &nbsp; <label for='class5'>Class 5 (unlimited members) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </label>
                <br><br>
                <input type="submit" value="Update" />
                
                </form>
                
                
                <%
                    }
                    
                    else if (board.getBoardClass() == 2)
                    
                    {
                    
                    %>
                
                    
                <form method="post" action="">
                <div><h3>Upgrade the board class.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="text" class="names" name="account-number" value="<%= accountNumber %>" hidden />
                
                
                <input required type="radio" id="class3" name="class" value="3"> &nbsp; &nbsp; <label for='class3'>Class 3 (maximum 200 members) &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class4" name="class" value="4"> &nbsp; &nbsp; <label for='class4'>Class 4 (maximum 1000 members) &nbsp; </label><br><br>
                <input required type="radio" id="class5" name="class" value="5"> &nbsp; &nbsp; <label for='class5'>Class 5 (unlimited members) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </label>
                <br><br>
                <input type="submit" value="Update" />
                
                </form>
                
                
                <%
                    }
                    
                    else if (board.getBoardClass() == 3)
                    
                    {
                    
                    %>
                
                    
                <form method="post" action="">
                <div><h3>Upgrade the board class.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="text" class="names" name="account-number" value="<%= accountNumber %>" hidden />
                
                
                <input required type="radio" id="class4" name="class" value="4"> &nbsp; &nbsp; <label for='class4'>Class 4 (maximum 1000 members) &nbsp; </label><br><br>
                <input required type="radio" id="class5" name="class" value="5"> &nbsp; &nbsp; <label for='class5'>Class 5 (unlimited members) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </label>
                <br><br>
                <input type="submit" value="Update" />
                
                </form>
                
                
                <%
                    }
                    
                    else if (board.getBoardClass() == 4)
                    
                    {
                    
                    %>
                    
                
                <form method="post" action="">
                <div><h3>Upgrade the board class.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="text" class="names" name="account-number" value="<%= accountNumber %>" hidden />
                
                
                <input required type="radio" id="class5" name="class" value="5"> &nbsp; &nbsp; <label for='class5'>Class 5 (unlimited members) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </label>
                <br><br>
                <input type="submit" value="Update" />
                
                </form>
                
                
                <%
                    
                    }
                    
                    %>
                
                
                
                <br><br><br>
                <form method="post" action="../DescriptionBoardUpdateServlet">
                <div><h3>Update the board description.</h3></div>
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <div>Board Description*:<br><br> <textarea required rows="10" cols="90" id="movie_description" style="font-family:sans-serif;" name="description" placeholder="Please write a short description."></textarea></div><br>
                
                <input type="submit" value="Update" />
                </form>
                
                
                
                <%
                    
                    if (board.getPublicityMode().equalsIgnoreCase("private"))
                    
                    {
                        
                    %>
                
                <br>
                
                
                    
                <form method="post" action="../PublicityBoardUpdateServlet">
                <div><h3>Change your board publicity level.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="radio" id="private" name="mode" value="private" checked/> &nbsp; &nbsp; 
                <label for='private'>Private &nbsp; &nbsp; (only you can see your board, and whomever you invite) </label><br><br>
                 <!--   Community <input required type="radio" id="gender" name="mode" value="community"><br><br> -->
                 <input required type="radio" id="public" name="mode" value="public"/> &nbsp; &nbsp; 
                 <label for='public'>Public &nbsp; &nbsp; &nbsp; (anyone on the site can see, search for, and enter your board) &nbsp; </label><br><br>
                <input type="submit" value="Update" />
                </form>
                
                
                <%
                    }
                    
                    else
                    
                    {
                    
                    %>
                    
                <br>
                
                
                
                <form method="post" action="../PublicityBoardUpdateServlet">
                <div><h3>Change your board publicity level.</h3></div>
                    
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                <input required type="radio" id="private" name="mode" value="private"/> &nbsp; &nbsp; 
                <label for='private'>Private &nbsp; &nbsp; (only you can see your board, and whomever you invite) </label><br><br>
                 <!--   Community <input required type="radio" id="gender" name="mode" value="community"><br><br> -->
                 <input required type="radio" id="public" name="mode" value="public" checked/> &nbsp; &nbsp; 
                 <label for='public'>Public &nbsp; &nbsp; &nbsp; (anyone on the site can see, search for, and enter your board) &nbsp; </label><br><br>
                <input type="submit" value="Update" />
                </form>
                
                
                <%
                    
                    }
                    
                    %>
                    
                    
                
                
                    
                
                <form hidden id="board-delete-form" method="post" action="../BoardDeleteServlet">
                <input required type="text" class="names" name="board-id" value="<%= boardID %>" hidden />
                </form>
                
                    
               </div>
                    
                    <br><br>
                    
                    <div id="delete-area">
                        <a id="delete-style" href="javascript:submitDeleteBoardForm();">
                            <i class="material-icons" style="font-size:38px;color:#F40">delete_forever</i>
                            <br><span>Delete board permanently</span>
                        </a>
                    </div>
                
            </div>
        
        </div>
                    
                    




</body>
</html>

