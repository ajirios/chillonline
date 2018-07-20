

<%-- 
    Document   : stream
    Created on : 30-Dec-2016, 7:07:07 PM
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
<title>Streaming | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
    background-color: #c00;
    margin-right: 0;
    margin-top: 0;
    width: 70%;
    height: 200px;
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

.stations
  {
      color: #f50;
      height: 150px;
      margin-top: 10px;
      margin-left: 0;
      margin-right: 0;
      background-color: #bbb;
  }
  
  .store
  {
      width: 1800px;
      height: 3000px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
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
      padding-top: 10px;
      padding-left: 20px;
      padding-right: 20px;
      padding-bottom: 10px;
      margin-top: 40px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
  }
  
  .noannouncement
  {
      width: 96%;
      height: 15px;
      color: #FFF;
      font-size: 20px;
      text-align: center;
      background-color: #f50;
      padding-top: 5px;
      padding-left: 2px;
      padding-right: 2px;
      padding-bottom: 5px;
      margin-top: 5px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
  }

  .subheader
  {
      margin-top: 0;
      height: 34px;
      margin-left: 0;
      margin-right: 0;
      background-color: #f50;
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
      height: 3000px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-content
  {
      width: 60%;
      height: 3000px;
      margin-left: 0.5%;
      margin-right: 0.5%;
      float: left;
  }
  
  .checkout-processor
  {
      width: 19%;
      height: 3000px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-poster
  {
      width: 94%;
      margin-left: auto;
      margin-right: auto;
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
      font-size: 19px;
      width: 96%;
      height: 40px;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 2%;
      margin-right: 2%;
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
  
  .episode
  {
      width: 100%;
      height: 200px;
      background-color: #fff;
      margin-bottom: 5px;
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
      background-image: url("disney.jpg");
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
      background: url("clients/imageme2.jpg");
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
      width: auto;
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
      margin-top: 5px;
      margin-left: 2%;
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
  }
  
  #movieteaser
  {
      display: inline-block;
      height: 100%;
      vertical-align: middle;
  }
  
  #podcast-side
  {
      display: inline-block;
      height: 100%;
      vertical-align: middle;
  }
  
  

  
</style>



</head>

<body>
  
  <header>
      
    
      <div class="head">
        
          <a href="index.jsp"><img class="bol" src="chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a class="a" href="signin.jsp" >Sign In</a></li>
                    <li><a class="a" href="register.jsp" >Register</a></li>
                    <li><a class="a" href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="store.jsp" >Store</a></li>
                    <li><a class="a" href="index.jsp" >Packages</a></li>
                    <li><a class="a" href="stream.jsp" id="page" >Streaming</a></li>
                    <li><a class="a" href="distribute.jsp" >Distribute</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
      <div class="subheader">
          
          <div class="skew">
          
          <form class="flexsearch--form" action="#" method="post">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search for content">
				</div>
			
			
		</div>
              </div>
          
          
              <select name="department" class="search-dept">
    <option value="all">from All Departments</option>
    <option value="channels">from Channels</option>
    <option value="sounds">from Sounds</option>
    <option value="videos">from Videos</option>
    <option value="movies">from Movies</option>
    <option value="series">from Series</option>
    <option value="music">from Music</option>
    <option value="games">from Games</option>
  </select>
              <input type="submit" value="Search" class="search-button">
                </form>
          
      </div>
      </div>
  </header>
    
        
        <div class="noannouncement"></div>
    
        <div class="store">
    
    
    <script type="text/javascript" language="javascript">
        
     $('body').on('contextmenu', 'img', function(e) {return false;});
     $('body').on('contextmenu', 'video', function(e) {return false;});
     
     
     $('img').bind('contextmenu', function(e) {return false;});
     $('video').bind('contextmenu', function(e) {return false;});
     
     
     $(document).bind("contextmenu",function(e){
  e.preventDefault();
});
        
        
       
        
        
    </script>
    
    
    <script type="text/javascript">
        
        
        document.oncontextmenu = context_menu;
 
function context_menu(e) {
    if (!e) var e = window.event;
    var eTarget = (window.event) ? e.srcElement : e.target;
 
    if (eTarget.nodeName == "img") {
        //context menu attempt on top of an image element
        return false;
    }
}


function context_menu(e) {
    if (!e) var e = window.event;
    var eTarget = (window.event) ? e.srcElement : e.target;
 
    if (eTarget.nodeName == "video") {
        //context menu attempt on top of an image element
        return false;
    }
}
        
        
        
        
    </script>
            
            
    
    <%
            int someID = 3;
            String packageID = "5";  
            String type = "movie";
            String transaction = "rental";

try
    { 
            
            someID = Integer.parseInt(packageID);
            } 
            catch(Exception e) 
            { 
            e.printStackTrace(); 
    }
        
        
        
        %>
    
    
    <%!
            
public class Package
{

private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

Connection programConnection = null;
PreparedStatement programStatement = null;
ResultSet programSet = null;
int packageID;

public Package(int id, String department)
{
    
    packageID = id;
    
    try
    {
        programConnection = DriverManager.getConnection(URL, userName, password);
        

        if (department.equals("movie"))
        {
            programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies WHERE movieID=" + packageID );
        }

        else if (department.equals("series"))
        {
            programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, rentalPrice, locality FROM series WHERE seriesID=" + packageID );
        }

        else if (department.equals("video"))
        {
            programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies WHERE movieID=" + packageID );
        }

        else if (department.equals("music"))
        {
            programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, rentalPrice, locality FROM music WHERE musicID=" + packageID );
        }

        else if (department.equals("tv"))
        {
            programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, rentalPrice, locality FROM tv WHERE channelID=" + packageID );
        }

        else if (department.equals("radio"))
        {
            programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, locality FROM radio WHERE radioID=" + packageID );
        }

        else if (department.equals("game"))
        {
            programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, rentalPrice, locality FROM games WHERE gameID=" + packageID );
        }


    }
    catch (SQLException e)
    {
        e.printStackTrace();
    }

}

public ResultSet getProgram()
{
    try
    {
        programSet = programStatement.executeQuery();
    }
    catch (SQLException e)
    {
        e.printStackTrace();
    }

    return programSet;

}

public void setProgramID(int id)
{
    this.packageID = id;
}

}
                
                %>
            
            <%
                    
                    Package program = new Package(someID, type);   
                    ResultSet programsSet = program.getProgram(); 
                    
                    
                    %>
                    
                    <%
                        int count;
                        String programID = ""; 
                        String programName = "";
                        String programPoster = "";
                        String programDistributor = "";
                        String programLocality = "";
                        String programRentalPrice = "";
                        
                        for (count = 0; (count < 1) && (programsSet.next() == true); count++) {
                            
                            
                            
                            if (type.equals("movie"))
                            {
                                programID = programsSet.getString("movieID");
                                programName = programsSet.getString("movieName"); 
                                programPoster = programsSet.getString("moviePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("series"))
                            {
                                programID = programsSet.getString("seriesID");
                                programName = programsSet.getString("seriesName"); 
                                programPoster = programsSet.getString("seriesPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("video"))
                            {
                                programID = programsSet.getString("movieID");
                                programName = programsSet.getString("movieName"); 
                                programPoster = programsSet.getString("moviePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("music"))
                            {
                                programID = programsSet.getString("musicID");
                                programName = programsSet.getString("musicName"); 
                                programPoster = programsSet.getString("musicPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("tv"))
                            {
                                programID = programsSet.getString("channelID");
                                programName = programsSet.getString("channelName"); 
                                programPoster = programsSet.getString("channelPoster");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("radio"))
                            {
                                programID = programsSet.getString("radioID");
                                programName = programsSet.getString("radioName"); 
                                programPoster = programsSet.getString("radioPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }

                            else if (type.equals("game"))
                            {
                                programID = programsSet.getString("gameID");
                                programName = programsSet.getString("gameName"); 
                                programPoster = programsSet.getString("gamePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                            }
                            
                        


                        %>
                        
    
           
                        
                      
                        
                        
                        
        
        <div class="checkout-processor">
            
            
            <div class="checkout-space"></div>
            <div class="episodes">
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                        <video id="podcast-side" width="206" >
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/dark-horse.mp4#t=11" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                    </div>
                  <div class="title">Katy Perry - Dark Horse</div>
                  <div class="views">Capitol Records</div>
                  <div class="views">3,112,635 views</div>
                    </div></a>
               
                
            </div>
            <div class=""></div>
            <div class="checkout-space"></div>
            
            
            
        </div>
                        
        
        
        <div class="checkout-content">
            
            <div class=""></div>
            <div class="blackscreen">
                <span class="helper">
                <video id="movieteaser" width="720" autoplay>
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/dark-horse.mp4" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area"></div>
                    <div class="distributor-name-area">
                        <div id="program-name">Katy Perry - Dark Horse</div>
                        <div id="distributor-name">Capitol Records</div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    <i class="fa fa-film" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">2,101,537 feeds</span>  &nbsp; &nbsp; 
                    <i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">683,667 peppers</span>  &nbsp; &nbsp; 
                    <i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">8,935 shares</span>
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play-circle-o" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                    
                    
            <div id="program-description-area">
                Jason Derulo’s brand new album “Everything Is 4” is available now on iTunes! Download it here: http://www.smarturl.it/EverythingIs4

The new album features smash hit “Want To Want Me”! 

See below for the official tracklisting:
1. Want To Want Me
2. Cheyenne
3. Get Ugly
4. Pull Up 
5. Love Like That (Feat. K Michelle)
6. Painkiller (Feat Meghan Trainor)
7. Broke (Feat. Stevie Wonder & Keith Urban)
8. Try Me (Feat. Jennifer Lopez & Matoma)
9. Love Me Down
10. Trade Hearts (Feat. Julia Michaels) 
11. X2CU
                
            </div>
            
            
            
            
            <div class="content-comments">
                
                <div class=""><span>LOG</span></div>
                <div class="post-comment">
                    
                    <div class=""></div>
                    <div class=""></div>
                    <div class=""></div>
                    
                </div>
                <div class=""></div>
                <div class="post">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                    <div id="reply-field"></div>
                    
                </div>
                
                
                
                <div class="post-collapsed">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                </div>
                
                
                
                <div class="post-collapsed">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                </div>
                
                
                
                <div class="post-collapsed">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                </div>
                
                
                
                <div class="post-collapsed">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                </div>
                
                
                
                <div class="post-collapsed">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">January 8 at 3:52pm</div>
                        </div>
                        <div id="comment-time"></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton. Excellent video for Winnipeg!   What an amazing job you all did 
                            on making this video!  I'm proud to live here!   The only suggestion I would have is to place a note on the 
                            bottom of each attraction so people know where each attraction  is, 
                            so when they come to visit they'll know what to look for and what it is called.  Thanks again!  GREAT Job!!!!﻿
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        
                            
                            <div id="like-button"><i class="fa fa-thumbs-o-up" style="font-size:24px"></i> &nbsp; <span>Pep</span></div>
                            <div id="like-button"><i class="fa fa-heart" style="font-size:24px"></i> &nbsp; <span>Spice</span></div>
                            <div id="reply-button"><i class="fa fa-comment" style="font-size:24px"></i> &nbsp; <span>Comment</span></div>
                            
                        
                        
                    </div>
                        
                        <div class="interactions-area">
                            
                            <span class="written">Jay Savage, Christina Paulier, and 84 others pepped up this comment.</span>
                            
                        </div>
                    
                        <div class="interactions-area">
                            
                            <span class="written">View 31 Comments</span>
                            
                        </div>
                    
                </div>
                
                
                
            </div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            
        </div>
        
        
                        
                                     
                        
        <div class="checkout-information">
            
            <div class="checkout-space"></div>
            <div class="product-id">
                <span class="">Currently Streaming</span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-poster">
                
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                          <video id="podcast-side" width="206" >
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/dark-horse.mp4#t=23" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                    </div>
                  <div class="title">Katy Perry - Dark Horse</div>
                  <div class="views">Capitol Records</div>
                  <div class="views">2,091,112,635 views</div>
                    </div>
                </a>
                
                
            </div>
            <div class="checkout-space"></div>
            <hr>
            <div class=""> &nbsp; <b>Others Like This</b></div><br>
            <div class="checkout-space"></div>
            <div class="checkout-poster">
                
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                          <video id="podcast-side" width="206" >
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/what-if.mp4#t=23" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                    </div>
                  <div class="title">Jason Derulo - What If</div>
                  <div class="views">Beluga Heights</div>
                  <div class="views">3,112,635 views</div>
                    </div>
                </a>
                
                
            </div>
            
            <div class="checkout-poster">
                
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                          <video id="podcast-side" width="206" >
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/eyes-wide-open.mp4#t=23" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                    </div>
                  <div class="title">Jason Derulo - What If</div>
                  <div class="views">Beluga Heights</div>
                  <div class="views">3,112,635 views</div>
                    </div>
                </a>
                
                
            </div>
            
            <div class="checkout-poster">
                
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="mini-blackscreen">
                <span class="side-helper">
                          <video id="podcast-side" width="206" >
                            <source src="https://s3.ca-central-1.amazonaws.com/pegbucket/videos/content/dustbuddies.mp4#t=23" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
                    </div>
                  <div class="title">Jason Derulo - What If</div>
                  <div class="views">Beluga Heights</div>
                  <div class="views">3,112,635 views</div>
                    </div>
                </a>
                
                
            </div>
            
            
            
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






    
    
</script>
            
            
            
        
        
                        <%
                            }
                            %>
                        
    </div>

  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href="distributors/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="distributors/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="distributors/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="distributors/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="distributors/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="distributors/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="distributors/games/index.jsp"><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Carriers</h4>
          <a class="notes" href="carriers/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="carriers/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="carriers/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="carriers/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="carriers/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="carriers/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="carriers/games/index.jsp"><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href=""><p>Terms of Use</p></a>
          <a class="notes" href=""><p>Privacy Policy</p></a>
          <a class="notes" href=""><p>Cookie Policy</p></a>
          <a class="notes" href=""><p>Warranties</p></a>
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
        <p>&copy; 2016 Chill Technologies Inc. All Rights Reserved.</p></div>
    
    
  </footer>

</body>
</html>
