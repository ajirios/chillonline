<%-- 
    Document   : packages
    Created on : 18-May-2017, 7:00:08 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Movie packages | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../../../chilli.png"/>
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
   
   .button-carrier {
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
   font-size: 15px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 80%;
   margin-left: 10%;
   margin-right: 10%;
   margin-top: 5px;
   }
.button-carrier:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button-carrier:active {
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
      background-image: url(../../../suitelife.jpg);
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
  
  .search-dept option:hover
  {
      background-color: #f50;
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
      font-size: 12px;
      color: #555;
      margin-left: 5%;
      margin-right: 5%;
  }
  
  .episode
  {
      height: 130px;
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
      width: 68%;
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
      width: 28%;
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
      width: 68%;
      height: 30px;
      float: left;
      background-color: #fff;
      margin-top: 2.5px;
      margin-bottom: 2.5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .lower-interactions-right
  {
      width: 28%;
      height: 30px;
      float: left;
      background-color: #fff;
      margin-top: 2.5px;
      margin-bottom: 2.5px;
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
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 24px;
  }
  
  .views
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
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 17px;
      color: #fff;
      text-decoration: none;
      float: left;
  }
  
  .announcement .button2
  {
      margin-top: -3px;
  }
  
  .carrier-container
  {
      margin-bottom: 30px;
  }
  
  .carrier-id-container
  {
      background-image: url('../../../image3.jpg');
      background-size: cover;
      width: 900px;
      height: 200px;
      box-shadow: 0px 1px 0px #555;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 1px;
  }
  
  #carrier-name-container
  {
      padding: 10px 10px 10px 10px;
  }
  
  #carrier-plan-container
  {
      font-size: 25px;
      color: #FFF;
      padding: 10px 10px 10px 10px;
  }
  
  #carrier-poster-container
  {
      height: 180px;
      padding: 10px 10px 10px 10px;
      float: left;
  }
  
  .carrier-poster-info-container
  {
      width: auto;
      height: 200px;
      float: left;
  }
  
  #carrier-logo-container
  {
      width: 40px;
      height: 40px;
      background: url('disney.jpg');
      border-radius: 20px;
      background-size: cover;
      float: left;
  }
  
  .carrier-name
  {
      font-size: 16px;
      padding: 12px 8px 12px 8px;
  }
  
  .plan-container
  {
      background-color: #FFF;
      width: 900px;
      height: 1050px;
      box-shadow: 0px 1px 0px #555;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 1px;
  }
  
  #product-container
  {
      background-image: url("");
      background-size: contain;
      width: 150px;
      height: 210px;
      float: left;
  }
  
  #product-container2
  {
      background-image: url("");
      background-size: contain;
      width: 150px;
      height: 150px;
      float: left;
  }
  
  #view-all
  {
      background-color: #FFF;
      width: 900px;
      height: 200px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .genre
  {
      padding-left: 25px;
  }
  
  .program-poster
  {
      width: 150px;
      height: 210px;
  }
  
  .program-poster2
  {
      width: 150px;
      height: 150px;
  }
  
  .browsing-inner
  {
      width: 80%;
      margin-left: auto;
      margin-right: auto;
  }
  
  .carrier-toll
  {
      width: 100%;
      height: 50px;
      color: #f40;
      padding-top: 25px;
      padding-bottom: 10px;
      text-align: center;
      float: left;
  }
  
  .carrier-toll-fee
  {
      font-size: 40px;
  }
  
  .carrier-toll-month
  {
      font-size: 15px;
  }
  
  .carrier-subscribe
  {
      width: 100%;
      height: 50px;
      text-align: center;
      padding-top: 10px;
      padding-bottom: 25px;
      float: left;
  }
  
  .billing-period
  {
      width: 100%;
      height: 20px;
      padding-top: 5px;
      padding-bottom: 5px;
      float: left;
      font-size: 12px;
      text-align: center;
  }
  
  #page
  {
      color: #f40;
  }
  
  .others 
  {
      color: gray;
      background-color: #fff;
  }
  
  .others:hover
  {
      color: #fff;
      background-color: #f40;
  }
  
  #navigation-form
  {
      display: none;
  }
  
  #logout-button-form
  {
      display: none;
  }
  

  
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
            response.sendRedirect("../../../signin.jsp");
        }
        
        
        
        %>
        
        
        
        <form name="logout-button-form" id="logout-button-form" action="../../../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    
      <div class="head">
        
          <a href=""><img class="bol" src="../../../chillon.png" alt="bol"></a>
        
            <nav class="nav">
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../../account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="../../account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="../../account-hold.jsp">Hold My Account</a></div>
                            <div class="action-container"><a class="action" href="../../account-close.jsp">Close My Account</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <li><a class="a" href="../../../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../../../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../../../clients/packages.jsp" id="page">Packages</a></li>
                    <li><a class="a" href="../../../clients/streaming.jsp" >Streaming</a></li>
                    <li><a class="a" href="../../../clients/boards.jsp" >Boards</a></li>
                    <li><a class="a" href="../../../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
      
      <div class="subheader">
          <div class="skew">
          <form class="flexsearch--form" action="#" method="post">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search by package name or program name">
				</div>
			
                    
			
		</div>
              </div>
          
          
              <select name="department" class="search-dept">
                <option value="all" style="background-color:gray">in All Departments</option>
                <option value="channels" class="others">in Channels</option>
                <option value="sounds" class="others">in Sounds</option>
                <option value="videos" class="others">in Videos</option>
                <option value="movies" class="others">in Movies</option>
                <option value="series" class="others">in Series</option>
                <option value="music" class="others">in Music</option>
                <option value="games" class="others">in Games</option>
              </select>
              <input type="submit" value="Search" class="search-button">
                </form>
          
      </div>
      </div>
  </header>
    
  
            
    <div class="announcement">Rent packages for a month and enjoy with your connections. You can cancel anytime.</div>

    <div class="store">
        
        <div class="store-selector">
            <div class=""></div>
            <div class=""><h3>&nbsp; Browse by department</h3></div>
            <div class="dept-nav-place">
                <nav class="dept-nav">
                
                <ul>
                    <li><a href="../../movies/packages.jsp" >&nbsp; Movies</a></li>
                    <li class="genre"><a href="../../movies/kids/packages.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../movies/action/packages.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../../movies/comedy/packages.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../movies/romance/packages.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../movies/horror/packages.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../movies/documentary/packages.jsp" class="current">&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../movies/adventure/packages.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../../series/packages.jsp" >&nbsp; Series</a></li>
                    <li class="genre"><a href="../../series/kids/packages.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../series/action/packages.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../../series/comedy/packages.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../series/romance/packages.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../series/horror/packages.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../series/documentary/packages.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../series/adventure/packages.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../../videos/packages.jsp" >&nbsp; Videos</a></li>
                    <li><a href="../../music/packages.jsp" >&nbsp; Music</a></li>
                    <li><a href="../../channels/packages.jsp" >&nbsp; TV channels</a></li>
                    <li><a href="../../sounds/packages.jsp" >&nbsp; Radio channels</a></li>
                    <li><a href="../../games/packages.jsp" >&nbsp; Games</a></li>
                </ul>
                    
                </nav>
            </div>
            
            
            <div class="">
                
                <div class=""><h3>&nbsp; Browse by continent</h3></div>
                
                <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="africa"> Africa</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="asia"> Asia</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="europe"> Europe</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="north-america" checked> North America</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="south-america"> South America</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Refresh" class="button2"></div>
                
            </div>
            <div class=""></div>
            <div class=""></div>
        </div>
        <div class="store-content">
            <div class="hottest"><div class="advert"></div></div>
        <div class="browsed">  
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
            
            
                            
                            <%
                    
                    MovieList movies = new MovieList();
                    
                    
                    
                    %>
            
            <div class="carrier-container">
                
                <div class="carrier-id-container">
                    
                    <div id="carrier-poster-container"><img class="program-poster" src="https://s3.ca-central-1.amazonaws.com/pegbucket/movies/posters/a-wish-for-christmas.jpg" alt="poster"></div>
                    <div class="carrier-poster-info-container">
                        <div id="carrier-plan-container">The Ultimate Kids Movie Collection 2017</div>
                        <div id="carrier-name-container">
                            <div id="carrier-logo-container"></div>
                            <div class="carrier-name">Carried by James Carrie</div>
                        </div>
                        
                    </div>
                    <div></div>
                </div>
                <div class="plan-container">
                    
                    <%
                        int count = 0;
                        
                        for (count = 0; count < 30; count++) {
                        %>
                    
                        <div id="product-container"><img class="program-poster" src="<%= movies.getMovie(count).getMoviePoster() %>" alt="poster"></div>
                    
                    <%
                            }
                            %>
                    
                </div>
                            <div id="view-all">
                                <div class="carrier-toll"><span class="carrier-toll-fee">USD$14.50</span><span class="carrier-toll-month"> / mo.</span></div>
                                <div class="billing-period">*Billing periods are monthly. You can cancel anytime.</div>
                                <div class="carrier-subscribe"><button class="button-carrier">Subscribe to this carrier's monthly streaming package</button></div>
                            </div>
                
            </div>
                            
                            
                            
            
        </div>
                    <div class="hottest"><div class="browsing"><div class="browsing-inner">
                                <div class="browsing-place"><button onclick="">< Previous</button></div>
                                <div class="browsing-place">1 of 31</div>
                                <div class="browsing-place"><button onclick="">Next ></button></div>
                            </div></div></div>
        </div>
        
    </div>
    
    <div class=""></div>

  

</body>
</html>

