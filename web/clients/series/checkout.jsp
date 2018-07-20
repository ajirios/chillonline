<%-- 
    Document   : checkout
    Created on : 7-Oct-2016, 12:41:31 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="checkout.TVSeriesCheckout" %>
<%@page import="log.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../../chilli.png"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
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
  
  .nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin: 0;
  }

  .nav ul li
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

  .nav ul li .a:hover, .nav ul li .a:active
  {
    color: #add9e6;
    opacity: 1.0;
  }
  
  .nav ul li .a.current
  {
    color: #add9e6;
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
  
  .nav
  {
      
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
  
  .controller
  {
      background-color: #fff;
      margin-left: 0px;
      width: 20%;
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 1.0;
      margin-top: -390px;
      float: left;
  }
  
  .logos
  {
      background-color: #333;
      margin-left: 0px;
      width: 80%;
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -390px;
      float: right;
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
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 13px;
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
   border-top-color: #2c7d04;
   background: #2c7d04;
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
      width: 1400px;
      height: 1800px;
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
      background-color: /*#87ceeb*/ #e63;
      float: left;
  }
  
  #epic
  {
      margin-left: 200px;
      width: 80%;
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

.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
}

.flip
{
    background-color: #ffffff;
    height: 30px;
}

.flop
{
    background-color: #fed;
    height: 30px;
}

  .names
  {
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 15px;
    border-color: #e63;
    font-size: 15px;
  }
  
  .carrier
  {
      width: 96%;
      height: 600px;
      background-color: #FFF;
      margin-left: auto;
      margin-right: auto;
      margin-top: 25px;
      margin-bottom: 25px;
  }
  
  .carrier-idspace
  {
      width: 100%;
      height: 50px;
  }
  
  .origin-selector
  {
      width: 20%;
      height: 500px;
      float: left;
      background-color: #f50;
      color: #FFF;
  }
  
  .swipeleft-selector
  {
      width: 5%;
      height: 500px;
      float: left;
      background-color: #fff;
  }
  
  .station-selector
  {
      width: 20%;
      height: 496px;
      float: left;
      background-color: #ddd;
      border-top: 2px solid #f50;
      border-bottom: 2px solid #f50;
  }
  
  .description-selector
  {
      width: 50%;
      height: 496px;
      float: left;
      background-color: #eee;
      border-top: 2px solid #f50;
      border-bottom: 2px solid #f50;
  }
  
  .swiperight-selector
  {
      width: 5%;
      height: 500px;
      float: left;
      background-color: #fff;
  }
  
  .swiper
  {
      height: 100px;
      width: 100%;
      background-color: #EEE;
      color: #f40;
      font-size: 60px;
  }
  
  .swiper-container
  {
      height: 100px;
      width: 100%;
      margin-top: 200px;
      margin-bottom: 200px;
  }
  
  .station-content
  {
      width: 100%;
      height: 200px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 250px;
      margin-top: 50px;
  }
  
  #content
  {
      width: 100%;
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
      width: 99%;
      height: 3300px;
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
  
  .distributor-style
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
      background-image: url(../../suitelife.jpg);
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
  }
  
  .distributor
  {
      color: #f40;
  }
  
  .distributor-name
  {
      color: #f40;
      padding-top: 2px;
      padding-bottom: 2px;
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
      background-image: url("../../disney.jpg");
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
      height: 150px;
      padding-top: 25px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 25px;
      background-color: #FFF;
      font-size: 12px;
  }
  
  #number-of-peppers
  {
      color: #333;
      font-size: 12px;
      font-weight: bold;
  }
  
  .views2
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 20px;
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
      background: url("../../clients/imageme2.jpg");
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
  }
  
  #checkout_form
  {
      display: none;
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
  
  
  @media only screen and (min-width: 1200px) {
    
  .store
  {
      width: 1200px;
      height: 3000px;
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
  
  #movieteaser
  {
      display: inline-block;
      width: 720px;
      height: 100%;
      vertical-align: middle;
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
  
  
  
  
  
  
  
    } /* end of responsivity for at most 2000px */
    
    
     
    @media only screen and (min-width: 1500px) and (max-width: 4000px) {
    
  .store
  {
      width: 1600px;
      height: 3300px;
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
  
  #movieteaser
  {
      display: inline-block;
      width: 960px;
      height: 100%;
      vertical-align: middle;
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
  
  
        
        
    } /* end of responsivity for at least 2001px */
    
    
    
    
    @media only screen and (min-width: 1700px) and (max-width: 4000px) {
    
  .store
  {
      width: 1800px;
      height: 3300px;
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
  
  #movieteaser
  {
      display: inline-block;
      width: 1080px;
      height: 100%;
      vertical-align: middle;
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
  
  
        
        
    } /* end of responsivity for at least 2001px */
    
    

    
    
</style>


<script type="text/javascript">
  

    function submitLogoutForm()
        
    {
        document.forms["logout-button-form"].submit(); 
    }

  
</script>

</head>

<body>
    
    
    
    <%
        
        if (session.getAttribute("account-number") == null)
        
        {
            response.sendRedirect("../../signin.jsp");
        }
        
        
        
        %>
        
        
        
        <form hidden name="logout-button-form" id="logout-button-form" action="../../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    <div class="head">
      
    <a href=""><img class="bol" src="../../chillon.png" alt="bol"></a>
        
    
        
            <nav class="nav">
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="../account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="../account-hold.jsp">Hold My Account</a></div>
                            <div class="action-container"><a class="action" href="../account-close.jsp">Close My Account</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <li><a class="a" href="../../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../../clients/packages.jsp" >Packages</a></li>
                    <li><a class="a" href="../../clients/videos/stream.jsp" >Streaming</a></li>
                    <li><a class="a" href="../../clients/boards.jsp" >Boards</a></li>
                    <li><a class="a" href="../../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
      
    </div>
      
      <div class="subheader">
          <div class="skew">
          
          <form class="flexsearch--form" method="post" action="checkout.jsp">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" name="search-name" placeholder="Content Search">
				</div>
			
			
		</div>
              </div>
          
              
              <select name="department" class="search-dept">
                <option disabled value="all">in All Departments</option>
                <option disabled value="channels">in Channels</option>
                <option disabled value="sounds">in Sounds</option>
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
    
    <form id="checkout_form" method="post" action="bill.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type='text' id="business" name="business">
                <input type="submit" id="submit-form-button">
                
            </form>
    
    <div class="noannouncement"></div>
    
    
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
    
        
        <%
            
            String episodeRequestNumber = null;
            int episodeNumber = 1;
            long someID = 3;
            String packageID = "";  
            String type = "";

            try
                
            { 
                
                if (request.getParameter("packageID") == null)
                
                {
                    packageID= "1";
                    //pageNumber = 1;
                    
                    if (request.getParameter("search-name") != null)

                    {

                        TVSeriesCheckout instantiator = new TVSeriesCheckout();
                        someID = instantiator.search(request.getParameter("search-name"));
                        
                    }
                    
                    else
                        
                    {
                        TVSeriesCheckout instantiator = new TVSeriesCheckout();
                        someID = instantiator.getRandomProgramID(0);
                    }
                    
                }
                
                else 

                {
                    packageID = request.getParameter("packageID");
                    someID = Long.parseLong(packageID);
                    type = request.getParameter("department");
                    
                    if (request.getParameter("episode-order-request-number") != null)
                        
                    {
                        episodeRequestNumber = request.getParameter("episode-order-request-number");
                        episodeNumber = Integer.parseInt(episodeRequestNumber);
                    }
                    
                }
                
                
            } 
            
            catch(Exception e) 
                
            { 
                e.printStackTrace(); 
            }

            
            %>
        
       
            
            <%
                    
                    TVSeriesCheckout series = new TVSeriesCheckout(someID);   
                    
                    
                    
                    %>
                    
                    
          
        
            
            <div id="episode-order-request-form-div" hidden>
                
                <form id="episode-order-request-form" method="post" action="checkout.jsp" hidden>
                    
                    <input type="text" id="episode-order-request-number" name="episode-order-request-number" value="<%= episodeRequestNumber %>" />
                    <input type="text" id="page-request-number2" name="packageID" value="<%= someID %>" />
                    <input type="text" id="department2" name="department" value="series" />
                    <input type="submit" id="episode-order-request-number-submit" />
                    
                </form>
                
            </div>
                    
                    
                        
    <div class="store">
        
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
                
                <a class="clickable-text" href="javascript:transferEpisodeByOrder(<%= series.getTvSeries().getEpisodeList().getEpisode(count).getOrder() %>, <%= someID %>);" ><div class="episode">
                  
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
                    
                    <div class="distributor-logo-area"></div>
                    <div class="distributor-name-area">
                        <div id="program-name"><%= series.getTvSeries().getEpisodeList().getEpisode(episodeNumber - 1).getEpisodeName() %></div>
                        <div id="distributor-name"><%= series.getProgramDistributorName() %></div>
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
                <hr>
                
                
                
            </div>
            
        </div>
        
        <div class="checkout-information">
            
            
            <div class="checkout-space"></div>
            <div class="product-id">
                <span class="definition-style"><%= series.getProgramName() %></span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-poster">
                
                
                
                <img src="<%= series.getProgramPoster() %>" alt='Cover poster' class="cover-poster" />
                
                
                
            </div>
            <div class="checkout-space"></div>
            
            
            
            
            <div id="movie-transact">
            <div class="cb-div">
                
             
                    <input type='button' class="checkout-button" onclick="transferSeriesByID(<%= series.getProgramID() %>, 'rental')" value="Rent <%= series.getRentalPrice() + " / mo." %> " />
             
            </div>
            <div class="checkout-space"></div>
            <div class="cb-div">

                   <button class="checkout-button" onclick="transferSeriesByID(<%= series.getProgramID() %>, 'purchase')">Buy <%= series.getPurchasePrice() %></button>
               
            </div>
            </div>
                   
                   
            <div class=""></div>
            <div class=""></div>
            
            
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
        
    </div>
            

</body>
</html>

