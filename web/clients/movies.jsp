<%-- 
    Document   : movies
    Created on : 17-Sep-2016, 2:04:48 AM
    Author     : El Jefe
--%>

<%@page import="dateline.DateLineConversion"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="photo.board.posts.PhotoBoardPost"%>
<%@page import="notice.board.posts.NoticeBoardPost"%>
<%@page import="join.board.posts.JoinBoardPost"%>
<%@page import="document.board.posts.DocumentBoardPost"%>
<%@page import="object.board.posts.MovieObjectBoardPostList"%>
<%@page import="board.BoardRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="stream.*" %>
<%@page import="client.ClientRetrieve"%>
<%@page import="account.movie.*" %>
<%@page import="movie.peppers.MoviePepperToggleServlet" %>
<%@page import="movie.board.posts.*" %>
<%@page import="notice.board.posts.NoticeBoardPostCreateServlet" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies</title>
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
                margin: 60px auto 0px auto;
                width: 100%;
                height: 557px;
                background-color: #fff;
                float: none;
                padding: 0px 0px 0px 0px;
                box-shadow: 0 1px 0px #aaa;
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
  
  #post-content-poster
  {
      background: url("../disney.jpg");
      background-size: cover;
      width: 156px;
      height: 234px;
      margin-left: 20px;
  }
  
  #post-content-thumbnail
  {
      background: url("");
      background-size: cover;
      width: 481.6px;
      height: 270.9px;
  }
  
  #post-content-name
  {
      font-size: 12px;
      font-weight: bold;
      color: #f40;
      margin-left: 20px;
      margin-top: 5px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
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
      width: 50px;
      height: 50px;
      border-radius: 27px;
      background: url("../clients/imageme2.jpg");
      background-size: contain;
  }
    
  .distributor-logo-area
  {
      float: left;
      width: 50px;
      height: 50px;
      border-radius: 27px;
      background-image: url("../disney.jpg");
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
      width: 100%;
      height: 20px;
      font-size: 11px;
      font-weight: bold;
      color: #f40;
      background-color: #f7f7f7;
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
      color: #000;
  }
  
  .pep-link-design
  {
      text-decoration: none;
      color: #000;
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
  
  .distributor-name-area
  {
      width: 600px;
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
  
  #share-controls-div
  {
      width: 96%;
      height: 280px;
      background-color: #f7f7f7;
      margin-top: 10px;
      margin-bottom: 10px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
      display: none;
  }
  
  .share-top-left
  {
      width: 90%;
      height: 20px;
      float: left;
  }
  
  .share-top-right
  {
      width: 10%;
      height: 20px;
      float: left;
  }
  
  .share-interactions
  {
      width: 100%;
      height: 65px;
      background-color: #f7f7f7;
      margin-bottom: 1px;
  }
  
  .share-interactions-left
  {
      width: 98%;
      height: 55px;
      float: left;
      background-color: #f7f7f7;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 1%;
      margin-right: 1%;
  }
    
  #distributor-logo
  {
      width: 50px;
      height: 50px;
      border-radius: 25px;
      background-size: contain;
  }
  
  #dashboard
  {
      width: 96%;
      height: 580px;
      background-color: #FFF;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
      margin-top: 5px;
      margin-bottom: 5px;
  }

#movie-listing-area
{
    padding-bottom: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 550px;
}

#movie-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 120px;
    height: 180px;
}

.movie-listing-container
{
    width: 120px;
    height: 210px;
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

#dashboard-head
{
    width: 680px;
    height: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
}

#dashboard-left
{
    width: 120px;
    height: 20px;
    font-size: 20px;
    font-weight: bold;
    float: left;
}

#dashboard-right
{
    width: 560px;
    height: 14px;
    font-size: 14px;
    padding-top: 3px;
    padding-bottom: 3px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    float: left;
}
  
  .clickable-text
  {
      text-decoration: none;
  }
  
  .clickable-text:hover
  {
      background-color: #eee;
  }
  
  #new-comment-area
  {
      width: 100%;
      height: 70px;
      font-size: 11px;
      font-weight: bold;
      background-color: #f7f7f7;
      margin-top: 1px;
      padding-top: 5px;
      padding-bottom: 5px;
  }
  
  #comment-textarea
  {
      /*border: 1px #ccc solid; */
      border: none;
    width: 100%;
    height: 40px;
    font: 9pt sans-serif;
      background-color: #f7f7f7;
    resize: none;
  }
  
  .comment-textarea-div
  {
      width: 620px;
      height: 50px;
      float: left;
      padding: 5px 15px 5px 15px;
  }
  
  #program-name-text
  {
      width: 90%;
      height: 25px;
      font-size: 24px;
    float: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

.popup 
{
      width: 10%;
      height: 25px;
      font-size: 24px;
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    float: left;
}

/* The actual popup */
.popup .popuptext 
{
    visibility: hidden;
    height: 390px;
    width: 200px;
    background-color: #fff;
    color: #f40;
    text-align: center;
    font-size: 14px;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
    opacity: 0.9;
}

/* Popup arrow */
.popup .popuptext::after 
{
    content: "";
    position: absolute;
    top: 5%;
    left: 100%;
    margin-left: 0px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent transparent transparent #fff;
}

/* Toggle this class - hide and show the popup */
.popup .show 
{
    visibility: visible;
    -webkit-animation: fadeIn 10s;
    animation: fadeIn 10s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn 
{
    0% {opacity: 0;}
    20% {opacity: 0.9;}
    80% {opacity: 0.9;}
    100% {opacity: 0;}
}

@keyframes fadeIn 
{
    0% {opacity: 0;}
    20% {opacity: 0.9;}
    80% {opacity: 0.9;}
    100% {opacity: 0;}
}

#posts-left
{
    min-height: 200px;
    width: 29%;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 1%;
    margin-right: 0%;
    float: left;
}

#posts-right
{
    min-height: 200px;
    width: 69%;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 0%;
    margin-right: 1%;
    float: left;
}

#news-post
{
    min-height: 900px;
    width: 99%;
    margin-top: 25px;
    margin-bottom: 25px;
    margin-left: 0%;
    margin-right: 1%;
    background-color: #FFF;
}

#news-post-header
{
    height: 50px;
    width: 98%;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
}

#news-post-header-left
{
    height: 50px;
    width: 50px;
    margin-left: 5px;
    margin-right: 5px;
    background-image: url('imageme2.jpg');
    border-top-left-radius: 27px;
    border-top-right-radius: 27px;
    border-bottom-left-radius: 27px;
    border-bottom-right-radius: 27px;
    background-size: contain;
    float: left;
}

#news-post-header-right
{
    height: 14px;
    width: 420px;
    padding-top: 18px;
    padding-bottom: 18px;
    margin-left: 0;
    margin-right: 0;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    float: left;
}

#news-document
{
    height: 750px;
    width: 486px;
    margin-left: 4px;
}

#news-document-file
{
    width: 486px;
    height: 750px;
    margin-left: 4px;
}

#news-post-feedback-read
{
    height: 20px;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    box-shadow: 0 1px 0px #aaa;
}

#news-post-feedback-write
{
    height: 30px;
    width: 98%;
    margin-top: 1px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    font-size: 14px;
}
  
  .news-post-feedback-write-area
  {
      width: 100%;
      height: 20px;
      font-size: 11px;
      font-weight: bold;
      color: #000;
      padding-top: 5px;
      padding-bottom: 5px;
  }

#join-post
{
    min-height: 150px;
    width: 99%;
    margin-top: 25px;
    margin-bottom: 25px;
    margin-left: 0%;
    margin-right: 1%;
    background-color: #FFF;
}

#join-post-header
{
    height: 50px;
    width: 98%;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
}

#join-post-header-left
{
    height: 50px;
    width: 50px;
    margin-left: 5px;
    margin-right: 5px;
    background-image: url('imageme2.jpg');
    border-top-left-radius: 27px;
    border-top-right-radius: 27px;
    border-bottom-left-radius: 27px;
    border-bottom-right-radius: 27px;
    background-size: contain;
    float: left;
}

#join-post-header-right
{
    height: 14px;
    width: 420px;
    padding-top: 18px;
    padding-bottom: 18px;
    margin-left: 0;
    margin-right: 0;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    float: left;
}

#join-post-feedback-read
{
    height: 20px;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    box-shadow: 0 1px 0px #aaa;
}

#join-post-feedback-write
{
    height: 30px;
    width: 98%;
    margin-top: 1px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    font-size: 14px;
}
  
  .join-post-feedback-write-area
  {
      width: 100%;
      height: 20px;
      font-size: 11px;
      font-weight: bold;
      color: #000;
      padding-top: 5px;
      padding-bottom: 5px;
  }

#share-post
{
    min-height: 420px;
    width: 99%;
    margin-top: 25px;
    margin-bottom: 25px;
    margin-left: 0%;
    margin-right: 1%;
    background-color: #FFF;
}

#share-post-header
{
    height: 50px;
    width: 98%;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
}

#share-post-header-left
{
    height: 50px;
    width: 50px;
    margin-left: 5px;
    margin-right: 5px;
    background-image: url('imageme2.jpg');
    border-top-left-radius: 27px;
    border-top-right-radius: 27px;
    border-bottom-left-radius: 27px;
    border-bottom-right-radius: 27px;
    background-size: contain;
    float: left;
}

#share-post-header-right
{
    height: 14px;
    width: 420px;
    padding-top: 18px;
    padding-bottom: 18px;
    margin-left: 0;
    margin-right: 0;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    float: left;
}

#share-post-description
{
    min-height: 15px;
    padding-top: 15px;
    padding-bottom: 15px;
    width: 96%;
    margin-left: 2%;
    margin-right: 2%;
    background-color: #FFF;
    color: #000;
    font-size: 12px;
    text-align: left;
}

#share-poster-background
{
    height: 270px;
    width: 480px;
    margin-left: auto;
    margin-right: auto;
    background-color: #000;
}

#share-poster-background-image
{
    max-width: 480px;
    display: block;
    height: 100%;
    vertical-align: middle;
    margin-left: auto;
    margin-right: auto;
}

#share-post-feedback-read
{
    height: 20px;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    box-shadow: 0 1px 0px #aaa;
}

#share-post-feedback-write
{
    height: 30px;
    width: 98%;
    margin-top: 1px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    font-size: 14px;
}
  
  .share-post-feedback-write-area
  {
      width: 100%;
      height: 20px;
      font-size: 11px;
      font-weight: bold;
      color: #000;
      padding-top: 5px;
      padding-bottom: 5px;
  }

#stream-post
{
    min-height: 450px;
    width: 98%;
    margin-top: 25px;
    margin-bottom: 25px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
}

#stream-post-header
{
    height: 70px;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    color: #F40;
}

#stream-post-header-top
{
    height: 40px;
    width: 100%;
    padding-top: 5px;
    padding-bottom: 0px;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
}

#stream-post-header-bottom
{
    height: 20px;
    width: 100%;
    padding-top: 5px;
    padding-bottom: 5px;
    background-color: #FFF;
    color: #F40;
    font-size: 13px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#stream-post-header-left
{
    height: 40px;
    width: 40px;
    margin-left: 2px;
    margin-right: 2px;
    background-image: url('imageme2.jpg');
    border-top-left-radius: 22px;
    border-top-right-radius: 22px;
    border-bottom-left-radius: 22px;
    border-bottom-right-radius: 22px;
    background-size: contain;
    float: left;
}
  
  #stream-request-commenter-pic
  {
      width: 40px;
      height: 40px;
      border-radius: 22px;
      background: url("../clients/imageme2.jpg");
      background-size: contain;
  }
    
  .stream-request-logo-area
  {
      float: left;
      width: 40px;
      height: 40px;
      border-radius: 22px;
      background-image: url("../disney.jpg");
      background-size: contain;
  }

#stream-post-header-right
{
    height: 14px;
    width: 148px;
    padding-top: 13px;
    padding-bottom: 13px;
    margin-left: 2px;
    margin-right: 0;
    background-color: #FFF;
    color: #F40;
    font-size: 12px;
    text-align: left;
    float: left;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#stream-poster-background
{
    height: 291px;
    width: 194px;
    margin-left: auto;
    margin-right: auto;
    background-color: #FFF;
}

#stream-poster-background-image
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 194px;
    height: 291px;
}

#stream-post-feedback-read
{
    height: 20px;
    width: 98%;
    margin-left: 1%;
    margin-right: 1%;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #FFF;
    color: #F40;
    font-size: 14px;
    text-align: center;
    box-shadow: 0 1px 0px #aaa;
}

#stream-post-feedback-write
{
    height: 30px;
    width: 98%;
    margin-top: 1px;
    margin-left: 1%;
    margin-right: 1%;
    background-color: #FFF;
    font-size: 14px;
}
  
  .stream-post-feedback-write-area
  {
      width: 100%;
      height: 20px;
      font-size: 11px;
      font-weight: bold;
      color: #000;
      padding-top: 5px;
      padding-bottom: 5px;
  }
  
  #stream-like-button
  {
      width: 96%;
      height: 20px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
      text-align: center;
  }
  
  #post-like-button
  {
      width: 41%;
      height: 20px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  #post-reply-button
  {
      width: 51%;
      height: 20px;
      float: left;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  #upload-control-center
  {
      width: 96%;
      height: 200px;
      background-color: #fff;
      margin-top: 10px;
      margin-bottom: 10px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
      display: none;
  }
  
  #document-board-post-center
  {
      display: block;
  }
  
  #photo-board-post-center
  {
      display: none;
  }
  
  #notice-board-post-center
  {
      display: none;
  }
  
  #document-post-control
  {
      height: 50px;
      width: 200px;
      float: left;
  }
  
  #upload-control-selector
  {
      height: 50px;
      width: 640px;
  }
  
  #photo-post-control
  {
      height: 50px;
      width: 200px;
      float: left;
  }
  
  #notice-post-control
  {
      height: 50px;
      width: 200px;
      float: left;
  }
    
    .subnav
    {
        color: #000;
        text-decoration: none;
    }
    
    .subnav:focus
    {
        outline: 0;
    }
    
    textarea
    {
        font-family: sans-serif;
    }

  
  
  
        
  
        
        
            
        </style>
        
<script type="text/javascript">
    
    
    function getBoardIDFromParent()
    {
        var boardID = window.parent.document.getElementById("board-id-span").value;
        document.getElementById("board-id-request").value = boardID;
        var programID = window.parent.document.getElementById("board-page-request-number").value;
        document.getElementById("page-request-number").value = programID;
        document.forms["board-id-request-form"].submit();
    }
    
    
</script>
        
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
        
        
        
        <%
        long boardID = -1;
        
        if (request.getParameter("board-id-request") != null)
        
        {
            boardID = Long.parseLong(request.getParameter("board-id-request"));
        }
        
        
        %>
                
                    
        
                
                <form hidden id="board-id-request-form" method="post" action="movies.jsp">
                    
                    <input type="text" id="board-id-request" name="board-id-request" value="<%= boardID %>" />
                        <input type="text" id="page-request-number" name="page-request-number" value="" />
                    <input type="submit" />
                    
                </form>
        
        
        
        
        <%
            
            if (boardID == -1)
            
            {
            
            %>
        
        <iframe hidden src="" onload="getBoardIDFromParent()"></iframe>
        
        <%
            
            }
            
            else
            
            {
            
            %>
        
        
        
        <div id="passageway">
        
      
      <%
                String pageRequestNumber = null;
                long pageNumber;
                
                System.out.println("Board stream requested " + request.getParameter("page-request-number"));
                
                if (request.getParameter("page-request-number") == null)
                
                {
                    pageRequestNumber = "1";
                    //pageNumber = 1;
                    
                    MovieStream instantiator = new MovieStream();
                    
                    if (request.getParameter("search-name") != null)

                    {
                        pageNumber = instantiator.search(request.getParameter("search-name"));
                        
                        if ((boardID != -1) && (client.getClientID() != -1))
                            
                        {
                            
                            Calendar calendar = Calendar.getInstance();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                            String creationTime  = dateFormat.format(calendar.getTime());
                            
                            MovieRequestBoardPostCreate requestPostCreate = new MovieRequestBoardPostCreate(pageNumber, boardID, client.getClientID(), creationTime);
                            
                        }
                        
                    }
                    
                    else
                        
                    {
                        pageNumber = instantiator.getRandomProgramID(0);
                        
                        if ((boardID != -1) && (client.getClientID() != -1))
                            
                        {
                            
                            Calendar calendar = Calendar.getInstance();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                            String creationTime  = dateFormat.format(calendar.getTime());
                            
                            MovieRequestBoardPostCreate requestPostCreate = new MovieRequestBoardPostCreate(pageNumber, boardID, client.getClientID(), creationTime);
                            
                        }
                        
                    }
                    
                }
                
                else 

                {
                    
                    if (request.getParameter("page-request-number").equals("-1"))
                        
                    {
                        MovieStream instantiator = new MovieStream();
                        pageNumber = instantiator.getRandomProgramID(0);
                        pageRequestNumber = String.valueOf(pageNumber);
                        
                        if ((boardID != -1) && (client.getClientID() != -1))
                            
                        {
                            
                            Calendar calendar = Calendar.getInstance();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                            String creationTime  = dateFormat.format(calendar.getTime());
                            
                            MovieRequestBoardPostCreate requestPostCreate = new MovieRequestBoardPostCreate(pageNumber, boardID, client.getClientID(), creationTime);
                            
                        }
                        
                    }
                    
                    else
                        
                    {
                        pageRequestNumber = request.getParameter("page-request-number");
                        pageNumber = Long.parseLong(pageRequestNumber);
                        
                        if ((boardID != -1) && (client.getClientID() != -1))
                            
                        {
                            
                            Calendar calendar = Calendar.getInstance();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                            String creationTime  = dateFormat.format(calendar.getTime());
                            
                            MovieRequestBoardPostCreate requestPostCreate = new MovieRequestBoardPostCreate(pageNumber, boardID, client.getClientID(), creationTime);
                            
                        }
                        
                    }
                    
                    
                }
                
                
                BoardRetrieve board = new BoardRetrieve(boardID);
                String hostClientName = board.getCreatorName();

                if (hostClientName == null)

                {
                    hostClientName = "Boarding Services";
                }
                
                
                
                %>
                
                
                
                <div id="page-request-form-div" hidden>

                    <form id="page-request-form" method="post" target="_parent" action="board.jsp" hidden>

                        <input type="text" id="page-request-number" name="page-request-number" value="<%= pageRequestNumber %>" />
                        <input type="submit" id="page-request-number-submit" />

                    </form>

                </div>
                    
                    
                    
                <form id="movie-pepper-submit-form" method="post" action="../MoviePepperToggleServlet" hidden>
                    
                    <input type="text" id="movie-pepper-id" name="movie-pepper-id" value="<%= pageNumber %>" />
                    <input type="text" id="movie-pepper-account-number" name="movie-pepper-account-number" value="<%= accountNumber %>" />
                    <input type="text" id="movie-pepper-return-page" name="movie-pepper-return-page" value="clients/movies.jsp" />
                    <input type="submit" />
                    
                </form>
                    
                    
                
                <form id="feed-form" name="feed-form" method="post" target="_parent" action="../MovieFeed" hidden>
                    <input type="text" id="program-request-number" name="program-request-number" value="<%= pageNumber %>" hidden />
                    <input type="text" id="account-request-number" name="account-request-number" value="<%= accountNumber %>" hidden />
                    <input type="text" id="program-request-department" name="program-request-department" value="movie" hidden />
                    <input type='button' class="checkout-button" value="Feed to My Account" />
                </form>
                    
                    
    
    
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
    
        
        
    
                      
            
            <%
                    
                    
                    MovieStream movies = new MovieStream(pageNumber);
                    
                    
                    %>
        
        
        
            <div class=""></div>
            <div class="blackscreen">
                <span class="helper">
                <video id="movieteaser" autoplay>
                            <source src="<%= movies.getPodcast() %>" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                </span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area">
                        
                                                        <%
                                                            
                                    if (movies.getProgramDistributorPicture() != null) {

                                        %>
                        
                        <img id="distributor-logo" src="<%= movies.getProgramDistributorPicture() %>" alt="distributor-logo" />
                        
                                                        <%

                                    }
                                    
                                        %>
                        
                    </div>
                    <div class="distributor-name-area">
                        <div id="program-name">
                            
                            <div id="program-name-text"><%= movies.getProgramName() %></div>
                            
                            <div class="popup" onclick="myFunction()">
                              <span class="popuptext" id="myPopup">
                              Anna Carulso is streaming <b>A Wish for Christmas</b><br><br>
                              <img src="https://s3.ca-central-1.amazonaws.com/pegbucket/movies/posters/a-wish-for-christmas.jpg" alt="poster" width="190"/><br><br>
                              <b>8</b> mins ago<br>
                              <b>20</b> peppers<br>
                              </span>
                            </div>
                        
                        </div>
                        <div id="distributor-name">Distributed by <%= movies.getProgramDistributorName() %> | &COPY; <%= movies.getProducer() %>, <%= movies.getProductionCountry() %></div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    
                    
                    
                    <a class="clickable-text" href="javascript:displayPostControls();" title='Post file.' >
                        <span id="number-of-peppers"> &nbsp; </span><i class="fa fa-file" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Posting</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:submitMoviePepperSubmitForm();" title='Pep up this video.' >
                        <span id="number-of-peppers"><%= movies.getNumberOfPodcastPeppers() %> &nbsp; </span><i class="fa fa-thumbs-up" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Pep</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Post this video.' >
                        <span id="number-of-peppers"><%= movies.getNumberOfPodcastShares() %> &nbsp; </span><i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Share</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:feedToAccount(<%= pageNumber %>, <%= accountNumber %>);" title='Feed this video to your account.' >
                        <span id="number-of-peppers"><%= movies.getNumberOfPodcastFeeds() %> &nbsp; </span><i class="fa fa-home" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Feed</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Pin this video.' >
                        <span id="number-of-peppers"><%= movies.getNumberOfPodcastShares() %> &nbsp; </span><i class="fa fa-thumb-tack" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Pin to board</span>  &nbsp; &nbsp; 
                    </a>
                    
                    
                    
                    
                </div>
                
                <div class="lower-interactions-left">
                    
                    <a href="javascript:playPause();"><div class="toggles"><i class="fa fa-play" style="font-size:20px;color:orangered"></i> </div></a>
                    <a href="javascript:replay();"><div class="toggles"><i class="material-icons" style="font-size:20px;color:orangered">replay</i> </div></a>
                    <a href="javascript:fullscreen();"><div class="toggles"><i class="fa fa-arrows-alt" style="font-size:20px;color:orangered"></i> </div></a>
                    
                </div>
                
            </div>
                    
                    
                    
                    
                    
                    
            
            <div id="share-controls-div">


                    <div class="share-interactions">

                        <div class="share-interactions-left">

                            <div class="distributor-logo-area">


                                                    <%

                                if (client.getProfilePicture() != null) {

                                    %>


                                <img class="distributor-logo-area" src="<%= client.getProfilePicture() %>" alt="wallpaper" />


                                <%

                                }

                                else

                                {
                                    if (client.getGender().equalsIgnoreCase("female")) {

                                        %>


                                    <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                    <%

                                    }

                                    else

                                    {

                                        %>


                                    <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                    <%

                                    }

                                }

                                    %>



                            </div>
                            <div class="distributor-name-area">
                                <div id="commenter-name"><%= client.getClientName() %></div>
                            </div>

                        </div>


                    </div>

                    <br>

                    <form id="share-form" name="share-form" method="post" action="../MovieBoardPostCreateServlet">

                        <div class="share-interactions">

                            <div class="share-interactions-left">

                                <textarea id="share-textarea" name="request-message" rows='3' cols='90' placeholder="Let your board members know what you think about this content."></textarea>

                            </div>


                        </div><br>


                        <div class="share-top-left">

                            <input type="text" id="request-movie-id" name="request-movie-id" value="<%= pageNumber %>" hidden />
                            <input type="text" id="request-board-id" name="request-board-id" value="<%= boardID %>" hidden />
                            <input type="text" id="request-client-id" name="request-client-id" value="<%= client.getClientID() %>" hidden />

                            <input type='button' class="checkout-button" onclick="shareToBoard()" value="Share" />

                        </div>

                        <div class="share-top-right"><input type='button' class="cancel-button" onclick="closeShareControls()" value="Cancel" /></div>

                    </form>



            </div>
                            
                            
                            
                            
                            
                            
                           
            <div id="upload-control-center">
                
                <div id="upload-control-selector">
                    
                    <div id="document-post-control"><button class="subnav" onclick="displayDocumentPostCenter()"><i class="fa fa-file-pdf-o" style="font-size:24px;color:#f40"></i><i class="fa fa-file-word-o" style="font-size:24px;color:#f40"></i> &nbsp; <b>Document</b></button></div>
                    <div id="photo-post-control"><button class="subnav" onclick="displayPhotoPostCenter()"><i class="fa fa-file-photo-o" style="font-size:24px;color:#f40"></i> &nbsp; <b>Photo</b></button></div>
                    <div id="notice-post-control"><button class="subnav" onclick="displayNoticePostCenter()"><i class="fa fa-file-text" style="font-size:24px;color:#f40"></i> &nbsp; <b>Notice</b></button></div>
                    
                </div>
                
                <div id="document-board-post-center">
                    
                    <form id="document-board-post-form" method="post" enctype="multipart/form-data" action="../DocumentBoardPostCreateServlet">
                        
                        <textarea rows="5" cols="100" name="document-post-message" placeholder="Post a notice about this document."></textarea>
                        <input required type="text" id="document-post-client-id" name="document-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="document-post-board-id" name="document-post-board-id" value="<%= boardID %>" hidden />
                        <input required type="file" id="document-post-file" name="document-post-file" 
                               accept="text/plain,application/pdf,application/x-pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,
                               application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation" />
                        <input type="submit" value="Post"/>
                        
                        <input type='button' class="cancel-button" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>
                
                <div id="photo-board-post-center">
                    
                    <form id="photo-board-post-form" method="post" enctype="multipart/form-data" action="../PhotoBoardPostCreateServlet">
                        
                        <textarea rows="5" cols="100" name="photo-post-message" placeholder="Post a notice about this photo."></textarea>
                        <input required type="text" id="photo-post-client-id" name="photo-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="photo-post-board-id" name="photo-post-board-id" value="<%= boardID %>" hidden />
                        <input required type="file" id="photo-post-file" name="photo-post-file" accept="image/*" />
                        <input type="submit" value="Post"/>
                        
                        <input type='button' class="cancel-button" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>
                
                <div id="notice-board-post-center">
                    
                    <form id="notice-board-post-form" method="post" action="../NoticeBoardPostCreateServlet">
                        
                        <textarea required rows="5" cols="100" name="notice-post-message" placeholder="Post a notice to other board members."></textarea>
                        <input required type="text" id="notice-post-client-id" name="notice-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="notice-post-board-id" name="notice-post-board-id" value="<%= boardID %>" hidden />
                        <input type="submit" value="Post"/>
                        
                        <input type='button' class="cancel-button" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>

            </div>         
                            
                            
                            
                            
                            
                            
                    
            <div id="dashboard">
                
                <div id="dashboard-head"><div  id="dashboard-left">Dashboard</div><div id="dashboard-right">This board is for <%= board.getMemberType() %> of <%= board.getTeamName() %> only and is hosted by <%= hostClientName %>.</div></div>
                    
                    
                    <div id="movie-listing-area">
                        
                        
                        
                        <%
                        
                        
                        for (int count = 0; (count < movies.length()) && (movies.getMovie(count) != null); count++)
                        
                        {
                        
                        
                        %>
                        
                        
                    
                        <div class="movie-listing-container">
                            <a class="clickable-text" href="javascript:transferMovieByID(<%= movies.getMovie(count).getMovieID() %>);" >
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
                
            </div>
                                
                                
                                
                                
            <%
                    
                    DateLineConversion conversion = null;
                    MovieObjectBoardPostList postList = new MovieObjectBoardPostList(boardID);
                    
                    
                    
                    %>
                    
                    
                    
        
        
        <div id="posts-right">
            
            
        
                <%
                    
            int count = 0;
            
            for (count = postList.length() - 1; (count >= 0) && (postList.getObjectBoardPost(count) != null); count--)
                
            {
                
                if (postList.getObjectBoardPost(count) instanceof DocumentBoardPost) 
                
                {
                    
                    DocumentBoardPost documentPost = (DocumentBoardPost) postList.getObjectBoardPost(count);

        %>
            
            
            <div id="news-post">
                    
                    <div id="news-post-header">
                        
                        <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (documentPost.getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= documentPost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (documentPost.getClientGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                                    
                                        %>
                            
                        </div>
                        <div id="join-post-header-right"><b><%= documentPost.getClientName() %></b> posted this document.</div>
                    
                    </div>
                    <div id="news-document-background">
                        
                        <iframe id="news-document-file" height="500" width="400" src="<%= "https://docs.google.com/gview?url=" + documentPost.getDocumentLocation() + "&embedded=true" %>" frameborder="0"></iframe>
                        
                    </div>
                        
                        
                        
                        <%
                            
                            if ((documentPost.getMessage() != null) && (!documentPost.getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= documentPost.getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            conversion = new DateLineConversion(documentPost.getCreationTime());

                            %>
                            
                            
                    
                    <div id="news-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                    <div id="news-post-feedback-write">
                        
                    <div class="news-post-feedback-write-area">

                            

                            <div id="post-like-button"><span id="document-board-post-peppers"><%= documentPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerDocumentBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= documentPost.getDocumentID() %>', <%= documentPost.getClientID() %>, <%= documentPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span><%= documentPost.getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:registerDocumentBoardPostComment(<%= client.getClientID() %>);"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>

                            

                        </div>
                        
                    </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
            
            if (postList.getObjectBoardPost(count) instanceof JoinBoardPost)
                
            {
                            
                    JoinBoardPost joinPost = (JoinBoardPost) postList.getObjectBoardPost(count);

                    
        %>
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (joinPost.getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= joinPost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (joinPost.getClientGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                            
                            conversion = new DateLineConversion(joinPost.getCreationTime());
                                    
                                        %>
                            
                    </div>
                    <div id="join-post-header-right"><b><%= joinPost.getClientName() %></b> joined <%= board.getBoardName() %>.</div>
                
                </div>
                <div id="join-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span id="join-board-post-peppers"><%= joinPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerJoinBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, <%= joinPost.getClientID() %>, <%= joinPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span><%= joinPost.getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
             
            
            if (postList.getObjectBoardPost(count) instanceof NoticeBoardPost)
                
            {
        
                NoticeBoardPost noticePost = (NoticeBoardPost) postList.getObjectBoardPost(count);
                
                
                %>
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (noticePost.getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= noticePost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }
                                    
                                    else
                                    
                                    {
                                        if (noticePost.getClientGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                                    
                                        %>
                            
                    </div>
                    <div id="join-post-header-right"><b><%= noticePost.getClientName() %></b> posted this notice.</div>
                
                </div>
                        
                        
                        
                        <%
                            
                            if ((noticePost.getMessage() != null) && (!noticePost.getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= noticePost.getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            conversion = new DateLineConversion(noticePost.getCreationTime());
                            
                            %>
                            
                            
                    
                <div id="join-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span id="notice-board-post-peppers"><%= noticePost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerNoticeBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, <%= noticePost.getClientID() %>, <%= noticePost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span><%= noticePost.getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:registerNoticeBoardPostComment(<%= client.getClientID() %>);"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
            
            if (postList.getObjectBoardPost(count) instanceof PhotoBoardPost)
                
            {
        
                PhotoBoardPost photoPost = (PhotoBoardPost) postList.getObjectBoardPost(count);
                
                
                %>
            
            
            <div id="share-post">
                    
                    <div id="share-post-header">
                        
                        <div id="share-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (photoPost.getClientProfilePicture() != null) {
                                        
                                        %>


                                    <img id="commenter-pic" src="<%= photoPost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (photoPost.getClientGender().equalsIgnoreCase("female")) {
                                        
                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                                    
                                        %>
                            
                        </div>
                        <div id="share-post-header-right"><b><%= photoPost.getClientName() %></b> posted this photo.</div>
                    
                    </div>
                    <div id="share-poster-background">
                        
                        <img id="share-poster-background-image" src="<%= photoPost.getPhotoLocation() %>" alt="poster"/>
                        
                    </div>
                        
                        
                        
                        <%
                            
                            if ((photoPost.getMessage() != null) && (!photoPost.getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= photoPost.getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            conversion = new DateLineConversion(photoPost.getCreationTime());
                            
                            %>
                            
                            
                    
                    <div id="share-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                    <div id="share-post-feedback-write">
                    
                    <div class="share-post-feedback-write-area">



                            <div id="post-like-button"><span id="photo-board-post-peppers"><%= photoPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerPhotoBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= photoPost.getPhotoID() %>', <%= photoPost.getClientID() %>, <%= photoPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span><%= photoPost.getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>

                            

                        </div>

                    </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
            
            if (postList.getObjectBoardPost(count) instanceof MovieBoardPost)
                
            {
       
                    MovieBoardPost moviePost = (MovieBoardPost) postList.getObjectBoardPost(count);
                
                    
                %>
            
            
            <div id="share-post">
                    
                    <div id="share-post-header">
                        
                        <div id="share-post-header-left">
                            
                            
                    
                    <%

                                    if (moviePost.getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= moviePost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (moviePost.getClientGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                            
                            conversion = new DateLineConversion(moviePost.getCreationTime());

                                        %>
                            
                        </div>
                        <div id="share-post-header-right"><b><%= moviePost.getClientName() %></b> shared <b><%= moviePost.getMovieName() %></b>.</div>
                    
                    </div>
                    <div id="share-poster-background">
                        
                        <img id="share-poster-background-image" src="<%= moviePost.getMoviePoster() %>" alt="poster"/>
                    
                    </div>
                    <div id="share-post-description"><%= moviePost.getMessage() %></div>
                    <div id="share-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                    <div id="share-post-feedback-write">

                    <div class="share-post-feedback-write-area">



                            <div id="post-like-button"><span id="movie-board-post-peppers"><%= moviePost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerMovieBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= moviePost.getMovieID() %>', <%= moviePost.getClientID() %>, <%= moviePost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span>0 &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>

                            

                        </div>
                        
                    </div>
                
            </div>
                    
            
        
        
        <%
            }


        }

        %>
               
        
        
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%

                                    if (client.getProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= client.getProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (client.getGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="distributor-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }

                                        %>


                                        <%
                            
                            conversion = new DateLineConversion(board.getRegistrationDate());

                                        %>
                            
                        
                    </div>
                    <div id="join-post-header-right"><b><%= board.getCreatorName() %></b> joined <%= board.getBoardName() %>.</div>
                
                </div>
                <div id="join-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
        
        
            
            
            
            <div id="news-post">
                    
                    <div id="news-post-header">
                        
                        <div id="join-post-header-left">
                            
                            <img class="distributor-logo-area" src="../male.jpg" alt="wallpaper" />
                            
                        </div>
                        <div id="join-post-header-right"><b>Boarding Services</b> posted this document.</div>
                    
                    </div>
                    <div id="news-document-background">
                        
                       <embed id="news-document-file" src="../Chillonline_Quick_Start_Guide.pdf" width="400" height="500" /> 
                        
                    </div>


                                        <%
                            
                            conversion = new DateLineConversion(board.getRegistrationDate());

                                        %>
                                        
                                        
                    <div id="news-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                    <div id="news-post-feedback-write">

                    <div class="news-post-feedback-write-area">

                        

                        </div>

                    </div>
                
            </div>
                    
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left"></div>
                    <div id="join-post-header-right"><b><%= board.getCreatorName() %></b> created <%= board.getBoardName() %>.</div>
                
                </div>


                                        <%
                            
                            conversion = new DateLineConversion(board.getRegistrationDate());

                                        %>
                                        
                                        
                <div id="join-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                        
                    </div>
                    
                </div>
                
            </div>
            
            
        </div>
                                
                                
                                
                                
            <%
                    
                    
                    MovieRequestBoardPostList requestPostList = new MovieRequestBoardPostList(boardID);
                    
                    
                    
                    %>
                    
                    
                    
        
        
        <div id="posts-left">
            
            
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < requestPostList.length()) && (requestPostList.getMovieRequestBoardPost(count) != null); count++)
                
            {
                

        %>
        
        
        
            
            
            
            <div id="stream-post">
                
                <div id="stream-post-header">
                    
                    <div id="stream-post-header-top">
                        
                        <div id="stream-post-header-left">
                            
                            
                    
                    <%

                                    if (requestPostList.getMovieRequestBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="stream-request-commenter-pic" src="<%= requestPostList.getMovieRequestBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (requestPostList.getMovieRequestBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

                                            %>


                                        <img class="stream-request-logo-area" src="../female.jpg" alt="wallpaper" />


                                        <%

                                        }

                                        else

                                        {

                                            %>


                                        <img class="stream-request-logo-area" src="../male.jpg" alt="wallpaper" />


                                        <%

                                        }

                                    }
                            
                            conversion = new DateLineConversion(requestPostList.getMovieRequestBoardPost(count).getCreationTime());

                                        %>
                                        
                                        
                            
                        </div>
                        <div id="stream-post-header-right"><%= requestPostList.getMovieRequestBoardPost(count).getClientName() %> requested:</div>
                        
                    </div>
                    <div id="stream-post-header-bottom"><b><%= requestPostList.getMovieRequestBoardPost(count).getMovieName() %></b></div>
                
                </div>
                <div id="stream-poster-background">
                    
                    <img id="stream-poster-background-image" src="<%= requestPostList.getMovieRequestBoardPost(count).getMoviePoster() %>" alt="poster"/><br><br>
                    
                </div>
                <div id="stream-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="stream-post-feedback-write">
                
                <div class="stream-post-feedback-write-area">
                        
                        
                            
                        <div id="stream-like-button"><span id="movie-request-board-post-peppers"><%= requestPostList.getMovieRequestBoardPost(count).getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerMovieRequestBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= requestPostList.getMovieRequestBoardPost(count).getMovieID() %>', <%= requestPostList.getMovieRequestBoardPost(count).getClientID() %>, <%= requestPostList.getMovieRequestBoardPost(count).getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
            
            
        
                <%
                    
            }
                

        %>
            
        
        
            
        </div>
        
        
        
    </div>
        
        
        
        <%
            
            }
            
            
            %>
        
        
        
        
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

// When the user clicks on div, open the popup
function myFunction() 

{
    var popup = document.getElementById("myPopup");
    popup.classList.add("show");
    setTimeout(function(){ popup.classList.remove("show"); }, 10000);
}

function transferMovieByID(movieID)

{
    packageID = movieID;
    type = "movie";
    var boardID = window.parent.document.getElementById("board-id-span").value;
    var endpoint = "board.jsp?board-id-request=" + boardID + "&page-request-number=" + movieID;
    
    if (movieID > 0)
        
    {
        document.getElementById("page-request-number").value = movieID;
        document.getElementById("page-request-form").action = endpoint;
        parent.document.getElementById("middle").src = "movies.jsp";
        document.getElementById("page-request-form").submit();
    }
    
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

function share(videoID)

{
    document.getElementById("page-share-number").value = videoID;
    document.getElementById("page-share-form").submit();
}

function feedToAccount(programNumber, accountNumber)

{
   document.getElementById("program-request-number").value = programNumber;
   document.getElementById("account-request-number").value = accountNumber;
   document.getElementById("feed-form").submit();
}

function shareToBoard()

{
   document.getElementById("share-form").submit();
}

function displayShareControls() 

{
   document.getElementById('share-controls-div').style.display = "block";
}

function closeShareControls() 

{
   document.getElementById('share-controls-div').style.display = "none";
}

function displayPostControls() 

{
   document.getElementById('upload-control-center').style.display = "block";
}

function closePostControls() 

{
   document.getElementById('upload-control-center').style.display = "none";
}

function displayDocumentPostCenter()

{
    document.getElementById("document-board-post-center").style.display = "block";
    document.getElementById("photo-board-post-center").style.display = "none";
    document.getElementById("notice-board-post-center").style.display = "none";
}

function displayPhotoPostCenter()

{
    document.getElementById("document-board-post-center").style.display = "none";
    document.getElementById("photo-board-post-center").style.display = "block";
    document.getElementById("notice-board-post-center").style.display = "none";
}

function displayNoticePostCenter()

{
    document.getElementById("document-board-post-center").style.display = "none";
    document.getElementById("photo-board-post-center").style.display = "none";
    document.getElementById("notice-board-post-center").style.display = "block";
}

function registerDocumentBoardPostPep(pepperClientID, boardID, documentID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("document-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&document-id=" + documentID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../DocumentBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerPhotoBoardPostPep(pepperClientID, boardID, photoID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("photo-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&photo-id=" + photoID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../PhotoBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerNoticeBoardPostPep(pepperClientID, boardID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("notice-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../NoticeBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerJoinBoardPostPep(pepperClientID, boardID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("join-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../JoinBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerMovieBoardPostPep(pepperClientID, boardID, movieID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("movie-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&movie-id=" + movieID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../MovieBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerMovieRequestBoardPostPep(pepperClientID, boardID, movieID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("movie-request-board-post-peppers").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&movie-id=" + movieID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../MovieRequestBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}




    
    
</script>
        
  
    </body>
</html>
