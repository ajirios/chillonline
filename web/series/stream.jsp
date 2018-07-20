<%-- 
    Document   : stream
    Created on : 9-Jun-2017, 10:25:54 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="stream.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Chillonline&trade;</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<meta charset="utf-8" /> 
<meta name="keywords" content="Chillonline, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
<meta name="description" content="Explore and share TV shows with friends, family, and the world around you." />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
  

    @media only screen and (min-width: 100px) and (max-width: 4000px) {
    
    
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

  .nav ul li .a:link, .nav ul li .a:visited
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

  .nav ul li .a:hover, .nav ul li .a:active
  {
    color: #e63;
    opacity: 1.0;
  }
  
  .stream-navigation ul li .a:link, .stream-navigation ul li .a:visited
  {
    display: block;
    opacity: 1.0;
    text-align: right;
    padding-top: 13px;
    padding-bottom: 13px;
    padding-left: 20px;
    padding-right: 20px;
    text-decoration: none;
    color: #fff;
    font-family: sans-serif;
    font-size: 12px;
  }

  .stream-navigation ul li .a:hover, .stream-navigation ul li .a:active
  {
    color: #000;
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
    background-color: #c00;
    margin-right: 0;
    margin-top: 0;
    width: 70%;
    height: 200px;
    color: #000;
    float: right;
  }
  
  .nav
  {
    margin-right: 0px;
    float: right;
  }
  
  .stream-navigation
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
  
  .cb-div
  {
      width: 80%;
      height: 30px;
      margin-top: 20px;
      margin-right: auto;
      margin-left: auto;
  }
  
  .checkout-button
  {
      border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   padding-top: 6px;
   padding-bottom: 6px;
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
   vertical-align: middle;
   width: 100%;
  }
  
  .checkout-button:hover 
  {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
   
.checkout-button:active 
{
   border-top-color: #2c7d04;
   background: #2c7d04;
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
   margin-top: 0px;
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
      height: 1650px;
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
      height: 500px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 200px;
      width: 30%;
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
  
  #epic
  {
      margin-left: 0px;
  }
  
  .headtext
  {
      font-size: 25px;
      margin-top: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 500px;
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
  
  .nav ul li .a:hover ~#my-account
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
  
  .space
  {
      width: 100%;
      height: 50px;
  }
  
  .content-name
  {
      width: 96%;
      height: 50px;
      padding-left: 2%;
      padding-right: 2%;
  }
  
  .description
  {
      width: 96%;
      height: 250px;
      padding-left: 2%;
      padding-right: 2%;
  }
  
  .content-info
  {
      width: 96%;
      height: 100px;
      padding-left: 2%;
      padding-right: 2%;
  }

  .boards {
width: 83%;
margin-left: 5px;
margin-right: auto;
margin-top: 20px;
height: 400px;
padding: 0px 0px 10px 0px;
background-color: #fff;
/*box-shadow: 0px 2px 5px #aaa;*/
border-left: 200px solid #f50;
float: left;
}

.call {
font-size: 10px;
color: #444;
margin-left: 10px;
background-color: #fed;
}

.toll
{
    float: right;
    color: #e63;
    font-size: 25px;
}
    
  #distributor-logo
  {
      width: 50px;
      height: 50px;
      border-radius: 25px;
      background-size: contain;
  }

.stations
  {
      color: #f50;
      height: 150px;
      margin-top: 10px;
      margin-left: 0;
      margin-right: 0;
      background-color: #bbb;
  }
  
  .store-content
  {
      width: 79.5%;
      height: 3000px;
      border-top: 1px solid #AAA;
      border-bottom: 1px solid #AAA;
      border-right: 1px solid #AAA;
      float: left;
  }
  
  .store-selector
  {
      width: 20%;
      height: 3000px;
      background-color: #f50;
      color: #fff;
      border-bottom: 1px solid #AAA;
      float: left;
  }
  
  .hottest
  {
      width: 100%;
      height: 200px;
      background-color: none;
  }
  
  .product
  {
      background-color: #fff;
      width: 300px;
      height: 400px;
      margin-top: 10px;
      margin-left: 20px;
      margin-bottom: 10px;
      border-top: 3px solid #f50;
      border-bottom: 7px solid #f50;
      float: left;
  }
  
  .browsing
  {
      width: 96%;
      height: 50px;
      background-color: #ddd;
      margin-left: auto;
      margin-right: auto;
  }
  
  .browsing-place
  {
      width: 200px;
      height: 30px;
      margin-top: 10px;
      margin-left: 50px;
      margin-bottom: 10px;
      float: left;
  }
  
  .browsed
  {
      width: 100%;
      height: 2600px;
  }
  
  .poster
  {
      width: 300px;
      height: 170px;
      background-color: #ddd;
      text-align: center;
  }
  
  #product-poster
  {
      height: 168px;
      box-shadow: 0px 1px 4px #777;
      background-color: #FFF;
  }
  
  #product-poster2
  {
      height: 169px;
      box-shadow: 0 2px 2px #777;
  }
  
  #product-poster2:hover
  {
      height: 175px;
  }
  
  .definition
  {
      width: 90%;
      height: 55px;
      padding-left: 5%;
      padding-right: 5%;
      padding-top: 2.5px;
      padding-bottom: 2.5px;
      margin-top: 10px;
  }
  
  #definition-style
  {
      color: #f40;
      text-decoration: none;
  }
  
  .definition-style
  {
      color: #f40;
      text-decoration: none;
  }
  
  .distributor
  {
      width: 90%;
      height: 25px;
      padding-left: 5%;
      padding-right: 5%;
      padding-top: 2.5px;
      padding-bottom: 2.5px;
  }
  
  #distributor-style
  {
      color: #333;
      text-decoration: none;
      font-size: 11px;
  }
  
  .loves-n-seeds
  {
      width: 90%;
      height: 25px;
      padding-left: 5%;
      padding-right: 5%;
      padding-top: 2.5px;
      padding-bottom: 2.5px;
  }
  
  .loves-style
  {
      color: #333;
      text-decoration: none;
      font-size: 11px;
  }
  
  .commentaries
  {
      width: 90%;
      height: 25px;
      padding-left: 5%;
      padding-right: 5%;
      padding-top: 2.5px;
      padding-bottom: 2.5px;
  }
  
  .comme-style
  {
      color: #333;
      text-decoration: none;
      font-size: 11px;
  }
  
    .advert
  {
      width: 96%;
      height: 180px;
      background-image: url(suitelife.jpg);
      background-attachment: scroll;
      background-size: cover;
      background-repeat: no-repeat;
      margin-top: 10px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .post-media
  {
      margin-top: 15px;
  }  
  
  .announcement
  {
      width: 96%;
      height: 30px;
      color: #FFF;
      font-size: 20px;
      text-align: center;
      background-color: #f50;
      padding-top: 7px;
      padding-left: 20px;
      padding-right: 20px;
      padding-bottom: 13px;
      margin-top: 40px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
  }
  
  .noannouncement
  {
      width: 96%;
      height: 22px;
      color: #FFF;
      font-size: 20px;
      text-align: center;
      padding-top: 5px;
      padding-left: 2px;
      padding-right: 2px;
      padding-bottom: 5px;
      margin-top: 5px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
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
  margin: 0 0px 0 10px; /* Padding for other horizontal elements */
  width: 70%;
  float: left;
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #f50;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
  margin-top: 0px;
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
	width: 40px;
	height: 40px;
  padding: 0;
  border: none;
	margin-top: 5px; /* margin-top + border-width */
  margin-right: 5px; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 30px;
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
  .search-button
  {
      height: 30px;
      margin-top: 2px;
      border-bottom-right-radius: 15px;
      border-top-right-radius: 15px;
      border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 12px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
  }
  
  .search-dept
  {
      height: 30px;
      margin-top: 2px;
  }
  
  .skew
  {
      height: 40px;
      width: 70%;
      margin-left: auto;
      margin-right: auto;
  }
  
  .dept-nav
  {
    margin-left: 1%;
    margin-right: 1%;
    background-color: #fff;
  }
  
  .dept-nav-place
  {
      
  }

    .dept-nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin-left: 0px;
    margin-right: 0px;
  }

  .dept-nav ul li
  {
    width: 100%;
    margin-left: 0px;
    margin-right: 0px;
  }

  .dept-nav ul li a:link, .dept-nav ul li a:visited
  {
    display: block;
    background-color: #fff;
    text-align: left;
    padding-top: 7.5px;
    padding-bottom: 7.5px;
    padding-left: auto;
    padding-right: auto;
    margin-left: 0px;
    margin-right: 0px;
    text-decoration: none;
    color: #f40;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 16px;
  }

  .dept-nav ul li a:hover, .dept-nav ul li a:active
  {
    color: #f50;
    background-color: #eee;
    opacity: 1.0;
  }
  
  .dept-nav ul li a.current
  {
    color: #fff;
    background-color: #f50;
  }
  
  .checkout-information
  {
      width: 19%;
      height: 3900px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-content
  {
      width: 60%;
      height: 3900px;
      margin-left: 0.5%;
      margin-right: 0.5%;
      float: left;
  }
  
  .checkout-processor
  {
      width: 19%;
      height: 3900px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-space
  {
      width: 100%;
      height: 10px;
  }
  
  .cover-poster
  {
      width: 96%;
      box-shadow: 0 1px 4px #777;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 4px;
      padding-top: 4px;
  }
  
  .product-id
  {
      font-size: 15px;
      width: 96%;
      height: 40px;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 2%;
      margin-right: 2%;
      font-weight: bold;
  }
  
  .product-description
  {
      font-size: 13px;
      color: #555;
      margin-left: 5%;
      margin-right: 5%;
  }
  
  .episodes
  {
      font-size: 11px;
      color: #555;
      margin-left: 5%;
      margin-right: 5%;
      text-decoration: none;
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
  
  .content-comments
  {
      width: 100%;
      height: 2500px;
      background-color: #fff;
      margin-top: 10px;
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
  
  #program-description-area
  {
      width: 96%;
      height: 250px;
      padding-top: 25px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 25px;
      background-color: #FFF;
      font-size: 12px;
      white-space: pre-line;
  }
  
  .views2
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 20px;
  }
  
  .post
  {
      width: 96%;
      height: 620px;
      margin-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      margin-bottom: 10px;
  }
  
  .post-collapsed
  {
      width: 96%;
      height: 280px;
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
      height: 300px;
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
      height: 100px;
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
      width: 100%;
      height: 30px;
      font-size: 13px;
      color: #f40;
      background-color: #fed;
      margin-bottom: 2px;
  }
  
  .distributor2
  {
      color: #f40;
  }
  
  #like-button
  {
      width: 20%;
      height: 30px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
      margin-top: 1px;
  }
  
  #reply-button
  {
      width: auto;
      height: 30px;
      float: left;
      margin-top: 1px;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  .written
  {
      height: 20px;
      width: 85%;
      padding-top: 5px;
      margin-left: 13%;
      margin-right: 2%;
  }
  
  #checkout_form
  {
      display: none;
  }
  
  #movie-transact
  {
      display: block;
  }
  
  #music-transact
  {
      display: block;
  }
  
  #video-transact
  {
      display: block;
  }
  
  #series-transact
  {
      display: block;
  }
  
  #tv-transact
  {
      display: block;
  }
  
  #radio-transact
  {
      display: block;
  }
  
  #game-transact
  {
      display: block;
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
      font-weight: bold;
  }
  
  #page
  {
      color: #f40;
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
  
  #movieteaser
  {
      display: inline-block;
      height: 100%;
      vertical-align: middle;
  }
  
  #number-of-peppers
  {
      color: #333;
      font-size: 12px;
      font-weight: bold;
  }
  
  .pre-subheader
  {
      height: 40px;
      width: 100%;
      background-color: #f40;
      margin-top: 0;
  }

  .subheader
  {
      margin-top: 1px;
      height: 34px;
      margin-left: 0;
      margin-right: 0;
      background-color: #f50;
  }
  
  #subpage
  {
      color: #000;
  }
  
  
  
  }
  
  
  
  @media only screen and (min-width: 1200px) {
    
  .store
  {
      width: 1200px;
      height: 3900px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
  }
  
  .blackscreen
  {
      width: 720px;
      height: 405px;
      background-color: #000;
      text-align: center; 
  }
  
  .mini-blackscreen
  {
      width: 206px;
      height: 116px;
      background-color: #000;
      border-top: 3px solid #f40;
      border-bottom: 3px solid #f40;
  }
  
  #podcast-side
  {
      display: inline-block;
      width: 206px;
      height: 100%;
      vertical-align: middle;
  }
  
  .episode
  {
      width: 100%;
      height: 200px;
      background-color: #fff;
      margin-bottom: 5px;
  }
  
  .checkout-poster
  {
      width: 206px;
      height: 400px;
      margin-left: auto;
      margin-right: auto;
  }
  
  
  
  
  
    } /* end of responsivity for at most 2000px */
    
    
     
    @media only screen and (min-width: 1500px) and (max-width: 4000px) {
    
  .store
  {
      width: 1600px;
      height: 3900px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
  }
  
  .blackscreen
  {
      width: 960px;
      height: 540px;
      background-color: #000;
      text-align: center; 
  }
  
  .mini-blackscreen
  {
      width: 274.5px;
      height: 154.5px;
      background-color: #000;
  }
  
  #podcast-side
  {
      display: inline-block;
      width: 274.5px;
      height: 100%;
      vertical-align: middle;
  }
  
  .episode
  {
      width: 100%;
      height: 238.5px;
      background-color: #fff;
      margin-bottom: 5px;
  }
  
  .checkout-poster
  {
      width: 274.5px;
      height: 533px;
      margin-left: auto;
      margin-right: auto;
  }
  
  
        
        
    } /* end of responsivity for at least 2001px */
    
    
    
    
    @media only screen and (min-width: 1700px) and (max-width: 4000px) {
    
  .store
  {
      width: 1800px;
      height: 3900px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
  }
  
  .blackscreen
  {
      width: 1080px;
      height: 607.5px;
      background-color: #000;
      text-align: center; 
  }
  
  .mini-blackscreen
  {
      width: 309px;
      height: 173.8px;
      background-color: #000;
  }
  
  #podcast-side
  {
      display: inline-block;
      width: 309px;
      height: 100%;
      vertical-align: middle;
  }
  
  .episode
  {
      width: 100%;
      height: 257.8px;
      background-color: #fff;
      margin-bottom: 5px;
  }
  
  .checkout-poster
  {
      width: 309px;
      height: 600px;
      margin-left: auto;
      margin-right: auto;
  }
  
  
        
        
    } /* end of responsivity for at least 2001px */
    
    
    
    
    

  
</style>



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
        
          <a href="../index.jsp"><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav class="nav">
                
                <ul>
                    <li><a class="a" href="../signin.jsp" >Sign In</a></li>
                    <li><a class="a" href="../index.jsp" >Register</a></li>
                    <!--
                    <li><a class="a" href="../giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../store.jsp" >Store</a></li>
                    <li><a class="a" href="../packages.jsp" >Packages</a></li>
                    -->
                    <li><a class="a" href="../videos/stream.jsp" id="page" >Featured</a></li>
                    <li><a class="a" href="../devices.jsp" >Devices</a></li>
                    <li><a class="a" href="../programs.jsp" >Apps</a></li>
                    <!--
                    <li><a class="a" href="../distribute.jsp" >Distribute</a></li>
                    -->
                </ul>
                    
            </nav>
        
      </div>
      
      <div class="pre-subheader">
          
          <nav class="stream-navigation">
                
                <ul>
                    <li><a class="a" href="../games/stream.jsp" >Games</a></li>
                    <li><a class="a" href="../sounds/stream.jsp" >Radio</a></li>
                    <li><a class="a" href="../channels/stream.jsp" >TV</a></li>
                    <li><a class="a" href="../music/stream.jsp" >Music</a></li>
                    <li><a class="a" href="../series/stream.jsp" id="subpage" >TV Series</a></li>
                    <li><a class="a" href="../movies/stream.jsp" >Movies</a></li>
                    <li><a class="a" href="../videos/stream.jsp" >Videos</a></li>
                </ul>
                    
            </nav>
          
      </div>
      
      
      <%
                String episodeRequestNumber = null;
                int episodeNumber = 1;
                String pageRequestNumber = null;
                long pageNumber;
                
                if (request.getParameter("page-request-number") == null)
                
                {
                    pageRequestNumber = "1";
                    //pageNumber = 1;
                    
                    if (request.getParameter("search-name") != null)

                    {

                        TVSeriesStream instantiator = new TVSeriesStream();
                        pageNumber = instantiator.search(request.getParameter("search-name"));
                        
                    }
                    
                    else
                        
                    {
                        TVSeriesStream instantiator = new TVSeriesStream();
                        pageNumber = instantiator.getRandomProgramID(0);
                    }
                    
                }
                
                else 

                {
                    pageRequestNumber = request.getParameter("page-request-number");
                    pageNumber = Long.parseLong(pageRequestNumber);
                    
                    if (request.getParameter("episode-order-request-number") != null)
                        
                    {
                        episodeRequestNumber = request.getParameter("episode-order-request-number");
                        episodeNumber = Integer.parseInt(episodeRequestNumber);
                    }
                    
                }
                
                
                %>
      
    
      <div class="subheader">
          
          <div class="skew">
          
          <form class="flexsearch--form" method="post" action="stream.jsp">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" name="search-name" placeholder="Content Search">
				</div>
			
			
		</div>
              </div>
              
              
              <select name="department" class="search-dept">
                <option disabled value="all">in All Departments</option>
                <option disabled value="tv">in TV</option>
                <option disabled value="radio">in Radio</option>
                <option disabled value="videos">in Videos</option>
                <option disabled value="movies">in Movies</option>
                <option value="series">in Series</option>
                <option disabled value="music">in Music</option>
                <option disabled value="games">in Games</option>
              </select>
              <input type="submit" value="Search" class="search-button">
         </form>
          
      </div>
      </div>
  </header>
    
        
       <div class="noannouncement"></div>
       <div class="announcement">Want to connect with the online community? Just sign in and relax. 
           <button class="button2" onclick="window.location.href='../signin.jsp'">Sign in</button> or
           <button class="button2" onclick="window.location.href='../index.jsp'">Register</button>.
       </div> 
    
            
            
            
                        
                      
            
            <%
                    
                    TVSeriesStream series = new TVSeriesStream(pageNumber);
                    
                    
                    
                    %>
                    
                    
          
        
            
            <div id="page-request-form-div" hidden>
                
                <form id="page-request-form" method="post" action="stream.jsp" hidden>
                    
                    <input type="text" id="page-request-number" name="page-request-number" value="<%= pageRequestNumber %>" />
                    <input type="submit" id="page-request-number-submit" />
                    
                </form>
                
            </div>  
          
        
            
            <div id="episode-order-request-form-div" hidden>
                
                <form id="episode-order-request-form" method="post" action="stream.jsp" hidden>
                    
                    <input type="text" id="episode-order-request-number" name="episode-order-request-number" value="<%= episodeRequestNumber %>" />
                    <input type="text" id="page-request-number2" name="page-request-number" value="<%= pageRequestNumber %>" />
                    <input type="submit" id="episode-order-request-number-submit" />
                    
                </form>
                
            </div>
                    
                    
                    
                    
                    
        <div class="store">
    
    
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
    
    
    
           
           
                      
                        
                        
                        
        
        <div class="checkout-processor">
            
            
            <div class="checkout-space"></div>
            <div class="episodes">
                             
            
            <%
                
                int count;
                
                if (series.getTvSeries().getEpisodeList().getSize() <= 0) {
                
                for (count = 0; count < 12; count++)
                
                {
                
                %>
                
                <a class="clickable-text" href="" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                        
                    
                    
                </span>
                    </div>
                  <div class="title"></div>
                  <div class="views"></div>
                  <div class="views"></div>
                    </div></a>
                
                             
            
            <%
                
                }
                
            }

            else if (series.getTvSeries().getEpisodeList().getSize() > 0) {
                
                for (count = episodeNumber - 1; (count < episodeNumber + 11) && (count < series.getTvSeries().getEpisodeList().getSize()); count++)
                
                {
                
                
                
                %>
                
                <a class="clickable-text" href="javascript:transferEpisodeByOrder(<%= series.getTvSeries().getEpisodeList().getEpisode(count).getOrder() %>, <%= pageNumber %>);" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                    
                    <img id="podcast-side" src="<%= series.getTvSeries().getEpisodeList().getEpisode(count).getThumbnail() %>" alt="poster" />
                           
                </span>
                    </div>
                  <div class="title"><%= series.getTvSeries().getEpisodeList().getEpisode(count).getEpisodeName() %></div>
                  <div class="views"><%= series.getProgramDistributorName() %></div>
                  <div class="views"><%= series.getTvSeries().getEpisodeList().getEpisode(count).getNumberOfPodcastFeeds() %> feeds</div>
                    </div></a>
                
                             
            
            <%
                
                }
                
            }

                            %>
               
                
            </div>
            <div class=""></div>
            <div class="checkout-space"></div>
            
            
            
        </div>
                        
        
        
        <div class="checkout-content">
            
            <div class=""></div>
            <div class="blackscreen">
                
                <%  

                if (series.getTvSeries().getEpisodeList().getSize() > 0) {
                
                %>
                
                <span class="helper">
                <video id="movieteaser" autoplay>
                            <source src="<%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getPodcast() %>" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                            
                            <%  

                    }
                
                %>
                            
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    
                <%  

                if (series.getTvSeries().getEpisodeList().getSize() > 0) {
                
                %>
                    
                <div class="distributor-logo-area">
                        
                                                        <%
                                                            
                                    if (series.getProgramDistributorPicture() != null) {

                                        %>
                        
                        <img id="distributor-logo" src="<%= series.getProgramDistributorPicture() %>" alt="distributor-logo" />
                        
                                                        <%

                                    }
                                    
                                        %>
                    
                </div>
                    <div class="distributor-name-area">
                        <div id="program-name"><%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getEpisodeName() %></div>
                        <div id="distributor-name">Distributed by <%= series.getProgramDistributorName() %> | &COPY; <%= series.getProducer() %>, <%= series.getProductionCountry() %></div>
                    </div>
                    
                          
                            <%  

                    }
                
                %>
                
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    
                    
                    
                <%  

                if (series.getTvSeries().getEpisodeList().getSize() > 0) {
                
                %>
                
                
                    
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getNumberOfPodcastFeeds() %> feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getNumberOfPodcastPeppers() %> peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers"><%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getNumberOfPodcastShares() %> shares</span>
                
                    
                          
                            <%  

                    }
                
                %>
                    
                    
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                    
                    
            <div id="program-description-area"><%= series.getProgramDescription() %></div>
            
            
            
            
            <div class="content-comments">
                
                <div class="commentaries"><span>COMMENTARIES</span></div>
                <hr><br>
                
                
                
            </div>
            
        </div>
        
        
                        
                                     
                        
        <div class="checkout-information">
            
            <div class="checkout-space"></div>
            <div class="product-id">
                <span class="">Current Content Streaming</span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-poster">
                
                  
                
                
                <img src="<%= series.getProgramPoster() %>" alt='Cover poster' class="cover-poster" />
                
                
                
                  <div class="title"><%= series.getProgramName() %></div>
                  <div class="views"><%= series.getProgramDistributorName() %></div>
                  <div class="views">0 feeds</div>
                  
                
                
            </div>
            
            <div id="movie-transact">
            <div class="cb-div">
                
                <form id="feed-form" name="feed-form" method="post" action="../signin.jsp">
                    <input type="text" id="program-request-number" name="program-request-number" value="<%= pageRequestNumber %>" hidden />
                    <input type="text" id="program-request-department" name="program-request-department" value="series" hidden />
                    <input type='button' class="checkout-button" onclick="feedToAccount()" value="Feed Content to My Account" />
                </form>
             
            </div>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <hr>
            
            
            
            <div class="product-id">
                <span class="">Similar Content Streaming</span>
            </div>
            <div class="checkout-space"></div>
            
            
            <%
                        
                        count = 0;
                        
                        for (count = 0; (count < 6) && (series.getTVSeries(count) != null); count++) {
                            
                            
                        
                        %>
            
            
            <div class="checkout-poster">
                
                
                <a class="clickable-text" href="javascript:transferSeriesByID(<%= series.getTVSeries(count).getTvSeriesID() %>);" ><div class="episode">
                  
                
                
                <img src="<%= series.getTVSeries(count).getTvSeriesPoster() %>" alt='Cover poster' class="cover-poster" />
                
                
                
                  <div class="title"><%= series.getTVSeries(count).getTvSeriesName() %></div>
                  <div class="views"><%= series.getTVSeries(count).getDistributor() %></div>
                  <div class="views">0 feeds</div>
                    </div>
                </a>
                
                
            </div>
            
            
                        <%
                            
                            }

                            %>
            
            
            
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

function transferSeriesByID(seriesID)

{
    packageID = seriesID;
    type = "series";
    
    if (seriesID > 0)
        
    {
        document.getElementById("page-request-number").value = seriesID;
        document.getElementById("page-request-form").submit();
    }
    
}

function transferVideoByID(videoID, transaction)

{
    packageID = videoID;
    type = "video";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
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

function feedToAccount()

{
        document.getElementById("feed-form").submit();
}

function transferEpisodeByOrder(episodeOrder, seriesID)

{
    type = "series";
    
    if ((episodeOrder > 0) && (seriesID > 0))
        
    {
        document.getElementById("episode-order-request-number").value = episodeOrder;
        document.getElementById("page-request-number2").value = seriesID;
        document.getElementById("episode-order-request-form").submit();
    }
    
}




    
    
</script>
            
            
            
        
        
    </div>

  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href="../distributors/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="../distributors/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="../distributors/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="../distributors/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="../distributors/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="../distributors/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="../distributors/games/index.jsp"><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Carriers</h4>
          <a class="notes" href="../carriers/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="../carriers/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="../carriers/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="../carriers/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="../carriers/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="../carriers/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="../carriers/games/index.jsp"><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href="../terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="../privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href=""><p>Cookie Policy</p></a>
          <a class="notes" href="../refund-policy.jsp"><p>Refund Policy</p></a>
          <a class="notes" href=""><p>Licenses</p></a>
      </div>
      <div class="footnotes"><h4>About</h4>
          <a class="notes" href=""><p>Founder</p></a>
          <a class="notes" href=""><p>Investors</p></a>
          <a class="notes" href=""><p>Mission</p></a>
          <a class="notes" href=""><p>Vendors</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Head Office</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>Phone</p></a>
          <a class="notes" href=""><p>Email</p></a>
      </div>
        <hr>
        <p>&copy; 2017. Chill Technologies, Inc. All Rights Reserved.</p>
    </div>
    
    
  </footer>

</body>
</html>

