

<%@page import="account.boards.ServiceBoardsList"%>
<%-- 
    Document   : index
    Created on : 1-May-2016, 1:27:40 AM
    Author     : Ajiri Osauzo Jeffrey
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.*" %>
<%@page import="register.Register" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Chillonline | Create TV channel apps from YouTube</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<meta charset="utf-8" /> 
<meta name="keywords" content="Chillonline, chill online, courses, course management system, online courses, job boards, job postings, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
<meta name="description" content="With our platform, you can create new television channels for all our devices, using YouTube. The service streams all our channels to all our apps and docking stations on the market."/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="code.jquery.com_jquery-1.11.0.min.js"></script> 
<style type="text/css">
  
    
    
    
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

  nav ul li a:hover, nav ul li a:active
  {
    color: #e63;
    opacity: 1.0;
  }
  
  nav
  {
    margin-right: 0px;
    float: right;
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
  
  .createaccount
  {
      color: #FFF;
      width: 94%;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  .createaccount span
  {
      font-size: 12px;
  }
  
  #page
  {
      color: #f40;
  }
  
  
    
    
    
     @media only screen and (min-width: 300px) and (max-width: 999px) {
    
         
            

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
    height: 12.5px;
    color: #000;
    box-shadow: 0px 0.5px 1.2px #AAA;
    text-indent: 7.5px;
  }
  
  .head
  {
      width: 90%;
      height: 12.5px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0;
  }

  nav ul li a:link, nav ul li a:visited
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
    padding-top: 4.5px;
    padding-bottom: 4.5px;
    padding-left: 5px;
    padding-right: 5px;
    text-decoration: none;
    color: #fff;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 3px;
  }
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 4.25px;
      color: #fff;
      text-decoration: none;
      float: left;
  }
      
  .sept
  {
    background-color: #FFF;
    margin-right: 0;
    margin-top: 0;
    margin-left: 125px;
    height: 126.25px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 0.5px 1.2px #AAA;
  }
  
  #sept2
  {
    background-color: #EEE;
    background-image: url('image1.jpg');
    background-size: cover;
    margin-right: 0;
    margin-top: 0;
    margin-left: 30%;
    width: 70%;
    height: 125px;
    color: #000;
  }
  
  footer
  {
    background-color: #FFF;
    margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
    height: 75px;
    box-shadow: 0px 2px 5px #AAA;
    opacity: 0.7;
    margin-top: -50px;
    font-size: 3px;
  }
  
  .logos
  {
      background-color: #333;
      margin-left: 2.5px;
      margin-right: 2.5px;
      height: 50px;
      box-shadow: 0px 0.5px 1.2px #AAA;
      opacity: 0.8;
      margin-top: -125px;
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
   padding: 2px 6px;
   -webkit-border-radius: 1.2px;
   -moz-border-radius: 1.2px;
   border-radius: 1.2px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 4.25px;
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
   padding: 2px 6px;
   -webkit-border-radius: 1.2px;
   -moz-border-radius: 1.2px;
   border-radius: 1.2px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 4.25px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 1.2px;
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
   
   .createaccount h2
   {
       font-size: 6px;
   }
   
   .copyright h2
   {
       font-size: 6px;
   }
  
  .board-info h3
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .board-info h6
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .rimground
  {
    width: 25px;
    height: 37.5px;
    opacity: 1.0;
    margin-top: 1.2px;
    margin-bottom: 1.2px;
    margin-left: 1.2px;
    margin-right: 1.2px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 2.5px;
  }
    
  .bol
  {
      float: left;
      margin-top: 2.5px;
      margin-left: 0px;
      width: 37.5px;
  }
  
  #container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 17.5px;
      width: 90%;
      height: 425px;
  }

.moviediv
{
    margin: 6px auto 6px auto;
    height: 75px;
    background-color: #e63;
}

.seriediv
{
    margin: 6px auto 6px auto;
    height: 75px;
    background-color: #f50;
}

.grey
{
    margin: 6px auto 6px auto;
    height: 12.5px;
    background-color: #eee;
}

.musicdiv
{
    margin: 6px auto 6px auto;
    height: 75px;
    background-color: #e63;
}

.gamediv
{
    margin: 6px auto 6px auto;
    height: 75px;
    background-color: #e63;
}

  .divers
  {
      margin-left: 0;
      margin-right: 0;
      margin-top: 0;
      height: 125px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 125px;
      width: 30%;
      background-color: #f50;
      float: left;
  }
  
  .titles
  {
      width: 84%;
      height: 75px;
      margin-top: 5px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .names
  {
    width: 98%;
    height: 4.5px;
    margin: 0.2px auto 0.2px auto;
    border-radius: 1.2px;
    font-size: 3px;
  }
  
  #chills
  {
      height: 87.5px;
  }
  
  .boxes
  {
      width: 50px;
      height: 75px;
      margin-top: 5px;
      margin-left: 5px;
      background-color: #e45;
  }

.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 250px;
}

.click-agreement
{
    color: #fff;
    font-size: 2px;
}

.disclaimer
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 250px;
    font-size: 2px;
    text-decoration: none;
}

.footnotes
{
    float: left;
    font-size: 3px;
    height: 57.5px;
    width: 50px;
    text-align: left;
}
  
  .arch
  {
      width: 100%;
      height: 20px;
  }

  .counts
  {
      width: 20%;
      height: 50px;
      float: left;
      color: #fff;
      text-align: center;
  }
  
  .number
  {
      font-size: 22.5px;
      width: 100%;
      height: 100px;
  }
  
  .content-type
  {
      font-size: 5px;
      width: 100%;
      height: 12.5px;
  }
  
  .country-select
  {
      width: 99.5%;
      height: 7.5px;
      margin-top: 0.5px;
      margin-bottom: 0.5px;
      border-radius: 1px;
      color: #AAA;
      font-size: 3px;
  }
  
  #hook
  {
      color: #FFF;
      width: 100%;
      height: 37.5px;
      font-size: 17.5px;
      text-align: center;
      padding-top: 18.75px;
      padding-bottom: 9px;
  }
  
  #hook-descript
  {
      color: #FFF;
      width: 86%;
      height: 47.5px;
      font-size: 5px;
      text-align: left;
      padding-bottom: 12.5px;
      margin-left: 7%;
      margin-right: 7%;
  }
  
  .boards-division
  {
      margin: 6px auto 6px auto;
      height: 97.5px;
      background-color: #fff;
      border-top: 2.5px solid #f50;
      border-bottom: 2.5px solid #f50;
  }
  
  #popular-boards-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      width: 277.5px;
      height: 97.5px;
  }
  
.board
{
    background-color: #f50;
    width: 87.5px;
    height: 87.5px;
    box-shadow: 0 0.5px 1px #AAA;
    float: left;
    margin-left: 2.5px;
    margin-top: 5px;
}

.board h3
{
    margin-top: 2.5px;
    margin-bottom: 2.5px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board h6
{
    margin-top: 0px;
    margin-bottom: 2px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board span
{
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}
  
  .whitentext
  {
      color: #FFF;
      font-size: 3px;
  }
  
  .board-info
  {
      width: 92%;
      height: 37.5px;
      padding-top: 5px;
      padding-left: 4%;
      padding-right: 4%;
      padding-bottom: 1.2px;
  }
  
  .board-info h3
  {
      font-size: 4px;
  }
  
  .board-pic
  {
      background-image: url(../image1.jpg);
      background-size: cover;
      width: 87.5px;
      height: 50px;
  }
  
  #board-pic
  {
      background-image: url(../image1.jpg);
      background-size: cover;
      width: 87.5px;
      height: 50px;
  }
  
  #regyes
  {
      display: none;
  }
  
  #regno
  {
      display: block;
  }
  
         
         
    
     }
    
    
    
    
     @media only screen and (min-width: 1000px) and (max-width: 4000px) {
    
    

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

  nav ul li a:link, nav ul li a:visited
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
  
  #sept2
  {
    background-color: #EEE;
    background-image: url('image1.jpg');
    background-size: cover;
    margin-right: 0;
    margin-top: 0;
    margin-left: 30%;
    width: 70%;
    height: 500px;
    color: #000;
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
      height: 4820px;
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
    background-color: #f50;
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
      height: 500px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 500px;
      width: 30%;
      background-color: #f50;
      float: left;
  }
  
  .titles
  {
      width: 84%;
      height: 300px;
      margin-top: 20px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .names
  {
    width: 98%;
    height: 18px;
    margin: 2px auto 2px auto;
    border-radius: 5px;
    font-size: 12px;
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
  
  .arch
  {
      width: 100%;
      height: 80px;
  }

  .counts
  {
      width: 20%;
      height: 200px;
      float: left;
      color: #fff;
      text-align: center;
  }
  
  .number
  {
      font-size: 90px;
      width: 100%;
      height: 100px;
  }
  
  .content-type
  {
      font-size: 20px;
      width: 100%;
      height: 50px;
  }
  
  .country-select
  {
      width: 99.5%;
      height: 30px;
      margin-top: 2px;
      margin-bottom: 2px;
      border-radius: 5px;
      color: #AAA;
      font-size: 12px;
  }
  
  #hook
  {
      color: #FFF;
      width: 100%;
      height: 150px;
      font-size: 70px;
      text-align: center;
      padding-top: 75px;
      padding-bottom: 35px;
  }
  
  #hook-descript
  {
      color: #FFF;
      width: 86%;
      height: 190px;
      font-size: 25px;
      text-align: left;
      padding-bottom: 50px;
      margin-left: 7%;
      margin-right: 7%;
  }
  
  .boards-division
  {
      margin: 25px auto 25px auto;
      height: 3510px;
      background-color: #fff;
      border-top: 10px solid #f50;
      border-bottom: 10px solid #f50;
  }
  
  #popular-boards-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      width: 1110px;
      height: 3510px;
  }
  
.board
{
    background-color: #f50;
    width: 350px;
    height: 350px;
    box-shadow: 0 2px 5px #AAA;
    float: left;
    margin-left: 10px;
    margin-top: 20px;
}

.board h3
{
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board h6
{
    margin-top: 0px;
    margin-bottom: 7px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board span
{
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}
  
  .whitentext
  {
      color: #FFF;
      font-size: 12px;
  }
  
  .board-info
  {
      width: 92%;
      height: 150px;
      padding-top: 5px;
      padding-left: 4%;
      padding-right: 4%;
      padding-bottom: 5px;
  }
  
  .board-info h3
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .board-info h6
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .board-pic
  {
      background-image: url(../image1.jpg);
      background-size: cover;
      width: 350px;
      height: 200px;
  }
  
  #board-pic
  {
      background-image: url(../image1.jpg);
      background-size: cover;
      width: 350px;
      height: 200px;
  }
  
  #chills
  {
      height: 350px;
  }
  
  #regyes
  {
      display: block;
  }
  
  #regno
  {
      display: none;
  }
  
  
  
}
  
  
  
</style>

<script type="text/javascript">
  
  
  
  
  function validateForm(){
    var uname = document.forms["myForm"]["username"].value;
    var pass = document.forms["myForm"]["password"].value;

    if((!isEmpty(uname, "Log In")) && (!isEmpty(pass, "Password"))){

        return true;
    }else{
        return false;
    }
}

function isEmpty(elemValue, field){
    if((elemValue = "") || (elemValue = null)){
        alert("you can not have "+ field +" field empty");
        return true;
    }else{
        return false;
    }
}



    
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        


  
</script>

</head>

<body>
    
    
    <script>
        
        
        
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-100415008-1', 'auto');
            ga('send', 'pageview');
            
            
            
  
  function goToCarrierRegister()
  
    {
        document.getElementById("carrier-register-form").submit();
    }
    
    
            

    </script>
    
  
  <header>
      
    
      <div class="head">
        
          <a href="index.jsp"><img class="bol" src="chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a href="signin.jsp" >Sign In</a></li>
                    <li><a href="index.jsp" id="page" >Register</a></li>
                    <!--
                    <li><a href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="store.jsp" >Store</a></li>
                    <li><a href="packages.jsp" >Packages</a></li>
                    -->
                    <li><a href="videos/stream.jsp" >Featured</a></li>
                    <!--
                    <li><a href="videos/distribution.jsp" >Distribute</a></li>
                    -->
                    <li><a href="devices.jsp" >Devices</a></li>
                    <li><a href="programs.jsp" >Apps</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
    
    
    <%
        
        long programRequestNumber = 0;
        String programRequestDepartment = null;
        
        if (request.getParameter("program-request-number2") != null)
        
        {
            programRequestNumber = Long.parseLong(request.getParameter("program-request-number2"));
        }
        
        if (request.getParameter("program-request-department2") != null)
        
        {
            programRequestDepartment = request.getParameter("program-request-department2");
        }
        
        
        %>
    
    
    
    <div class="divers">
    <div class="right">
        
        
        <div id="regno">
            <br>
            <div class="createaccount"><h1>Register</h1></div>
            <div class="createaccount"><h1>online.</h1></div>
            
            <!-- Unable to solve a problem on your own? Why waste your time? Just register for Chillonline and invite someone you know to help you out! It's like ABC.  -->
            
        </div>
        
        
        <div id="regyes">
        
            <div class="createaccount"><h2>Create TV channel apps from YouTube</h2><span>With our platform, you can create channels for our devices.</span></div>
        
        <form name="myForm" onsubmit="return validateForm()" method="post" action="Register">
            <div class="titles">
                <input required type="text" name="firstname" class="names" id="first_name" placeholder="First Name*">
                <input required type="text" name="lastname" class="names" id="last_name" placeholder="Last Name*">
                
            <!--
            <select required class="country-select" id="organization" name="organization">
                <option value="">Field of study*</option>
                <option value="Aboriginal Business Studies">Aboriginal Business Studies</option>
                <option value="Aboriginal Governance">Aboriginal Governance</option>
                <option value="Accounting">Accounting</option>
                <option value="Actuarial Mathematics - Business">Actuarial Mathematics - Business</option>
                <option value="Actuarial Mathematics - Science">Actuarial Mathematics - Science</option>
                <option value="Agribusiness">Agribusiness</option>
                <option value="Agriculture">Agriculture </option>
                <option value="Agriculture Diploma">Agriculture Diploma</option>
                <option value="Agroecology">Agroecology</option>
                <option value="Agronomy">Agronomy</option>
                <option value="American Sign Language/English Interpretation">American Sign Language/English Interpretation</option>
                <option value="Animal Systems">Animal Systems</option>
                <option value="Anthropology">Anthropology</option>
                <option value="Applied Mathematics">Applied Mathematics</option>
                <option value="Architecture">Architecture (Masters)</option>
                <option value="Art">Art </option>
                <option value="Art History">Art History</option>
                <option value="Asian Studies">Asian Studies</option>
                <option value="Astronomy">Astronomy</option>
                <option value="Athletic Therapy">Athletic Therapy</option>
                <option value="Biochemistry">Biochemistry</option>
                <option value="Biological Sciences">Biological Sciences</option>
                <option value="Biosystems Engineering">Biosystems Engineering</option>
                <option value="Biotechnology">Biotechnology</option>
                <option value="Business">Business</option>
                <option value="Canadian Studies">Canadian Studies</option>
                <option value="Catholic Studies">Catholic Studies</option>
                <option value="Central and East European Studies">Central &amp; East European Studies</option>
                <option value="Ceramics">Ceramics</option>
                <option value="Chemistry">Chemistry</option>
                <option value="City Planning">City Planning (Masters)</option>
                <option value="Civil Engineering">Civil Engineering</option>
                <option value="Classical Studies">Classical Studies</option>
                <option value="Classics">Classics</option>
                <option value="Commerce">Commerce</option>
                <option value="Computer Engineering">Computer Engineering</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Cree">Cree</option>
                <option value="Criminology">Criminology</option>
                <option value="Dental Hygiene">Dental Hygiene</option>
                <option value="Dentistry">Dentistry</option>
                <option value="Pre-Dentistry">Pre-Dentistry</option>
                <option value="Drama">Drama</option>
                <option value="Drawing">Drawing</option>
                <option value="Economics">Economics</option>
                <option value="Education - Bachelor of Education">Education - Bachelor of Education </option>
                <option value="Education - Post Baccalaureate">Education - Post Baccalaureate</option>
                <option value="Electrical Engineering">Electrical Engineering</option>
                <option value="Engineering">Engineering </option>
                <option value="English">English</option>
                <option value="Entomology">Entomology</option>
                <option value="Entrepreneurship/Small Business">Entrepreneurship/Small Business</option>
                <option value="Environmental Design - Architecture">Environmental Design - Architecture</option>
                <option value="Environmental Science">Environmental Science</option>
                <option value="Environmental Studies">Environmental Studies</option>
                <option value="Family Social Sciences">Family Social Sciences</option>
                <option value="Film Studies">Film Studies</option>
                <option value="Finance">Finance</option>
                <option value="Fine Arts">Fine Arts </option>
                <option value="Food Science">Food Science</option>
                <option value="French">French</option>
                <option value="Genetics">Genetics</option>
                <option value="Geography">Geography</option>
                <option value="Geological Sciences">Geological Sciences</option>
                <option value="Geology">Geology</option>
                <option value="Geophysics">Geophysics</option>
                <option value="German">German</option>
                <option value="Global Political Economy">Global Political Economy</option>
                <option value="Graphic Design">Graphic Design</option>
                <option value="Greek">Greek</option>
                <option value="Health Sciences">Health Sciences</option>
                <option value="Health Studies">Health Studies</option>
                <option value="History">History</option>
                <option value="Human Nutritional Sciences">Human Nutritional Sciences</option>
                <option value="Human Resource Management / Industrial Relations">Human Resource Management / Industrial Relations</option>
                <option value="Icelandic">Icelandic</option>
                <option value="Interior Design">Interior Design (Masters)</option>
                <option value="International Business">International Business</option>
                <option value="Italian">Italian</option>
                <option value="Jazz Studies">Jazz Studies</option>
                <option value="Judaic Studies">Judaic Studies</option>
                <option value="Kinesiology">Kinesiology</option>
                <option value="Labour Studies">Labour Studies</option>
                <option value="Landscape Architecture (Masters)">Landscape Architecture (Masters)</option>
                <option value="Latin">Latin</option>
                <option value="Latin American Studies">Latin American Studies</option>
                <option value="Law">Law</option>
                <option value="Leadership and Organizations">Leadership and Organizations</option>
                <option value="Linguistics">Linguistics</option>
                <option value="Logistics and Supply Chain Management">Logistics and Supply Chain Management</option>
                <option value="Management">Management </option>
                <option value="Management Information Systems">Management Information Systems</option>
                <option value="Marketing">Marketing</option>
                <option value="Mathematics">Mathematics</option>
                <option value="Mechanical Engineering">Mechanical Engineering</option>
                <option value="Medicine">Medicine</option>
                <option value="Pre-Medicine">Pre-Medicine</option>
                <option value="Medieval and Renaissance Studies">Medieval and Renaissance Studies</option>
                <option value="Microbiology">Microbiology</option>
                <option value="Music">Music</option>
                <option value="Music Composition">Music Composition</option>
                <option value="Music Education">Music Education</option>
                <option value="Music History">Music History</option>
                <option value="Music Performance">Music Performance</option>
                <option value="Native Studies">Native Studies</option>
                <option value="Nursing">Nursing</option>
                <option value="Occupational Therapy (Masters)">Occupational Therapy (Masters)</option>
                <option value="Ojibway">Ojibway</option>
                <option value="Operations Management/Research">Operations Management/Research</option>
                <option value="Painting">Painting</option>
                <option value="Pharmacy">Pharmacy</option>
                <option value="Pre-Pharmacy">Pre-Pharmacy</option>
                <option value="Philosophy">Philosophy</option>
                <option value="Photography">Photography</option>
                <option value="Physical Education">Physical Education</option>
                <option value="Physical Geography">Physical Geography</option>
                <option value="Physical Therapy">Physical Therapy (Masters)</option>
                <option value="Physics">Physics</option>
                <option value="Plant Biotechnology">Plant Biotechnology</option>
                <option value="Polish">Polish</option>
                <option value="Political Studies">Political Studies</option>
                <option value="Pre-Dentistry">Pre-Dentistry</option>
                <option value="Pre-Medicine">Pre-Medicine</option>
                <option value="Pre-Pharmacy">Pre-Pharmacy</option>
                <option value="Pre-Veterinary Medicine">Pre-Veterinary Medicine </option>
                <option value="Print Media">Print Media</option>
                <option value="Psychology - Arts">Psychology - Arts</option>
                <option value="Psychology - Science">Psychology - Science</option>
                <option value="Recreation Management and Community Development">Recreation Management and Community Development</option>
                <option value="Religion">Religion</option>
                <option value="Respiratory Therapy">Respiratory Therapy</option>
                <option value="Russian">Russian</option>
                <option value="Science">Science</option>
                <option value="Sculpture">Sculpture</option>
                <option value="Social Work">Social Work</option>
                <option value="Sociology">Sociology</option>
                <option value="Soil Science">Soil Science</option>
                <option value="Spanish">Spanish</option>
                <option value="Statistics">Statistics</option>
                <option value="Textile Sciences">Textile Sciences</option>
                <option value="Theatre">Theatre</option>
                <option value="Ukrainian">Ukrainian</option>
                <option value="Ukrainian Canadian Heritage Studies">Ukrainian Canadian Heritage Studies</option>
                <option value="University 1">University 1</option>
                <option value="Video">Video</option>
                <option value="Women\'s and Gender Studies">Women's &amp; Gender Studies</option>
                <option value="Other">Other</option>
            </select>
                -->
            
                
                
                
                <input required type="text" name="city" class="names" id="city" placeholder="City*">
                <input required type="text" name="province" class="names" id="province" placeholder="Province or State*">
                
                
                 <input type="text" id="program-request-number" name="program-request-number" value="<%= programRequestNumber %>" hidden />
                 <input type="text" id="program-request-department" name="program-request-department" value="<%= programRequestDepartment %>" hidden />
                 
                 
            
            <select required class="country-select" name="country">
                <option value="">Select Country*</option>
                <option value="Canada">Canada</option>
                <option value="United States of America">United States of America</option>
                <option value="United Kingdom">United Kingdom</option>
                <option>--------------------------------</option>
                <option value="Afganistan">Afghanistan</option>
                <option value="Albania">Albania</option>
                <option value="Algeria">Algeria</option>
                <option value="American Samoa">American Samoa</option>
                <option value="Andorra">Andorra</option>
                <option value="Angola">Angola</option>
                <option value="Anguilla">Anguilla</option>
                <option value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</option>
                <option value="Argentina">Argentina</option>
                <option value="Armenia">Armenia</option>
                <option value="Aruba">Aruba</option>
                <option value="Australia">Australia</option>
                <option value="Austria">Austria</option>
                <option value="Azerbaijan">Azerbaijan</option>
                <option value="Bahamas">Bahamas</option>
                <option value="Bahrain">Bahrain</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="Barbados">Barbados</option>
                <option value="Belarus">Belarus</option>
                <option value="Belgium">Belgium</option>
                <option value="Belize">Belize</option>
                <option value="Benin">Benin</option>
                <option value="Bermuda">Bermuda</option>
                <option value="Bhutan">Bhutan</option>
                <option value="Bolivia">Bolivia</option>
                <option value="Bonaire">Bonaire</option>
                <option value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</option>
                <option value="Botswana">Botswana</option>
                <option value="Brazil">Brazil</option>
                <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                <option value="Brunei">Brunei</option>
                <option value="Bulgaria">Bulgaria</option>
                <option value="Burkina Faso">Burkina Faso</option>
                <option value="Burundi">Burundi</option>
                <option value="Cambodia">Cambodia</option>
                <option value="Cameroon">Cameroon</option>
                <option value="Canary Islands">Canary Islands</option>
                <option value="Cape Verde">Cape Verde</option>
                <option value="Cayman Islands">Cayman Islands</option>
                <option value="Central African Republic">Central African Republic</option>
                <option value="Chad">Chad</option>
                <option value="Channel Islands">Channel Islands</option>
                <option value="Chile">Chile</option>
                <option value="China">China</option>
                <option value="Christmas Island">Christmas Island</option>
                <option value="Cocos Island">Cocos Island</option>
                <option value="Colombia">Colombia</option>
                <option value="Comoros">Comoros</option>
                <option value="Congo">Congo</option>
                <option value="Cook Islands">Cook Islands</option>
                <option value="Costa Rica">Costa Rica</option>
                <option value="Cote DIvoire">Cote D'Ivoire</option>
                <option value="Croatia">Croatia</option>
                <option value="Cuba">Cuba</option>
                <option value="Curaco">Curacao</option>
                <option value="Cyprus">Cyprus</option>
                <option value="Czech Republic">Czech Republic</option>
                <option value="Denmark">Denmark</option>
                <option value="Djibouti">Djibouti</option>
                <option value="Dominica">Dominica</option>
                <option value="Dominican Republic">Dominican Republic</option>
                <option value="East Timor">East Timor</option>
                <option value="Ecuador">Ecuador</option>
                <option value="Egypt">Egypt</option>
                <option value="El Salvador">El Salvador</option>
                <option value="Equatorial Guinea">Equatorial Guinea</option>
                <option value="Eritrea">Eritrea</option>
                <option value="Estonia">Estonia</option>
                <option value="Ethiopia">Ethiopia</option>
                <option value="Falkland Islands">Falkland Islands</option>
                <option value="Faroe Islands">Faroe Islands</option>
                <option value="Fiji">Fiji</option>
                <option value="Finland">Finland</option>
                <option value="France">France</option>
                <option value="French Guiana">French Guiana</option>
                <option value="French Polynesia">French Polynesia</option>
                <option value="French Southern Ter">French Southern Ter</option>
                <option value="Gabon">Gabon</option>
                <option value="Gambia">Gambia</option>
                <option value="Georgia">Georgia</option>
                <option value="Germany">Germany</option>
                <option value="Ghana">Ghana</option>
                <option value="Gibraltar">Gibraltar</option>
                <option value="Great Britain">Great Britain</option>
                <option value="Greece">Greece</option>
                <option value="Greenland">Greenland</option>
                <option value="Grenada">Grenada</option>
                <option value="Guadeloupe">Guadeloupe</option>
                <option value="Guam">Guam</option>
                <option value="Guatemala">Guatemala</option>
                <option value="Guinea">Guinea</option>
                <option value="Guyana">Guyana</option>
                <option value="Haiti">Haiti</option>
                <option value="Hawaii">Hawaii</option>
                <option value="Honduras">Honduras</option>
                <option value="Hong Kong">Hong Kong</option>
                <option value="Hungary">Hungary</option>
                <option value="Iceland">Iceland</option>
                <option value="India">India</option>
                <option value="Indonesia">Indonesia</option>
                <option value="Iran">Iran</option>
                <option value="Iraq">Iraq</option>
                <option value="Ireland">Ireland</option>
                <option value="Isle of Man">Isle of Man</option>
                <option value="Israel">Israel</option>
                <option value="Italy">Italy</option>
                <option value="Jamaica">Jamaica</option>
                <option value="Japan">Japan</option>
                <option value="Jordan">Jordan</option>
                <option value="Kazakhstan">Kazakhstan</option>
                <option value="Kenya">Kenya</option>
                <option value="Kiribati">Kiribati</option>
                <option value="Korea North">Korea North</option>
                <option value="Korea Sout">Korea South</option>
                <option value="Kuwait">Kuwait</option>
                <option value="Kyrgyzstan">Kyrgyzstan</option>
                <option value="Laos">Laos</option>
                <option value="Latvia">Latvia</option>
                <option value="Lebanon">Lebanon</option>
                <option value="Lesotho">Lesotho</option>
                <option value="Liberia">Liberia</option>
                <option value="Libya">Libya</option>
                <option value="Liechtenstein">Liechtenstein</option>
                <option value="Lithuania">Lithuania</option>
                <option value="Luxembourg">Luxembourg</option>
                <option value="Macau">Macau</option>
                <option value="Macedonia">Macedonia</option>
                <option value="Madagascar">Madagascar</option>
                <option value="Malaysia">Malaysia</option>
                <option value="Malawi">Malawi</option>
                <option value="Maldives">Maldives</option>
                <option value="Mali">Mali</option>
                <option value="Malta">Malta</option>
                <option value="Marshall Islands">Marshall Islands</option>
                <option value="Martinique">Martinique</option>
                <option value="Mauritania">Mauritania</option>
                <option value="Mauritius">Mauritius</option>
                <option value="Mayotte">Mayotte</option>
                <option value="Mexico">Mexico</option>
                <option value="Midway Islands">Midway Islands</option>
                <option value="Moldova">Moldova</option>
                <option value="Monaco">Monaco</option>
                <option value="Mongolia">Mongolia</option>
                <option value="Montserrat">Montserrat</option>
                <option value="Morocco">Morocco</option>
                <option value="Mozambique">Mozambique</option>
                <option value="Myanmar">Myanmar</option>
                <option value="Nambia">Nambia</option>
                <option value="Nauru">Nauru</option>
                <option value="Nepal">Nepal</option>
                <option value="Netherland Antilles">Netherland Antilles</option>
                <option value="Netherlands">Netherlands (Holland, Europe)</option>
                <option value="Nevis">Nevis</option>
                <option value="New Caledonia">New Caledonia</option>
                <option value="New Zealand">New Zealand</option>
                <option value="Nicaragua">Nicaragua</option>
                <option value="Niger">Niger</option>
                <option value="Nigeria">Nigeria</option>
                <option value="Niue">Niue</option>
                <option value="Norfolk Island">Norfolk Island</option>
                <option value="Norway">Norway</option>
                <option value="Oman">Oman</option>
                <option value="Pakistan">Pakistan</option>
                <option value="Palau Island">Palau Island</option>
                <option value="Palestine">Palestine</option>
                <option value="Panama">Panama</option>
                <option value="Papua New Guinea">Papua New Guinea</option>
                <option value="Paraguay">Paraguay</option>
                <option value="Peru">Peru</option>
                <option value="Phillipines">Philippines</option>
                <option value="Pitcairn Island">Pitcairn Island</option>
                <option value="Poland">Poland</option>
                <option value="Portugal">Portugal</option>
                <option value="Puerto Rico">Puerto Rico</option>
                <option value="Qatar">Qatar</option>
                <option value="Republic of Montenegro">Republic of Montenegro</option>
                <option value="Republic of Serbia">Republic of Serbia</option>
                <option value="Reunion">Reunion</option>
                <option value="Romania">Romania</option>
                <option value="Russia">Russia</option>
                <option value="Rwanda">Rwanda</option>
                <option value="St Barthelemy">St Barthelemy</option>
                <option value="St Eustatius">St Eustatius</option>
                <option value="St Helena">St Helena</option>
                <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                <option value="St Lucia">St Lucia</option>
                <option value="St Maarten">St Maarten</option>
                <option value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</option>
                <option value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</option>
                <option value="Saipan">Saipan</option>
                <option value="Samoa">Samoa</option>
                <option value="Samoa American">Samoa American</option>
                <option value="San Marino">San Marino</option>
                <option value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</option>
                <option value="Saudi Arabia">Saudi Arabia</option>
                <option value="Senegal">Senegal</option>
                <option value="Serbia">Serbia</option>
                <option value="Seychelles">Seychelles</option>
                <option value="Sierra Leone">Sierra Leone</option>
                <option value="Singapore">Singapore</option>
                <option value="Slovakia">Slovakia</option>
                <option value="Slovenia">Slovenia</option>
                <option value="Solomon Islands">Solomon Islands</option>
                <option value="Somalia">Somalia</option>
                <option value="South Africa">South Africa</option>
                <option value="Spain">Spain</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="Sudan">Sudan</option>
                <option value="Suriname">Suriname</option>
                <option value="Swaziland">Swaziland</option>
                <option value="Sweden">Sweden</option>
                <option value="Switzerland">Switzerland</option>
                <option value="Syria">Syria</option>
                <option value="Tahiti">Tahiti</option>
                <option value="Taiwan">Taiwan</option>
                <option value="Tajikistan">Tajikistan</option>
                <option value="Tanzania">Tanzania</option>
                <option value="Thailand">Thailand</option>
                <option value="Togo">Togo</option>
                <option value="Tokelau">Tokelau</option>
                <option value="Tonga">Tonga</option>
                <option value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</option>
                <option value="Tunisia">Tunisia</option>
                <option value="Turkey">Turkey</option>
                <option value="Turkmenistan">Turkmenistan</option>
                <option value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</option>
                <option value="Tuvalu">Tuvalu</option>
                <option value="Uganda">Uganda</option>
                <option value="Ukraine">Ukraine</option>
                <option value="United Arab Erimates">United Arab Emirates</option>
                <option value="Uraguay">Uruguay</option>
                <option value="Uzbekistan">Uzbekistan</option>
                <option value="Vanuatu">Vanuatu</option>
                <option value="Vatican City State">Vatican City State</option>
                <option value="Venezuela">Venezuela</option>
                <option value="Vietnam">Vietnam</option>
                <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                <option value="Wake Island">Wake Island</option>
                <option value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</option>
                <option value="Yemen">Yemen</option>
                <option value="Zaire">Zaire</option>
                <option value="Zambia">Zambia</option>
                <option value="Zimbabwe">Zimbabwe</option>
            </select>
            
            
            <input required type="email" name="email" class="names" id="email_address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Email Address*">
            <input required type="password" name="password" class="names" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,12}" title="Must contain at least one number and one uppercase and lowercase letter, and 8 - 12 characters" placeholder="Password*">
            <input required type="password" name="confirmation" class="names" id="confirmation" placeholder="Confirmation*">
            <p class="click-agreement">A client's unique password must be 8 - 12 characters in length with at least <br>one uppercase letter, one lowercase letter, and one special-case character.</p>
            Male<input required type="radio" id="gender" name="gender" value="male"> &nbsp; &nbsp; 
            Female<input required type="radio" id="gender" name="gender" value="female">
            <p class="click-agreement"> By clicking "Register", you agree to our <a class="click-agreement" href="terms.jsp">terms of service</a> and <a class="click-agreement" href="privacy_policy.jsp">privacy policy</a>.</p>
            
            <button class="button2">Register</button>
            
            </div>
            
            
        </form>
                 
        </div>
                 
    </div>
    <div id="sept2">
        <div id="hook"> Join us in revolutionizing television.</div>
        <div id="hook-descript">
            
            With our platform, you can create new television channels for all our devices. In order to do so, just become a carrier. Register for a carrier account. 
            Launch your channels across all our mobile applications, web applications, and docking stations and reach a wide variety of clients.
            Or, create a client account and enjoy channels with other people you have met.
            
        </div>
    </div>
    
    </div>
    
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-74746182-2', 'auto');
        ga('send', 'pageview');

    </script>
        
        <script>
  
            var roller = $("#sept2");
            var backgrounds = ["url(image1.jpg)", "url(image2.jpg)", "url(image3.jpg)"];
            var current = 0;
            
            function nextBackground() 
            
            {
                current++;
                current = current % backgrounds.length;
                roller.css('background-image', backgrounds[current]);
            }
            
            setInterval(nextBackground, 3000);

            roller.css('background-image', backgrounds[0]);
  
        </script>
        
    
    
    
    <%
        
        MovieList movies = new MovieList();
        TVSeriesList series = new TVSeriesList();
        VideoList videos = new VideoList();
        MusicList music = new MusicList();
        TVChannelList tvChannels = new TVChannelList();
        RadioChannelList radioChannels = new RadioChannelList();
        GameList games = new GameList();
        
        
        
        %>
        
        
        <form hidden id="carrier-register-form" method="post" action="carriers/register.jsp">
            <input type="submit" value="Submit"/>
        </form>
    
  
    <div id="container">
        
        
        <div class="copyright"><h2><br>Create new TV channels for 35% subscriptions on our apps and docking stations.</h2>
            <button class="button2" onclick="goToCarrierRegister()">Register for a channel carrier account</button></div>
            <div class="seriediv">
                <div class="arch"></div>
                <div class="counts"><div class="number">0</div><div class="content-type">video <br> packages</div></div>
                <div class="counts"><div class="number">0</div><div class="content-type">movie <br> packages</div></div>
                <div class="counts"><div class="number">0</div><div class="content-type">TV series <br> packages</div></div>
                <div class="counts"><div class="number">0</div><div class="content-type">music <br> packages</div></div>
                <div class="counts"><div class="number">0</div><div class="content-type">TV channel <br> packages</div></div>
            </div>
            
            
        <div class="grey"></div>
        
        
        <div class="copyright"><h2><br>Discover boards currently streaming channels.</h2>
            <span><button class="button2">Below are some boards streaming channels. Register or sign in for more.</button></span></div>
            <div class="boards-division">
                
                <div id="popular-boards-container">
            


                        <%

                            long sessionAccountNumber = Long.parseLong("1315390090");
                            int count;

                            ServiceBoardsList popularBoards = new ServiceBoardsList(sessionAccountNumber);


                            %>





                        <%
                            
                            
                            for (count = 0; (count < popularBoards.length() && count < 27) && (popularBoards.getBoard(count) != null); count++)

                            {

                            %>

                <div class="board">

                        <div class="board-pic">

                                <%
                                    if (popularBoards.getBoard(count).getBoardPoster() != null) {

                                    %> 

                                    <img id="board-pic" src="<%= popularBoards.getBoard(count).getBoardPoster() %>" alt="wallpaper" title="<%= popularBoards.getBoard(count).getBoardName() %>" />

                                <%

                                    }

                                    else

                                    {

                                    %> 

                                    <img id="board-pic" src="https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/toronto.jpg" alt="wallpaper" title="<%= popularBoards.getBoard(count).getBoardName() %>" />

                                <%

                                    }

                                    %> 

                            </div>
                                    
                       <div class="board-info">
                    <h3><%= popularBoards.getBoard(count).getBoardName() %></h3>
                    <h6 class="whitentext">Training provided by <%= popularBoards.getBoard(count).getCreatorName() %></h6>
                    <span class="whitentext"><%= popularBoards.getBoard(count).getNumberOfMembers() %> Members</span> &nbsp; <span class="whitentext">200+ Tutorials</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
                        
                       </div>
                    </div>

                                <%

                                }

                                %>

                                

                </div>
                
            </div>
            
            
        <div class="grey"></div>
        
        
        <div class="copyright"><h2><br>Upload tutorial content, or distribute your entertainment content for 60%, or for free.</h2>
            <button class="button2">Register for a Distributor Account</button></div>
            <div class="seriediv">
                <div class="arch"></div>
                <div class="counts"><div class="number"><%= videos.length() %></div><div class="content-type">video <br> programs</div></div>
                <div class="counts"><div class="number"><%= movies.length() %></div><div class="content-type">movie <br> programs</div></div>
                <div class="counts"><div class="number"><%= series.length() %></div><div class="content-type">TV series <br> programs</div></div>
                <div class="counts"><div class="number"><%= music.length() %></div><div class="content-type">music <br> programs</div></div>
                <div class="counts"><div class="number"><%= tvChannels.length() %></div><div class="content-type">TV channel <br> programs</div></div>
            </div>
        
    </div>
  
  
            <audio autoplay hidden>
                <source src="welcome.mp3" type="audio/mpeg">
                Your browser does not support the audio tag.
            </audio>
            
            
            <img src="chills-light.png" alt="chills" id="chills"> 
  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href="distributors/channels/index.jsp"><p>TV</p></a>
          <a class="notes" href="distributors/sounds/index.jsp"><p>Radio</p></a>
          <a class="notes" href="distributors/series/index.jsp"><p>TV Series</p></a>
          <a class="notes" href="distributors/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="distributors/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="distributors/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="distributors/games/index.jsp"><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Carriers</h4>
          <a class="notes" href="carriers/channels/index.jsp"><p>TV</p></a>
          <a class="notes" href="carriers/sounds/index.jsp"><p>Radio</p></a>
          <a class="notes" href="carriers/series/index.jsp"><p>TV Series</p></a>
          <a class="notes" href="carriers/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="carriers/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="carriers/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="carriers/games/index.jsp"><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href="terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href="eula.jsp"><p>EULA</p></a>
          <a class="notes" href="distribution-agreement.jsp"><p>Distribution License Agreement</p></a>
      </div>
      <div class="footnotes"><h4>About</h4>
          <a class="notes" href=""><p>Chillonline</p></a>
          <a class="notes" href=""><p>Chill Technologies, Inc.</p></a>
          <a class="notes" href=""><p>Founders</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Support</p></a>
          <a class="notes" href=""><p>Inquisitor</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>Investment</p></a>
      </div>
        <hr>
        <p>"Chillonline helps people do work socially and more effortlessly." - <i>Mission Statement</i></p>
        <p>&copy; 2017. Chill Technologies, Inc. All Rights Reserved.</p>
    </div>
    
    
  </footer>

</body>
</html>
