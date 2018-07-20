<%-- 
    Document   : signin
    Created on : 6-Sep-2016, 11:46:46 AM
    Author     : El Jefe
--%>

<%@page import="account.boards.ServiceBoardsList"%>
<%@page import="account.boards.CompSciBoardsList"%>
<%@page import="account.AccountRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Sign In | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<meta charset="utf-8" /> 
<meta name="keywords" content="Chillonline, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
<meta name="description" content="Sign in to use Chillonline." />
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
      width: 84%;
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
  
  .signin
  {
      color: #FFF;
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
   
   .login-button
   {
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
   font-size: 4px;
   font-family: Sans-Serif;
   text-decoration: none;
   text-align: center;
   vertical-align: middle;
   margin-left: auto;
   margin-right: auto;
   margin-top: 1.2px;
   width: 98%;
   }
   
   .login-button:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.login-button:active {
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
    margin: 0.5px auto 0.5px auto;
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
    font-family: sans-serif;
    font-size: 12px;
  }

  nav ul li a:hover, nav ul li a:active
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
      text-align: center;
  }
      
  .sept
  {
    background-color: #FFF;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 455px;
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
   
   .login-button
   {
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
   text-align: center;
   vertical-align: middle;
   margin-left: auto;
   margin-right: auto;
   margin-top: 5px;
   width: 98%;
   }
   
   .login-button:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.login-button:active {
   border-top-color: #2c3d00;
   background: #2c3d00;
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
  
  .createaccount
  {
      color: #FFF;
      width: 84%;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
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
    height: 20px;
    padding: 4px;
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
  
  .overhead
  {
      height: 5px;
      width: 100%;
  }
  
  #page
  {
      color: #f40;
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
      font-size: 24px;
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
  
  
  
}
  
  
  
  
</style>

<script>
  
 
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
            
            

    </script>
    
  
  <header>
      
    
      <div class="head">
        
          <a href="index.jsp"><img class="bol" src="chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a href="signin.jsp" id="page" >Sign In</a></li>
                    <li><a href="index.jsp" >Register</a></li>
                    <!--
                    <li><a href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="store.jsp" >Store</a></li>
                    <li><a href="packages.jsp" >Packages</a></li>
                    -->
                    <li><a href="videos/stream.jsp" >Featured</a></li>
                    <li><a href="devices.jsp" >Devices</a></li>
                    <li><a href="programs.jsp" >Apps</a></li>
                    <!--
                    <li><a href="videos/distribution.jsp" >Distribute</a></li>
                    -->
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
    
    
    <%
        
        long programRequestNumber = 0;
        String programRequestDepartment = null;
        
        if (request.getParameter("program-request-number") != null)
        
        {
            programRequestNumber = Long.parseLong(request.getParameter("program-request-number"));
        }
        
        if (request.getParameter("program-request-department") != null)
        
        {
            programRequestDepartment = request.getParameter("program-request-department");
        }
        
        
        %>
        
    
    
        
        
    
    <div class="divers">
    <div class="right">
        
        <div class="overhead"><h2></h2></div>
        <div class="createaccount"><h2>TV channels from YouTube</h2><span>Love working or relaxing on Chillonline? <br>Share the news with your friends and 
                family members.</span></div>
        <div class="overhead"><h2></h2></div>
        
        <form method="post" action="Login" >
            <div class="titles">
            <input required type="email" class="names" style="width:94%" id="email_address" name="email" placeholder="Email Address">
            <input required type="password" class="names" style="width:94%" id="password" name="password" placeholder="Password">
            
            
            <p class="click-agreement"> <a class="signin" href="">Forgot Password?</a></p>
            
            <p class="click-agreement"> Don't yet have an account? <a class="signin" href="javascript:feedToAccount();">Register.</a></p>
             
            <button class="login-button">Sign In</button><br><br>
            
            <!--
            <p class="click-agreement"> Are you a content distributor? <a class="signin" href="distributors/signin.jsp">Sign into your distributor account.</a></p>
            
            <p class="click-agreement"> Are you a content carrier? <a class="signin" href="carriers/signin.jsp">Sign into your carrier account.</a></p>
            -->
            
            </div>
        </form>
    </div>
    <div id="sept2">
        <div id="hook"> Join us in revolutionizing television. </div>
        <div id="hook-descript">
            
            With our platform, you can create new television channels for all our devices. In order to do so, just become a carrier. Register for a carrier account. 
            Launch your channels across all our mobile applications, web applications, and docking stations and reach a wide variety of clients.
            Or, create a client account and enjoy channels with other people you have met.
            
        </div>
    </div>
        
        <script>
  
            var roller = $("#sept2");
            var backgrounds = ["url(image1.jpg)", "url(image2.jpg)", "url(image3.jpg)"];
            var current = 0;
            
            function nextBackground() {
                current++;
                current = current % backgrounds.length;
                roller.css('background-image', backgrounds[current]);
            }
            setInterval(nextBackground, 3000);

            roller.css('background-image', backgrounds[0]);
  
        </script>
        
    </div>
        
        
                
                <form id="feed-form" name="feed-form" method="post" action="register.jsp" hidden>
                    <input type="text" id="program-request-number" name="program-request-number2" value="<%= programRequestNumber %>" hidden />
                    <input type="text" id="program-request-department" name="program-request-department2" value="<%= programRequestDepartment %>" hidden />
                    <input type='button' class="checkout-button" value="Feed to My Account" />
                </form>
                    
        
    
    
    <%
        
        MovieList movies = new MovieList();
        TVSeriesList series = new TVSeriesList();
        VideoList videos = new VideoList();
        MusicList music = new MusicList();
        TVChannelList tvChannels = new TVChannelList();
        RadioChannelList radioChannels = new RadioChannelList();
        GameList games = new GameList();
        
        
        
        %>
    
  
    <div id="container">
        
        
        <div class="copyright"><h2><br>Create new TV channels for 35% subscriptions on our apps and docking stations.</h2>
            <button class="button2">Log into your channel carrier account</button></div>
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
            <button class="button2">Log into your Distributor Account</button></div>
            <div class="seriediv">
                <div class="arch"></div>
                <div class="counts"><div class="number"><%= videos.length() %></div><div class="content-type">video <br> programs</div></div>
                <div class="counts"><div class="number"><%= movies.length() %></div><div class="content-type">movie <br> programs</div></div>
                <div class="counts"><div class="number"><%= series.length() %></div><div class="content-type">TV series <br> programs</div></div>
                <div class="counts"><div class="number"><%= music.length() %></div><div class="content-type">music <br> programs</div></div>
                <div class="counts"><div class="number"><%= tvChannels.length() %></div><div class="content-type">TV channel <br> programs</div></div>
            </div>
        
    </div>
  
            
            
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                ga('create', 'UA-74746182-2', 'auto');
                ga('send', 'pageview');
                
                
                function feedToAccount()

                {
                    document.getElementById("feed-form").submit();
                }
                
                

            </script>
  
  
  
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
