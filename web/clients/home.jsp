<%-- 
    Document   : home
    Created on : 26-Oct-2016, 1:50:38 AM
    Author     : El Jefe
--%>

<%@page import="client.ClientRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="account.movie.*" %>
<%@page import="account.series.*" %>
<%@page import="account.video.*" %>
<%@page import="account.music.*" %>
<%@page import="account.connections.*" %>
<%@page import="account.requests.*" %>
<%@page import="controller.HomePictureUpload" %>
<%@page import="controller.HomeCoverUpload" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Home | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//cdn-images.mailchimp.com/embedcode/horizontal-slim-10_7.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
  @font-face {
    font-family: 'Pacifico'; /*a name to be used later*/
    src: url('Pacifico.ttf'); /*URL to font*/
  }
  
  #mc_embed_signup
  {
      background:#fff; 
      clear:left; 
      font:14px sans-serif; 
      width:100%;
      margin-bottom: 20px;
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
  
  #change-wall-paper-div
  {
      position: absolute;
      margin-top: 20px;
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
   
   .connection-invite-button 
   {
   border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   padding: 3px 10px;
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
   margin-left: 2px;
   margin-top: 2px;
   }
.connection-invite-button:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.connection-invite-button:active {
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
      min-height: 2700px;
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
    width: 300px;
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 10px;
    font-size: 15px;
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
    min-height: 2600px;
    margin-left: 1px;
}

#posts
{
    float: right;
    width: 35%;
    min-height: 2600px; 
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
    background: url(../male.jpg);
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
    background: url(../male.jpg);
    background-size: contain;
    border-radius: 100px;
}

#clientname
{
    height: 30px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    color: #fff;
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

#movies-area
{
    width: 100%;
    background-color: #fff;
    height: 1200px;
    margin-bottom: 10px;
}

#series-area
{
    width: 100%;
    background-color: #fff;
    height: 1200px;
    margin-bottom: 10px;
}

#videos-area
{
    width: 100%;
    background-color: #fff;
    height: 1200px;
    margin-bottom: 10px;
}

#music-area
{
    width: 100%;
    background-color: #fff;
    height: 1200px;
    margin-bottom: 10px;
}

.channels-area
{
    width: 100%;
    background-color: #fff;
    height: 200px;
    margin-bottom: 10px;
}

.sounds-area
{
    width: 100%;
    background-color: #fff;
    height: 200px;
    margin-bottom: 10px;
}

.games-area
{
    width: 100%;
    background-color: #fff;
    height: 200px;
    margin-bottom: 10px;
}
  
  #program-description-area
  {
      width: 96%;
      height: 20px;
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
    height: 450px;
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

.tvscreen
{
    background-color: #000;
    width: 770px;
    height: 433.125px;
    margin-bottom: 10px;
}

.hobbies
{
    margin-bottom: 10px;
    background-color: #fff;
    width: 100%;
    height: 700px;
    display: none;
}

.tvscreen-details
{
    margin-bottom: 10px;
    width: 100%;
    height: 100px;
    display: block;
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
  
  .product
  {
      width: 96%;
      height: 220px;
      margin-left: 2%;
      margin-right: 2%;
      margin-bottom: 40px;
      background-color: #fed;
  }
  
  .poster-title
  {
      color: #f40;
      font-size: 20px;
  }
  
  #product-poster-field
  {
      
  }
  
  #product-post-field
  {
      font-size: 11px;
      padding-left: 20px;
      margin-left: 130px;
      margin-right: 5px;
      color: #333;
  }
  
  #product-description
  {
      height: 105.5px;
      padding-top: 10px;
      padding-bottom: 10px;
  }
  
  #product-peppers-field
  {
      height: 20px;
      font-size: 12px;
      color: #333;
  }
  
  #product-country-field
  {
      height: 20px;
      color: #333;
      font-size: 12px;
  }
  
  #product-producer-field
  {
      height: 20px;
      color: #333;
      font-size: 12px;
  }
  
  #product-peppers
  {
      width: 80%;
  }
  
  #product-producer
  {
      width: 80%;
  }
  
  #product-country
  {
      width: 80%;
  }
  
  #product-attribute
  {
      font-weight: bold;
      width: 20%;
      float: left;
  }
  
  #post-field
    {
        margin: 25px auto 25px auto;
        width: 100%;
        height: 630px;
        background-color: #fff;
        float: none;
        padding: 5px 5px 5px 5px;
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
      height: 425px;
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

#movie-listing-area
{
    padding-top: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 1000px;
}

#movie-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 130px;
    height: 195px;
}

.movie-listing-container
{
    width: 130px;
    height: 225px;
    padding-top: 10px;
    margin-right: 10px;
    float: left;
}

#series-listing-area
{
    padding-top: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 1000px;
}

#series-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 130px;
    height: 195px;
}

.series-listing-container
{
    width: 130px;
    height: 225px;
    padding-top: 10px;
    margin-right: 10px;
    float: left;
}

#listing-title
{
    font-size: 12px;
    font-weight: bold;
    width: 100%;
    height: 20px;
    padding-top: 5px;
    padding-bottom: 5px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: #f40;
}

#video-listing-area
{
    padding-top: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 1000px;
}

#video-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 170px;
    height: 95.625px;
}

.video-listing-container
{
    width: 170px;
    height: 125.625px;
    padding-top: 9.375px;
    margin-right: 10px;
    float: left;
}

#music-listing-area
{
    padding-top: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 1000px;
}

#music-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 130px;
    height: 130px;
}

.music-listing-container
{
    width: 130px;
    height: 160px;
    padding-top: 10px;
    margin-right: 10px;
    float: left;
}

#movieteaser
{
    display: inline-block;
    width: 770px;
    height: 100%;
    vertical-align: middle;
}

#movieteaser-video
{
    display: inline-block;
    width: 770px;
    height: 100%;
    vertical-align: middle;
}

#movieteaser-movie
{
    display: inline-block;
    width: 770px;
    height: 100%;
    vertical-align: middle;
}

#movieteaser-series
{
    display: inline-block;
    width: 770px;
    height: 100%;
    vertical-align: middle;
}

#movieteaser-music
{
    display: inline-block;
    width: 770px;
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
  
  #hidden-connections
  {
      display: none;
  }
  
  #hidden-connections2
  {
      display: none;
  }
  
  #connection-invite-div
  {
      float: left;
      width: auto;
  }
  
  #connection-invite-button-div
  {
      float: left;
  }
  
  #connection-invite-email
  {
    height: 20px;
    padding: 4px;
    margin: 2px auto 2px auto;
    border-radius: 5px;
    font-size: 12px;
  }
  
  .connect-email-group
  {
      height: 50px;
      width: 205px;
      margin-left: auto;
      margin-right: auto;
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
        ClientRetrieve client = new ClientRetrieve(accountNumber);

        
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
  

            


function replay() 

{
    var myVideo = document.getElementById("movieteaser"); 
    myVideo.pause();
    myVideo.currentTime = 0;
    myVideo.play();

}

function playPause() 

{ 
    var myVideo = document.getElementById("movieteaser"); 
    
    if (myVideo.paused) 
        myVideo.play(); 
    else 
        myVideo.pause(); 
} 

function fullscreen()

{
    var myVideo = document.getElementById("movieteaser"); 
    myVideo.webkitEnterFullScreen();
    
}

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
    
    
    
    
    

  
</script>
        
    
    <div class="divers">
    <div class="right">
        <div id="profilepic">
            
            <div class="pic">
                
                <%

                if (client.getProfilePicture() != null) {

                    %>


                <img id="pic" src="<%= client.getProfilePicture() %>" alt="wallpaper" />


                <%

                }

                else

                {
                    if (client.getGender().equalsIgnoreCase("female")) {

                        %>


                    <img id="pic" src="../female.jpg" alt="wallpaper" />


                    <%

                    }

                    else

                    {

                        %>


                    <img id="pic" src="../male.jpg" alt="wallpaper" />


                    <%
                        
                    }

                }

                    %>
                
            </div>
                
        </div>
        <div id="clientname"><h3><%= client.getClientName() %></h3></div>
        <div id="address"><%= client.getCity() %>, <%= client.getProvince() %>, <%= client.getCountry() %></div> 
        <div id="phonenumber"><h3><%= client.getOrganization() %></h3></div>
        <div id="connect">
                
                        
                        
                        <form id="profile-picture-update-form" method="post" enctype="multipart/form-data" action="../HomePictureUpload">
                            
                            <input hidden type="text" name="account-number" value="<%= accountNumber %>"/>
                            <label for="profile-picture" class="subnav" title="Change profile picture"><i class="material-icons" style="font-size:40px;color:white">edit</i></label>
                            <input id="profile-picture" style="visibility:hidden;" type="file" name="profile-picture" onchange="updateProfilePicture()"/>
                            <input hidden type="submit" value="Submit"/>
                            
                        </form>
                        
            
        </div>
    </div>
    <div class="sept2">
        
        
        
        <div id="change-wall-paper-div" style="margin-left:10px">
            
                        <form id="wall-paper-update-form" method="post" enctype="multipart/form-data" action="../HomeCoverUpload">
                            
                            <input hidden type="text" name="account-number" value="<%= accountNumber %>"/>
                            <label for="wall-paper" class="subnav" title="Change wall paper"><i class="material-icons" style="font-size:45px;color:white">edit</i></label>
                            <input id="wall-paper" style="visibility:hidden;" type="file" name="wall-paper" onchange="updateWallPaper()"/>
                            <input hidden type="submit" value="Submit"/>
                            
                        </form>
                            
        </div>
                        
                        
                        
        <%
            
        if (client.getWallPaper() != null) {
            
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
                
                
                    
                    <%
                        
                        ConnectionList connections = new ConnectionList(accountNumber);
                        
                        
                        %>
                        
                        
                        
                
                <div class="connections-posts-label">Friends &nbsp; <i class="material-icons" style="font-size:48px;padding-top:10px;">group_add</i><hr></div>
                
                
                
                
                
                <div id="overview-area">
                    
                    <div id="album-area">
                        
                        
                        
                        <%
                        
                        int count;
                        
                        if (connections.length() <= 12) {
                            
                        
                        for (count = 0; (count < connections.length()) && (connections.getConnection(count) != null); count++)
                        
                        {
                        
                        
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionIDRequestForm(<%= connections.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (connections.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= connections.getConnection(count).getProfilePicture() %>" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (connections.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                <div id="listing-title"><%= connections.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                        
                            }
                            
                        }
                        
                        else if (connections.length() > 12) {
                            
                        
                        for (count = 0; (count < 12) && (connections.getConnection(count) != null); count++)
                        
                        {
                        
                        
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionIDRequestForm(<%= connections.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (connections.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= connections.getConnection(count).getProfilePicture() %>" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (connections.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                <div id="listing-title"><%= connections.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                        
                            }
                            
                        }
                        
                        
                        %>
                        
                        
                        
                        <div id="hidden-connections">
                            
                            <%
                        
                        if (connections.length() > 12) {
                            
                        
                            for (count = 12; (count < connections.length()) && (connections.getConnection(count) != null); count++)
                                
                            {
                                
                            
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionIDRequestForm(<%= connections.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (connections.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= connections.getConnection(count).getProfilePicture() %>" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (connections.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= connections.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                        
                                <div id="listing-title"><%= connections.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                        
                            }
                            
                        }
                        
                        %>
                            
                        </div>
                        
                        
                    
                </div>
                        
                        <%
                            
                        if (connections.length() <= 12) {
                        
                        
                        %>
                        
                    
                    <div id="connections-number">Connected to <%= connections.length() %> people</div>
                
                    
                        <%
                            
                        }
                        
                        else if (connections.length() > 12)
                        
                        {
                        
                        
                        %>
                        
                    
                    <a class="clickable-text" href="javascript:changeConnectionsAreaLength(<%= connections.getConnectionListingAreaLength() %>, <%= connections.getConnectionsAreaLength() %>);" ><div id="connections-number">Connected to <%= connections.length() %> people > <span id="connections-view-message">View All</span></div></a>
                
                    
                        <%
                            
                        }
                        
                        
                        %>
                    
                
                    
                    </div>
                        
                
                
                
                
                
                
                
                
                
                <form hidden id="connection-request-id-form" method="post" action="requests.jsp">
                    
                    <input type="text" id="connection-request-id" name="connection-request-id" />
                    <input type="submit" />
                    
                </form>
                
                
                    
                    <%
                        
                        ConnectionRequestList requests = new ConnectionRequestList(accountNumber);
                        
                        
                        %>
                
                
                <div class="posts-label">Requests &nbsp; <i class="material-icons" style="font-size:48px;padding-top:10px;">group_add</i><hr></div>
                
                
                <div id="overview2-area">
                    
                    <div id="album2-area">
                        
                        
                        
                        <%
                        
                        if (requests.length() <= 12) {
                            
                            for (count = 0; ((count < requests.length())) && (requests.getConnection(count) != null); count++)

                            {
                                
                        
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionRequestIDForm(<%= requests.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (requests.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= requests.getConnection(count).getProfilePicture() %>" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (requests.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                <div id="listing-title"><%= requests.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                            }
                        
                        }
                        
                        else if (requests.length() > 12) {
                            
                            for (count = 0; (count < 12) && (requests.getConnection(count) != null); count++)

                            {
                                
                        
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionRequestIDForm(<%= requests.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (requests.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= requests.getConnection(count).getProfilePicture() %>" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (requests.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                <div id="listing-title"><%= requests.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                            }
                        
                        }
                        
                        
                        %>
                        
                        
                        
                        <div id="hidden-connections2">
                            
                            <%
                        
                        if (requests.length() > 12) 
                        
                        {
                            
                            for (count = 12; (count < requests.length()) && (requests.getConnection(count) != null); count++)

                            {
                            
                        
                        
                        %>
                    
                        
                    
                        <a class="clickable-text" href="javascript:submitConnectionRequestIDForm(<%= requests.getConnection(count).getClientAccountNumber() %>);" >
                            <div class="picture-container">
                                
                                <div>
                                    
                                    <%
                                        
                                        if (requests.getConnection(count).getProfilePicture() != null) {
                                        
                                        %>
                                        
                                    
                                    <img id="picture" src="<%= requests.getConnection(count).getProfilePicture() %>" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                        
                                        }

                                        else
                                        
                                        {

                                            if (requests.getConnection(count).getGender().equalsIgnoreCase("female")) 

                                            {
                                            
                                            %>
                                            
                                            
                                            <img id="picture" src="../female.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                            
                                            <%

                                            }
                                            
                                            else
                                            
                                            {
                                        
                                        %>
                                        
                                        
                                            <img id="picture" src="../male.jpg" alt='<%= requests.getConnection(count).getClientName() %>'>
                                
                                    
                                    <%
                                            }
                                        
                                        }
                                        
                                        %>
                                    
                                </div>
                                        
                                <div id="listing-title"><%= requests.getConnection(count).getClientName() %></div>
                                
                            </div>
                        </a>
                        
                        
                        
                        <%
                            }
                        
                        }
                        
                        
                        %>
                            
                        </div>
                        
                        
                    
                    </div>
                        
                        <%
                            
                        if (requests.length() <= 12) {
                        
                        
                        %>
                        
                    
                    <div id="connections-number">Received <%= requests.length() %> connection requests</div>
                
                    
                        <%
                            
                        }
                        
                        else if (requests.length() > 12)
                        
                        {
                        
                        
                        %>
                        
                    
                    <a class="clickable-text" href="javascript:changeRequestsAreaLength(<%= requests.getRequestListingAreaLength() %>, <%= requests.getRequestsAreaLength() %>);" ><div id="connections-number">Received <%= requests.length() %> connection requests > <span id="requests-view-message">View All</span></div></a>
                
                    
                        <%
                            
                        }
                        
                        
                        %>
                    
                </div>
                
                <!--
                <div class="posts-label">Photos &nbsp; <i class="fa fa-file-photo-o" style="font-size:36px"></i><hr></div>
                
                
                <div id="overview-area">
                    
                    <div id="album-area">
                    
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    <div class="picture-container"><div id="picture"></div></div>
                    
                </div>
                    <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div id="connections-number">Archived 897 pictures to album > View all</div></a>
                </div>
                -->
                
                
            </div>
            
            <div id="content">
                
                
                    
                    <%
                        
                        MovieList movies = new MovieList(accountNumber);
                        TVSeriesList series = new TVSeriesList(accountNumber);
                        VideoList videos = new VideoList(accountNumber);
                        MusicList music = new MusicList(accountNumber);
                        
                        
                        %>
                        
                        
                
                <%
                    
                    long screenProgramID = 0;
                    String screenProgramIDRequest = null;
                    String screenProgramDepartment = null;
                    
                    if (request.getParameter("screen-programID") != null)
                    
                    {
                        screenProgramIDRequest = request.getParameter("screen-programID");
                        screenProgramID = Long.parseLong(screenProgramIDRequest);
                    }
                    
                    if (request.getParameter("screen-program-department") != null)
                    
                    {
                        screenProgramDepartment = request.getParameter("screen-program-department");
                    }
                    
                    
                    
                    %>
                
                
                    
                    <%
                        
                        if (screenProgramDepartment != null)
                        
                        {
                        
                        %>
                        
                        
                    
                    <%
                        
                        if (screenProgramDepartment.equalsIgnoreCase("movie"))
                        
                        {
                        
                        %>
                        
                        
                
                <div class="tvscreen">
                    
                    <video id="movieteaser" autoplay>
                            <source src="<%= movies.getMovie((int) screenProgramID).getMovieContent() %>" type="video/mp4">
                            Your browser does not support HTML5 video.
                    </video>
                    
                </div>
                
                <div class="tvscreen-details">
                    
                   <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area"></div>
                    <div class="distributor-name-area">
                        <div id="program-name"><%= movies.getMovie((int) screenProgramID).getMovieName() %></div>
                        <div id="distributor-name"><%= movies.getMovie((int) screenProgramID).getDistributor() %></div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= movies.getMovie((int) screenProgramID).getNumberOfPodcastFeeds() %> feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= movies.getMovie((int) screenProgramID).getNumberOfPodcastPeppers() %> peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= movies.getMovie((int) screenProgramID).getNumberOfPodcastShares() %> shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                </div>
                
            <div id="program-description-area"><%= movies.getMovie((int) screenProgramID).getDescription() %></div>
            
            
            
                
                    <%
                        
                        }
                        
                        else if (screenProgramDepartment.equalsIgnoreCase("series"))

                        {
                        
                        
                        %>
                        
                        
                
                <div class="tvscreen">
                    
                    
                    
                </div>
                
                <div class="tvscreen-details">
                    
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
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                </div>
                
            <div id="program-description-area">No description available.</div>
            
            
            
                
                    <%
                        
                        }
                        
                        else if (screenProgramDepartment.equalsIgnoreCase("video"))

                        {
                        
                        
                        %>
                        
                        
                
                <div class="tvscreen">
                    
                    <video id="movieteaser" autoplay>
                        <source src="<%= videos.getVideo((int) screenProgramID).getVideoContent() %>" type="video/mp4">
                            Your browser does not support HTML5 video.
                    </video>
                    
                </div>
                
                <div class="tvscreen-details">
                    
                   <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area"></div>
                    <div class="distributor-name-area">
                        <div id="program-name"><%= videos.getVideo((int) screenProgramID).getVideoName() %></div>
                        <div id="distributor-name"><%= videos.getVideo((int) screenProgramID).getDistributor() %></div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= videos.getVideo((int) screenProgramID).getNumberOfPodcastFeeds() %> feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= videos.getVideo((int) screenProgramID).getNumberOfPodcastPeppers() %> peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= videos.getVideo((int) screenProgramID).getNumberOfPodcastShares() %> shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                </div>
                
            <div id="program-description-area"><%= videos.getVideo((int) screenProgramID).getDescription() %></div>
            
            
            
                
                    <%
                        
                        }
                        
                        else if (screenProgramDepartment.equalsIgnoreCase("music"))

                        {
                        
                        
                        %>
                        
                        
                
                <div class="tvscreen">
                    
                    
                    
                </div>
                
                <div class="tvscreen-details">
                    
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
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                </div>
                
            <div id="program-description-area">No description available.</div>
            
            
            
                
                    <%
                        
                            }

                        }

                        else
                        
                        {
                        
                        %>
                        
                        
                
                <div class="tvscreen">
                    
                    
                    
                </div>
                
                <div class="tvscreen-details">
                    
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
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">0 shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                </div>
                
            <div id="program-description-area">No description available.</div>
            
            
            
                
                    <%
                        
                        }
                        
                        %>
            
            
            
            
            
            
            
            <form hidden id="screen-program-request-form" method="post" action="home.jsp#connect">
                
                <input type='text' id="screen-programID" name="screen-programID">
                <input type='text' id="screen-program-department" name="screen-program-department">
                
                <input type="submit">
            </form>
            
            
            
            
            
                
            <div id="movies-area">
                    
                    
                    <div class="section"><h2>Movies</h2></div>
                    
                    
                    
                    <div id="movie-listing-area">
                        
                        <iframe hidden src="" onload="changeMoviesAreaLength(<%= movies.getMovieListingAreaLength() %>, <%= movies.getMoviesAreaLength() %>)"></iframe>
                        
                        
                        <%
                        
                        
                        for (count = 0; (count < movies.length()) && (movies.getMovie(count) != null); count++)
                        
                        {
                        
                        
                        %>
                        
                        
                    
                        <div class="movie-listing-container">
                            <a class="clickable-text" href="javascript:submitScreenMovieRequestForm(<%= count %>);" >
                            <div>
                                <img id="movie-listing-poster" src="<%= movies.getMovie(count).getMoviePoster() %>" alt="agri" title="<%= movies.getMovie(count).getMovieName() %>">
                            </div>
                            </a>
                            <div id="listing-title"><%= movies.getMovie(count).getMovieName() %></div>
                        </div>
                        
                        
                        
                        <%
                        
                        }
                        
                        
                        %>
                        
                        
                        

                    </div>
                     
                    
                    <a class="clickable-text" href="javascript:changeMoviesAreaLength(<%= movies.getMovieListingAreaLength() %>, <%= movies.getMoviesAreaLength() %>);" ><div id="connections-number">Contains <%= movies.length() %> movie programs</div></a>
                    
                    
                </div>
                <div id="series-area">
                    
                    
                    <div class="section"><h2>Series</h2></div>
                    
                    
                    
                    <div id="series-listing-area">
                        
                        <iframe hidden src="" onload="changeSeriesAreaLength(<%= series.getTvSeriesListingAreaLength() %>, <%= series.getTvSeriesAreaLength() %>)"></iframe>
                        
                        
                        
                        <%
                        
                        
                        for (count = 0; (count < series.length()) && (series.getTVSeries(count) != null); count++)
                        
                        {
                        
                        
                        %>
                        
                        
                    
                        <div class="movie-listing-container">
                            <a class="clickable-text" href="javascript:submitScreenSeriesRequestForm(<%= count %>);" >
                            <div>
                                <img id="movie-listing-poster" src="<%= series.getTVSeries(count).getTvSeriesPoster() %>" alt="agri" title="<%= series.getTVSeries(count).getTvSeriesName() %>">
                            </div>
                            </a>
                            <div id="listing-title"><%= series.getTVSeries(count).getTvSeriesName() %></div>
                        </div>
                        
                        
                        
                        <%
                        
                        }
                        
                        
                        %>
                        
                        
                        

                    </div>
                    
                    
                    <a class="clickable-text" href="javascript:changeSeriesAreaLength(<%= series.getTvSeriesListingAreaLength() %>, <%= series.getTvSeriesAreaLength() %>);" ><div id="connections-number">Contains <%= series.length() %> TV series programs</div></a>
                    
                    
                </div>
                <div id="videos-area">
                    
                    <div class="section"><h2>Videos</h2></div>
                    
                    
                    <div id="video-listing-area">
                        
                        <iframe hidden src="" onload="changeVideosAreaLength(<%= videos.getVideoListingAreaLength() %>, <%= videos.getVideoAreaLength() %>)"></iframe>
                        
                        
                        
                        <%
                        
                        
                        for (count = 0; (count < videos.length()) && (videos.getVideo(count) != null); count++)
                        
                        {
                        
                        
                        %>
                        
                        
                        
                        <div class="video-listing-container">
                            <a class="clickable-text" href="javascript:submitScreenVideoRequestForm(<%= count %>);" >
                            <div>
                                <img id="video-listing-poster" src="<%= videos.getVideo(count).getVideoPoster() %>" alt="agri" title="<%= videos.getVideo(count).getVideoName() %>">
                            </div>
                            </a>
                            <div id="listing-title"><%= videos.getVideo(count).getVideoName() %></div>
                        </div>
                        
                        
                        
                        <%
                        
                        }
                        
                        
                        %>
                        
                        
                        
                      </div>
                    
                    
                    <a class="clickable-text" href="javascript:changeVideosAreaLength(<%= videos.getVideoListingAreaLength() %>, <%= videos.getVideoAreaLength() %>);" ><div id="connections-number">Contains <%= videos.length() %> video programs</div></a>
                    
                    
                </div>
                <div id="music-area">
                    
                    <div class="section"><h2>Music</h2></div>
                    
                    <div id="music-listing-area">
                        
                        <iframe hidden src="" onload="changeMusicAreaLength(<%= music.getMusicListingAreaLength() %>, <%= music.getMusicAreaLength() %>)"></iframe>
                        
                        
                        
                        <%
                        
                        
                        for (count = 0; (count < music.length()) && (music.getMusic(count) != null); count++)
                        
                        {
                        
                        
                        %>
                        
                        
                    
                        <div class="music-listing-container">
                            <a class="clickable-text" href="javascript:submitScreenMusicRequestForm(<%= count %>);" >
                            <div>
                                <img id="music-listing-poster" src="<%= music.getMusic(count).getMusicPoster() %>" alt="agri" title="<%= music.getMusic(count).getMusicName() %>">
                            </div>
                            </a>
                            <div id="listing-title"><%= music.getMusic(count).getMusicName() %></div>
                        </div>
                        
                        
                        
                        <%
                        
                        }
                        
                        
                        %>
                        
                        
                        
                        
                        
                    </div>
                    
                    
                    <a class="clickable-text" href="javascript:changeMusicAreaLength(<%= music.getMusicListingAreaLength() %>, <%= music.getMusicAreaLength() %>);" ><div id="connections-number">Contains <%= music.length() %> music programs</div></a>
                    
                    
                </div>
                <div class="channels-area">
                    
                    <div class="section"><h2>TV channels</h2></div>
                    
                        
                    
                    
                </div>
                <div class="sounds-area">
                    
                    <div class="section"><h2>Radio channels</h2></div>
                    
                        
                    
                    
                </div>
                <div class="games-area">
                    
                    <div class="section"><h2>Games</h2></div>
                    
                        
                    
                    
                </div>
                  
                    
                    
            </div>
        
        </div>
                    
                    




</body>
</html>

