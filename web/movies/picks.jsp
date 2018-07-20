<%-- 
    Document   : picks
    Created on : 20-Nov-2016, 3:02:01 PM
    Author     : El Jefe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Free Picks | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
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

  .nav ul li a:link, .nav ul li a:visited
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

  .nav ul li a:hover, .nav ul li a:active
  {
    color: #add9e6;
    opacity: 1.0;
  }
  
  .nav ul li a.current
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
    margin-top: 100px;
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
  margin: 0 0px 0 100px; /* Padding for other horizontal elements */
  width: 800px;
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
input:-moz-placeholder {
  color: #888
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
      background-image: url(../suitelife.jpg);
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
      width: 100%;
      height: 450px;
      background-color: #fed;
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
  
  .post
  {
      width: 96%;
      height: 300px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
  }
  
  .commenter-area
  {
      width: 100%;
      height: 100px;
  }
  
  .commenter
  {
      width: 65%;
      height: 100px;
      float: left;
  }
  
  #comment-time
  {
      width: 20%;
      height: 100px;
      float: left;
  }
  
  #commenter-address
  {
      width: 100%;
      height: 50px;
  }
  
  #commenter-name
  {
      width: 100%;
      height: 50px;
  }
  
  #commenter-pic-area
  {
      width: 15%;
      height: 100px;
      float: left;
  }
  
  #commenter-pic
  {
      width: 100px;
      height: 100px;
      border-radius: 50px;
      background: url("clients/imageme2.jpg");
      background-size: contain;
  }
  
  #original-comment-area
  {
      width: 100%;
      height: 150px;
  }
  
  #original-comment
  {
      
  }
  
  .interact-area
  {
      width: 20%;
      height: 50px;
      float: right;
  }
  
  .interact-review-area
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  .interactions-area
  {
      width: 100%;
      height: 50px;
  }
  
  .likes
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  .replies
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  #count-of-likes
  {
      width: 20%;
      height: 50px;
      float: left;
  }
  
  #count-of-replies
  {
      width: 20%;
      height: 50px;
      float: left;
  }
  
  #like-button
  {
      width: 50%;
      height: 50px;
      float: left;
  }
  
  #reply-button
  {
      width: 50%;
      height: 50px;
      float: left;
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
  
  
</style>

<script type="text/javascript">
  

  
</script>

</head>

<body>
  
  <header>
      
    <div class="head">
      
    <a href="../index.jsp"><img class="bol" src="../chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="../carriers.jsp" >Carriers</a></li>
                    <li><a href="../public.jsp" >Free Picks</a></li>
                    <li><a href="../signin.jsp" >Sign In</a></li>
                    <li><a href="../register.jsp" >Register</a></li>
                    <li><a href="../index.jsp" >Store</a></li>
                    <li><button href="" class="post-media">Upload</button></li>
                </ul>
                    
            </nav>
      
    </div>
      
      <div class="subheader">
          
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			<form class="flexsearch--form" action="#" method="post">
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search for a movie">
				</div>
			<!--	<input class="flexsearch--submit" type="submit" value="&#10140;"/> -->
			</form>
		</div>
              </div>
          
          <form action="">
              <select name="department" class="search-dept">
    <option value="all">in All Departments</option>
    <option value="channels">in Channels</option>
    <option value="sounds">in Sounds</option>
    <option value="videos">in Videos</option>
    <option value="movies">in Movies</option>
    <option value="series">in Series</option>
    <option value="music">in Music</option>
    <option value="games">in Games</option>
  </select>
              <input type="submit" value="Search" class="search-button">
</form>
          
      </div>
          
  </header>
        
        <div class="announcement">Rent programs for a month, log in, and enjoy your content with other people. 
        <button class="button2"><a href="../register.jsp" class="chillonline">Start your free trial</a></button></div>
    
    <div class="store">
        
        <div class="store-selector">
            <div class=""></div>
            <div class=""><h2>Choose department</h2></div>
            <div class="dept-nav-place">
                <nav class="dept-nav">
                
                <ul>
                    <li><a href="../movies/picks.jsp" >Movies</a></li>
                    <li><a href="../series/picks.jsp" >Series</a></li>
                    <li><a href="../videos/picks.jsp" >Videos</a></li>
                    <li><a href="../music/picks.jsp" >Sounds</a></li>
                    <li><a href="../games/picks.jsp" >Games</a></li>
                    <li><a href="../channels/picks.jsp" >TV channels</a></li>
                    <li><a href="../sounds/picks.jsp" >Radio channels</a></li>
                </ul>
                    
                </nav>
            </div>
            
            
            <div class="">
                
                <div class=""><h2>Select origins</h2></div>
                
                <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="country"> United Kingdom</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> United States</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" checked> Canada</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Germany</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> France</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Ireland</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> China</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Japan</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Korea</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Nigeria</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Africa</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Argentina</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Brazil</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Mexico</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Refresh" class="button2"></div>
                
            </div>
            <div class=""></div>
            <div class=""></div>
        </div>
        <div class="store-content">
            <div class="hottest"><div class="advert"></div></div>
        <div class="browsed">    
            <div class="product">
                        <a href="checkout.jsp"><div class="poster">
                    
                        <img src="../movies/posters/epic.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Epic</a></div>
                <div class="distributor">Blue Sky Productions</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                        <a href=""><div class="poster">
                    
                        <img src="../movies/posters/hop.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Hop</a></div>
                <div class="distributor">Disney</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">USD$4.99</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                        <a href=""><div class="poster">
                    
                        <img src="../movies/posters/hugo.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Hugo</a></div>
                <div class="distributor">Time Warner</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href="" id="product-anchor">
                    <div class="poster">
                        
                        <img src="../series/posters/suitelife.jpeg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div>
                   </a>
                <div class="definition"><a href="checkout.jsp" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="../series/posters/gameofthrones.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Game Of Thrones</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="../series/posters/girlmeetsworld.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Girl Meets World</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="../music/posters/eyeswideopen.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style">Eyes Wide Open</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                 <div class="poster">
                    
                        <a href=""><img src="../music/posters/1989.jpg" alt="agri" id="product-poster2" title="Play Trailer"></a>
                        
                    </div>
                <a href="checkout.jsp" class="definition-style" title='Carry to checkout'><div class="definition">1989</div></a>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <div class="poster">
                    
                        <a href=""><img src="../music/posters/2020.jpg" alt="agri" id="product-poster2" title="Play Trailer"></a>
                        
                    </div>
                <a href="../checkout.jsp" class="definition-style" title='Carry to checkout'><div class="definition">The 20 / 20 Experience</div></a>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster"></div></a>
                <div class="definition"><a href="" class="definition-style">The Suite Life On Deck</a></div>
                <div class="distributor"><a href="" class="distributor-style">Disney</a></div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style">FREE</a></div>
                <div class="loves-n-seeds"></div>
            </div>
        </div>
                    <div class="hottest"><div class="browsing">
                            <div class="browsing-place"><button onclick="">< Previous</button></div>
                            <div class="browsing-place">1 of 31</div>
                            <div class="browsing-place"><button onclick="">Next ></button></div>
                </div></div>
        </div>
        
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
