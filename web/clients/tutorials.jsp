<%-- 
    Document   : tutorials
    Created on : 6-Oct-2017, 10:02:07 PM
    Author     : El Jefe
--%>

<%@page import="photo.board.posts.PhotoBoardPostCommentList"%>
<%@page import="notice.board.posts.NoticeBoardPostCommentList"%>
<%@page import="join.board.posts.JoinBoardPostCommentList"%>
<%@page import="document.board.posts.DocumentBoardPostCommentList"%>
<%@page import="tutorial.board.posts.TutorialBoardPostCommentList"%>
<%@page import="object.board.posts.TutorialObjectBoardPostList"%>
<%@page import="join.board.posts.JoinBoardPost"%>
<%@page import="notice.board.posts.NoticeBoardPost"%>
<%@page import="tutorial.board.posts.TutorialBoardPost"%>
<%@page import="photo.board.posts.PhotoBoardPost"%>
<%@page import="tutorial.board.posts.TutorialRequestBoardPostList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="tutorial.board.posts.TutorialRequestBoardPostCreate"%>
<%@page import="document.board.posts.DocumentBoardPost"%>
<%@page import="dateline.DateLineConversion"%>
<%@page import="java.util.Calendar"%>
<%@page import="board.BoardRetrieve"%>
<%@page import="document.board.posts.DocumentBoardPostList"%>
<%@page import="client.ClientRetrieve"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
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
                margin: 30px auto 30px auto;
                width: 720px;
                height: 557px;
                background-color: #fff;
                float: none;
                padding: 0px 0px 0px 0px;
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
  
  #commenter-pic-area
  {
      width: 80px;
      height: 625px;
      float: left;
      background-color: #fff;
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
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
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
  
  #cancel-button
  {
      margin-left: 6px;
  }
  
  .distributor-name-area
  {
      width: 500px;
      font-size: 18px;
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
      height: 60px;
      background-color: #fff;
      margin-bottom: 0px;
  }
  
  .share-interactions-left
  {
      width: 98%;
      height: 50px;
      float: left;
      background-color: #fff;
      margin-top: 5px;
      margin-bottom: 0px;
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
      height: 140px;
      background-color: #FFF;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
      margin-top: 5px;
      margin-bottom: 5px;
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
    padding-bottom: 20px;
    margin-left: 20px;
    margin-right: 20px;
    height: 90px;
}

#video-listing-poster
{
    background: url("imageme2.jpg");
    background-size: cover;
    width: 150px;
    height: 84.375px;
}

.video-listing-container
{
    width: 150px;
    height: 114.375px;
    padding-top: 9.375px;
    margin-right: 10px;
    float: left;
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
  
  #post-comment-div
  {
      height: 90px;
    width: 100%;
    margin-top: 1px;
    background-color: #FED;
    display: block;
  }
  
  #post-comment-picture-div
  {
      width: 50px;
      height: 50px;
      padding-top: 5px;
      padding-bottom: 35px;
      padding-left: 5px;
      padding-right: 5px;
      float: left;
  }
  
  #post-comment-write-div
  {
      width: auto;
      height: 90px;
      padding-left: 5px;
      padding-right: 5px;
      float: left;
  }
  
  #post-comment-textarea-div
  {
      width: auto;
      height: 50px;
      padding-top: 5px;
      padding-bottom: 2px;
      font-family: sans-serif;
      font-size: 12px;
  }
  
  #post-comment-button-div
  {
      width: auto;
      height: 25px;
      font-family: sans-serif;
      font-size: 12px;
  }
  
  .post-comment-textarea
  {
      font-family: sans-serif;
      font-size: 12px;
      border-radius: 2px;
      border: 0.5px solid #f40;
  }
  
  .document-post-comment-textarea
  {
      font-family: sans-serif;
      font-size: 12px;
      border-radius: 2px;
      border: 0.5px solid #f40;
  }
  
  .join-post-comment-textarea
  {
      font-family: sans-serif;
      font-size: 12px;
      border-radius: 2px;
      border: 0.5px solid #f40;
  }
  
  .notice-post-comment-textarea
  {
      font-family: sans-serif;
      font-size: 12px;
      border-radius: 2px;
      border: 0.5px solid #f40;
  }
  
  .photo-post-comment-textarea
  {
      font-family: sans-serif;
      font-size: 12px;
      border-radius: 2px;
      border: 0.5px solid #f40;
  }
  
  #comment-button
  {
      float: right;
  }
  
  .btn 
  {
  background: #ff4400;
  background-image: -webkit-linear-gradient(top, #ff4400, #ff5500);
  background-image: -moz-linear-gradient(top, #ff4400, #ff5500);
  background-image: -ms-linear-gradient(top, #ff4400, #ff5500);
  background-image: -o-linear-gradient(top, #ff4400, #ff5500);
  background-image: linear-gradient(to bottom, #ff4400, #ff5500);
  -webkit-border-radius: 1;
  -moz-border-radius: 1;
  border-radius: 1px;
  font-family: Arial;
  font-weight: bold;
  color: #ffffff;
  font-size: 11px;
  padding: 3px 15px 3px 15px;
  border: solid #ff4400 1px;
  text-decoration: none;
}

.btn:hover 
{
  background: #f40;
  background-image: -webkit-linear-gradient(top, #ff4400, #ff5500);
  background-image: -moz-linear-gradient(top, #ff4400, #ff5500);
  background-image: -ms-linear-gradient(top, #ff4400, #ff5500);
  background-image: -o-linear-gradient(top, #ff4400, #ff5500);
  background-image: linear-gradient(to bottom, #ff4400, #ff5500);
  text-decoration: none;
}

#all-comments
{
    display: block;
}

.comment-div
{
    min-height: 95px;
    width: 100%;
    margin-top: 1px;
    background-color: #FED;
    display: block;
}

.comment-introductions
{
    width: 100%;
    height: 60px;
}

.comment-picture-div
{
    height: 50px;
    width: 50px;
    padding: 5px;
    float: left;
}

.comment-information-div
{
    min-height: 50px;
    width: 410px;
    padding: 5px;
    float: left;
}

.comment-client-name-div
{
    width: 100%;
    height: 15px;
    padding-top: 2.5px;
    color: #f40;
    font-size: 12px;
}

.comment-creation-time-div
{
    width: 100%;
    height: 15px;
    padding-top: 2.5px;
    color: #000;
    font-size: 10px;
    font-weight: bold;
}

.comment-message-div
{
    width: 410px;
    min-height: 15px;
    padding-top: 2.5px;
    padding-bottom: 17.5px;
    padding-left: 65px;
    color: #000;
    font-size: 12px;
    white-space: pre-wrap;
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
    min-height: 269px;
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
    height: 110px;
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
    height: 110px;
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
      height: 40px;
      width: 200px;
      margin-bottom: 10px;
      background-color: #EEE;
      float: left;
  }
  
  #upload-control-selector
  {
      height: 50px;
      width: 640px;
  }
  
  #photo-post-control
  {
      height: 40px;
      width: 200px;
      margin-bottom: 10px;
      background-color: #FFF;
      float: left;
  }
  
  #notice-post-control
  {
      height: 40px;
      width: 200px;
      margin-bottom: 10px;
      background-color: #FFF;
      float: left;
  }
    
    .subnav
    {
        background-color: Transparent;
        background-repeat:no-repeat;
        border: none;
        cursor:pointer;
        overflow: hidden;
        outline:none;
    }
    
    textarea
    {
        font-family: sans-serif;
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
  
  a
{
color: #333;
text-decoration: none;
}

#container
{
width: 740px;
background: #fff;
margin: auto;
}

.clearfix
{
clear: both;
}

header
{
padding: 30px 20px;
background: #f4f4f4;
}

header h1
{
color: #000;
margin-bottom: 5px;
}

header span
{
color: #dd2826;
}

section
{
padding: 30px 20px 20px 20px;
}

footer
{
padding: 20px;
background: #f4f4f4;
text-align: center;
}

search-form
{
display: block;
margin-bottom: 15px;
}

.fieldcontainer
{
display: block;
position: relative;
width: 90%;
margin: 0 auto;
}

#search-btn
{
position: absolute;
right: 360px;
top: 5px;
height: 32px;
width: 32px;
border: 0;
cursor: pointer;
zoom: 1;
filter: alpha(opacity=65);
opacity: 0.65;
background: transparent url("../img/search.png") top left no-repeat;
background-size: contain;
}

#search-btn:hover
{
filter: alpha(opacity=90);
opacity: 0.9;
}

.search-field
{
box-sizing: border-box;
display: block;
width: 45%;
padding: 11px 7px;
padding-right: 43px;
background: #fff;
color: #ccc;
border: 1px solid #c8c8c8;
font-size: 1.6em;
border-bottom-color: #d2e2e7;
-moz-border-radius: 1px;
-webkit-border-radius: 1px;
border-radius: 1px;
-moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 0 0 6px #f0f0f0;
-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 0 0 6px #f0f0f0;
box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 0 0 6px #f0f0f0;
}

#results
{
padding: 10px 0;
border-bottom: 1px #ccc dotted;
list-style: none;
overflow: auto;
}

.list-left
{
float: left;
width: 20%;
}

.list-left img
{
width: 100%;
padding: 3px;
border: solid #ccc 1px;
}

.list-right
{
float: right;
width: 78%;
}

.cTitle
{
color: #f40;
}

.button-container
{
margin-top: 25px;
}

.paging-button
{
background: #f4f4f4;
padding: 8px 13px;
border: #ccc 1px solid;
border-radius: 5px;
color: #333;
margin: 10px;
cursor: pointer;
float: left;
}




  
  
  
        
        
        
            
        </style>
        
<script type="text/javascript">
    
    
    function getBoardIDFromParent()
    {
        var boardID = window.parent.document.getElementById("board-id-span").value;
        document.getElementById("board-id-request").value = boardID;
        var programID = window.parent.document.getElementById("board-page-request-number").value;
        document.getElementById("page-request-number").value = programID;
        document.getElementById("title").value = window.parent.document.getElementById("tutorial-title").value;
        document.getElementById("channel-title").value = window.parent.document.getElementById("channel-title").value;
        document.getElementById("thumbnail").value = window.parent.document.getElementById("thumbnail").value;
        document.getElementById("description").value = window.parent.document.getElementById("description").value;
        
        document.forms["board-id-request-form"].submit();
    }
    
    function fillScreen(videoID, title, channelTitle)
    
    {
        
        var programName = document.getElementById("program-name").innerHTML;
        var distributorName = document.getElementById("distributor-name").innerHTML;
        
        if (programName === "")
            
        {
            
            document.getElementById("axiframe").src = "https://www.youtube.com/embed/" + videoID + "?rel=0&autoplay=1&fs=1";
            document.getElementById("program-name").innerHTML = title;
            document.getElementById("distributor-name").innerHTML = channelTitle;
            
        }
        
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
                
                    
        
                
                <form hidden id="board-id-request-form" method="post" action="tutorials.jsp">
                    
                    <input type="text" id="board-id-request" name="board-id-request" value="<%= boardID %>" />
                        <input type="text" id="page-request-number" name="page-request-number" value="" />
                        <input type="text" id="title" name="title" value="" />
                        <input type="text" id="channel-title" name="channel-title" value="" />
                        <input type="text" id="thumbnail" name="thumbnail" value="" />
                        <input type="text" id="description" name="description" value="" />
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
                String pageNumber = null;
                String embed = null;
                String title = "";
                String channelTitle = "";
                String thumbnail = "";
                String description = "";
                TutorialRequestBoardPostCreate postCreate = null;
                
                System.out.println("Tutorials stream requested " + request.getParameter("page-request-number"));
                
                if (request.getParameter("page-request-number") == null)
                
                {
                    pageRequestNumber = "0";
                    pageNumber = "0";
                    embed = "https://www.youtube.com/embed/" + pageNumber + "?rel=0";
                    System.out.println("Board stream embedded " + embed);
                }
                
                else 

                {
                    if (request.getParameter("page-request-number").equals("-1"))
                        
                    {
                        pageRequestNumber = "0";
                        pageNumber = "0";
                        embed = "https://www.youtube.com/embed/" + pageNumber + "?rel=0";
                        System.out.println("Board stream embedded " + embed);
                    }
                    
                    else
                        
                    {
                         pageRequestNumber = request.getParameter("page-request-number");
                        pageNumber = request.getParameter("page-request-number");
                        embed = "https://www.youtube.com/embed/" + pageNumber + "?rel=0";
                        System.out.println("Board stream embedded " + embed);

                        if (request.getParameter("title") != null)

                        {
                            
                            if (!request.getParameter("title").equals(""))
                                
                            {
                                title = request.getParameter("title");
                                channelTitle = request.getParameter("channel-title");
                                thumbnail = request.getParameter("thumbnail");
                                description = request.getParameter("description");

                                Calendar calendar = Calendar.getInstance();
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                                String creationTime  = dateFormat.format(calendar.getTime());
                                
                                if (thumbnail != null)
                                    
                                {
                                    if (!thumbnail.equals(""))
                                        
                                    {
                                        postCreate = new TutorialRequestBoardPostCreate(pageNumber, boardID, client.getClientID(), creationTime, title, thumbnail);
                                    }
                                    
                                }

                                
                            }
                            
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

                        <input type="text" id="page-request-number-re" name="page-request-number" value="<%= pageRequestNumber %>" />
                        <input type="text" id="title2" name="title" value="" />
                        <input type="text" id="channel-title2" name="channel-title" value="" />
                        <input type="text" id="thumbnail2" name="thumbnail" value="" />
                        <input type="text" id="description2" name="description" value="" />
                        <input type="submit" id="page-request-number-submit" />
                        
                    </form>

                </div>
                    
                    
                    
                <form id="video-pepper-submit-form" method="post" action="../VideoPepperToggleServlet" hidden>
                    
                    <input type="text" id="video-pepper-id" name="video-pepper-id" value="<%= pageNumber %>" />
                    <input type="text" id="video-pepper-account-number" name="video-pepper-account-number" value="<%= accountNumber %>" />
                    <input type="text" id="video-pepper-return-page" name="video-pepper-return-page" value="clients/users.jsp" />
                    <input type="submit" />
                    
                </form>
                    
                    
                
                <form id="feed-form" name="feed-form" method="post" target="_parent" action="../VideoFeed" hidden>
                    <input type="text" id="program-request-number" name="program-request-number" value="<%= pageNumber %>" hidden />
                    <input type="text" id="account-request-number" name="account-request-number" value="<%= accountNumber %>" hidden />
                    <input type="text" id="program-request-department" name="program-request-department" value="video" hidden />
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
    
        
        
            
            
            
                        
                      
        
        
        
        <div class=""></div>
            <div class="blackscreen">
                
                <iframe id="axiframe" width="720" height="405" src="<%= embed + "&autoplay=1&fs=1" %>" frameborder="0" allowFullScreen="allowFullScreen"></iframe>
                
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area">
                        
                                                        
                        
                    </div>
                    <div class="distributor-name-area">
                        <div id="program-name"><%= title %></div>
                        <div id="distributor-name"><%= channelTitle %></div>
                    </div>
                    
                </div>
             
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-right">
                    
                    
                    
                    <a class="clickable-text" href="javascript:displayShareControls();" title='Share this stream.' >
                        <span id="number-of-peppers"> &nbsp; </span><i class="fa fa-share" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Share</span>  &nbsp; &nbsp; 
                    </a>
                    <a class="clickable-text" href="javascript:displayPostControls();" title='Post a document, photo, or notice.' >
                        <span id="number-of-peppers"> &nbsp; </span><i class="fa fa-thumb-tack" style="font-size:15px;color:orangered"></i> &nbsp; <span id="number-of-peppers">Post (Word, PDF, .txt, photo, text.)</span>  &nbsp; &nbsp; 
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
                                
                        <form id="share-form" name="share-form" method="post" action="../TutorialBoardPostCreateServlet">
                            
                            <div class="share-interactions">

                                <div class="share-interactions-left">
                                    
                                    <textarea id="share-textarea" name="message" rows='4' cols='99' placeholder="Write a message too."></textarea>
                                    
                                </div>
                                
                                
                            </div><br>
                            
                            
                            <div class="share-top-left">
                                
                                <input type="text" id="request-video-id" name="video-id" value="<%= pageNumber %>" hidden />
                                <input type="text" id="request-board-id" name="board-id" value="<%= boardID %>" hidden />
                                <input type="text" id="request-client-id" name="client-id" value="<%= client.getClientID() %>" hidden />
                                <input type="text" id="title3" name="title" value="" hidden />
                                <input type="text" id="channel-title3" name="channel-title" value="" hidden />
                                <input type="text" id="thumbnail3" name="thumbnail" value="" hidden />
                                <input type="text" id="description3" name="description" value="" hidden />
                                
                                
                                <div class="share-top-right"><input type='button' id="cancel-button" class="btn" onclick="closeShareControls()" value="Cancel" /></div>
                            
                            </div>
                                
                                <input type='button' class="btn" onclick="shareToBoard()" value="Share" /> &nbsp;
                            
                        </form>
                            
                            
                                
                    </div>
                            
                            
                            
                            
                           
            <div id="upload-control-center">
                
                <div id="upload-control-selector">
                    
                    <div id="document-post-control"><button class="subnav" onclick="displayDocumentPostCenter()"><i class="fa fa-file-pdf-o" style="font-size:20px;color:#f40"></i><i class="fa fa-file-word-o" style="font-size:20px;color:#f40"></i> &nbsp; <b>Document</b></button></div>
                    <div id="photo-post-control"><button class="subnav" onclick="displayPhotoPostCenter()"><i class="fa fa-file-photo-o" style="font-size:20px;color:#f40"></i> &nbsp; <b>Photo</b></button></div>
                    <div id="notice-post-control"><button class="subnav" onclick="displayNoticePostCenter()"><i class="fa fa-file-text" style="font-size:20px;color:#f40"></i> &nbsp; <b>Notice</b></button></div>
                    
                </div>
                
                <div id="document-board-post-center">
                    
                    <form id="document-board-post-form" method="post" enctype="multipart/form-data" action="../DocumentBoardPostCreateServlet">
                        
                        <textarea rows="5" cols="100" name="document-post-message" placeholder="Post a notice about this document."></textarea>
                        <input required type="text" id="document-post-client-id" name="document-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="document-post-board-id" name="document-post-board-id" value="<%= boardID %>" hidden />
                        <input required type="file" id="document-post-file" name="document-post-file" 
                               accept="text/plain,application/pdf,application/x-pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,
                               application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation" />
                        <input type="submit" class="btn" value="Post"/>
                        
                        <input type='button' class="btn" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>
                
                <div id="photo-board-post-center">
                    
                    <form id="photo-board-post-form" method="post" enctype="multipart/form-data" action="../PhotoBoardPostCreateServlet">
                        
                        <textarea rows="5" cols="100" name="photo-post-message" placeholder="Post a notice about this photo."></textarea>
                        <input required type="text" id="photo-post-client-id" name="photo-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="photo-post-board-id" name="photo-post-board-id" value="<%= boardID %>" hidden />
                        <input required type="file" id="photo-post-file" name="photo-post-file" accept="image/*" />
                        <input type="submit" class="btn" value="Post"/>
                        
                        <input type='button' class="btn" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>
                
                <div id="notice-board-post-center">
                    
                    <form id="notice-board-post-form" method="post" action="../NoticeBoardPostCreateServlet">
                        
                        <textarea required rows="5" cols="100" name="notice-post-message" placeholder="Post a notice to all board members."></textarea>
                        <input required type="text" id="notice-post-client-id" name="notice-post-client-id" value="<%= client.getClientID() %>" hidden />
                        <input required type="text" id="notice-post-board-id" name="notice-post-board-id" value="<%= boardID %>" hidden />
                        <input type="submit" class="btn" value="Post"/>
                        
                        <input type='button' class="btn" onclick="closePostControls()" value="Cancel" />
                        
                    </form>
                    
                </div>

            </div>         
                            
                            
                    
                    
            <div id="dashboard">
                
                <div id="dashboard-head"><div  id="dashboard-left">Dashboard</div><div id="dashboard-right">This board is for <%= board.getMemberType() %> of <%= board.getTeamName() %> only and is hosted by <%= hostClientName %>.</div></div>
                    
                    
                    <div id="video-listing-area">
                        
                        
                        
                        <section>

                        <form id="search-form" name="search-form" onsubmit="return search()" hidden>

                        <div class="fieldcontainer">

                        <input type="search" id="query" class="search-field" placeholder="Search YouTube" />
                        <input type="submit" name="search-btn" id="search-btn" value="" />

                        </div>

                        </form>

                        <ul id="results"></ul>
                        <div id="buttons"></div>

                        </section>
                        
                        
                        
                      </div>
                        
                
            </div>
                                
                                
                                
                                
            <%
                    
                    
                    DateLineConversion conversion = null;
                    TutorialObjectBoardPostList postList = new TutorialObjectBoardPostList(boardID);
                    
                    
                    
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

                            

                            <div id="post-like-button"><span id="pepper-<%= documentPost.getCreationTime() %>"><%= documentPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerDocumentBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= documentPost.getDocumentID() %>', <%= documentPost.getClientID() %>, <%= documentPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span><span id="comment-<%= documentPost.getCreationTime() %>"><%= documentPost.getNumberOfPostComments() %></span> &nbsp; <a class="comment-link-design" href="javascript:readAllComments('<%= documentPost.getCreationTime() %>');"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Toggle comments</span></a></div>

                            

                        </div>
                        
                    </div>
                    <div id="all-comments-<%= documentPost.getCreationTime() %>" style="display:block;">
                        
                    
                    <%
                        
                        DocumentBoardPostCommentList commentList = new DocumentBoardPostCommentList(documentPost.getDocumentID(), boardID, documentPost.getClientID(), documentPost.getLongitudinalCreationDate());
                        
                        
                        for (int counter = 0; (counter < commentList.getSize()) && (commentList.getDocumentBoardPostComment(counter) != null); counter++)
                            
                        {
                            
                                        %>
                        
                        
                    <div class="comment-div">
                        <div class="comment-introductions">
                        <div class="comment-picture-div">
                            
                            
                    
                    <%
                                    
                                    if (commentList.getDocumentBoardPostComment(counter).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= commentList.getDocumentBoardPostComment(counter).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (commentList.getDocumentBoardPostComment(counter).getClientGender().equalsIgnoreCase("female")) {

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
                                    
                                    conversion = new DateLineConversion(commentList.getDocumentBoardPostComment(counter).getCommentCreationTime());
                                    
                                        %>
                            
                            
                            
                        </div>
                                        
                        <div class="comment-information-div">
                            
                            <div class="comment-client-name-div"><%= commentList.getDocumentBoardPostComment(counter).getClientName() %></div>
                            <div class="comment-creation-time-div"><%= conversion.getPostTimestamp() %></div>
                            
                            
                        </div>
                        </div>
                        <div class="comment-message-div"><%= commentList.getDocumentBoardPostComment(counter).getMessage() %></div>
                        
                    </div>
                        
                    
                                        
                    <%
                                    
                                    }

                                        %>
                                        
                                        
                                        
            </div>
                    <div id="post-comment-div">
                        
                        <div id="post-comment-picture-div">
                            
                            
                    
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
                                        
                                        
                            
                        </div>
                        <div id="post-comment-write-div">
                            
                            <div id="post-comment-textarea-div"><textarea class="document-post-comment-textarea" id="document-post-comment-textarea-<%= documentPost.getCreationTime() %>" rows="3" cols="66" placeholder="Write comment."></textarea></div>
                            <div id="post-comment-button-div">
                                
                                <input id="comment-button" class="btn" type="submit" onclick="registerDocumentBoardPostComment(<%= client.getClientID() %>, <%= boardID %>, '<%= documentPost.getDocumentID() %>', <%= documentPost.getClientID() %>, <%= documentPost.getCreationTime() %>)" value="Comment" />
                                
                            </div>
                            
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
                        
                        
                            
                        <div id="post-like-button"><span id="pepper-<%= joinPost.getCreationTime() %>"><%= joinPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerJoinBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, <%= joinPost.getClientID() %>, <%= joinPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span id="comment-<%= joinPost.getCreationTime() %>"><%= joinPost.getNumberOfPostComments() %></span> &nbsp; <a class="comment-link-design" href="javascript:readAllComments('<%= joinPost.getCreationTime() %>');"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Toggle comments</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                    <div id="all-comments-<%= joinPost.getCreationTime() %>" style="display:block;">
                        
                    
                    <%
                        
                        JoinBoardPostCommentList commentList = new JoinBoardPostCommentList(boardID, joinPost.getClientID(), joinPost.getLongitudinalCreationDate());
                        
                        
                        for (int counter = 0; (counter < commentList.getSize()) && (commentList.getJoinBoardPostComment(counter) != null); counter++)
                            
                        {
                            
                                        %>
                        
                        
                    <div class="comment-div">
                        <div class="comment-introductions">
                        <div class="comment-picture-div">
                            
                            
                    
                    <%
                                    
                                    if (commentList.getJoinBoardPostComment(counter).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= commentList.getJoinBoardPostComment(counter).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (commentList.getJoinBoardPostComment(counter).getClientGender().equalsIgnoreCase("female")) {

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
                                    
                                    conversion = new DateLineConversion(commentList.getJoinBoardPostComment(counter).getCommentCreationTime());
                                    
                                        %>
                            
                            
                            
                        </div>
                                        
                        <div class="comment-information-div">
                            
                            <div class="comment-client-name-div"><%= commentList.getJoinBoardPostComment(counter).getClientName() %></div>
                            <div class="comment-creation-time-div"><%= conversion.getPostTimestamp() %></div>
                            
                            
                        </div>
                        </div>
                        <div class="comment-message-div"><%= commentList.getJoinBoardPostComment(counter).getMessage() %></div>
                        
                    </div>
                        
                    
                                        
                    <%
                                    
                                    }

                                        %>
                                        
                                        
                                        
            </div>
                    <div id="post-comment-div">
                        
                        <div id="post-comment-picture-div">
                            
                            
                    
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
                                        
                                        
                            
                        </div>
                        <div id="post-comment-write-div">
                            
                            <div id="post-comment-textarea-div"><textarea class="join-post-comment-textarea" id="join-post-comment-textarea-<%= joinPost.getCreationTime() %>" rows="3" cols="66" placeholder="Write comment."></textarea></div>
                            <div id="post-comment-button-div">
                                
                                <input id="comment-button" class="btn" type="submit" onclick="registerJoinBoardPostComment(<%= client.getClientID() %>, <%= boardID %>, <%= joinPost.getClientID() %>, <%= joinPost.getCreationTime() %>)" value="Comment" />
                                
                            </div>
                            
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
                        
                        
                            
                        <div id="post-like-button"><span id="pepper-<%= noticePost.getCreationTime() %>"><%= noticePost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerNoticeBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, <%= noticePost.getClientID() %>, <%= noticePost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span id="comment-<%= noticePost.getCreationTime() %>"><%= noticePost.getNumberOfPostComments() %></span> &nbsp; <a class="comment-link-design" href="javascript:readAllComments('<%= noticePost.getCreationTime() %>');"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Toggle comments</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                    <div id="all-comments-<%= noticePost.getCreationTime() %>" style="display:block;">
                        
                    
                    <%
                        
                        NoticeBoardPostCommentList commentList = new NoticeBoardPostCommentList(boardID, noticePost.getClientID(), noticePost.getLongitudinalCreationDate());
                        
                        
                        for (int counter = 0; (counter < commentList.getSize()) && (commentList.getNoticeBoardPostComment(counter) != null); counter++)
                            
                        {
                            
                                        %>
                        
                        
                    <div class="comment-div">
                        <div class="comment-introductions">
                        <div class="comment-picture-div">
                            
                            
                    
                    <%
                                    
                                    if (commentList.getNoticeBoardPostComment(counter).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= commentList.getNoticeBoardPostComment(counter).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (commentList.getNoticeBoardPostComment(counter).getClientGender().equalsIgnoreCase("female")) {

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

                                    conversion = new DateLineConversion(commentList.getNoticeBoardPostComment(counter).getCommentCreationTime());
                                    
                                        %>
                            
                            
                            
                        </div>
                                        
                        <div class="comment-information-div">
                            
                            <div class="comment-client-name-div"><%= commentList.getNoticeBoardPostComment(counter).getClientName() %></div>
                            <div class="comment-creation-time-div"><%= conversion.getPostTimestamp() %></div>
                            
                            
                        </div>
                        </div>
                        <div class="comment-message-div"><%= commentList.getNoticeBoardPostComment(counter).getMessage() %></div>
                        
                    </div>
                        
                    
                                        
                    <%
                                    
                                    }

                                        %>
                                        
                                        
                                        
            </div>
                    <div id="post-comment-div">
                        
                        <div id="post-comment-picture-div">
                            
                            
                    
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
                                        
                                        
                            
                        </div>
                        <div id="post-comment-write-div">
                            
                            <div id="post-comment-textarea-div"><textarea class="notice-post-comment-textarea" id="notice-post-comment-textarea-<%= noticePost.getCreationTime() %>" rows="3" cols="66" placeholder="Write comment."></textarea></div>
                            <div id="post-comment-button-div">
                                
                                <input id="comment-button" class="btn" type="submit" onclick="registerNoticeBoardPostComment(<%= client.getClientID() %>, <%= boardID %>, <%= noticePost.getClientID() %>, <%= noticePost.getCreationTime() %>)" value="Comment" />
                                
                            </div>
                            
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



                            <div id="post-like-button"><span id="pepper-<%= photoPost.getCreationTime() %>"><%= photoPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerPhotoBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= photoPost.getPhotoID() %>', <%= photoPost.getClientID() %>, <%= photoPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span id="comment-<%= photoPost.getCreationTime() %>"><%= photoPost.getNumberOfPostComments() %></span> &nbsp; <a class="comment-link-design" href="javascript:readAllComments('<%= photoPost.getCreationTime() %>');"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Toggle comments</span></a></div>

                            

                        </div>

                    </div>
                    <div id="all-comments-<%= photoPost.getCreationTime() %>" style="display:block;">
                        
                    
                    <%
                        
                        PhotoBoardPostCommentList commentList = new PhotoBoardPostCommentList(photoPost.getPhotoID(), boardID, photoPost.getClientID(), photoPost.getLongitudinalCreationDate());
                        
                        
                        for (int counter = 0; (counter < commentList.getSize()) && (commentList.getPhotoBoardPostComment(counter) != null); counter++)
                            
                        {
                            
                                        %>
                        
                        
                    <div class="comment-div">
                        <div class="comment-introductions">
                        <div class="comment-picture-div">
                            
                            
                    
                    <%
                                    
                                    if (commentList.getPhotoBoardPostComment(counter).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= commentList.getPhotoBoardPostComment(counter).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (commentList.getPhotoBoardPostComment(counter).getClientGender().equalsIgnoreCase("female")) {

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

                                    conversion = new DateLineConversion(commentList.getPhotoBoardPostComment(counter).getCommentCreationTime());
                                    
                                        %>
                            
                            
                            
                        </div>
                                        
                        <div class="comment-information-div">
                            
                            <div class="comment-client-name-div"><%= commentList.getPhotoBoardPostComment(counter).getClientName() %></div>
                            <div class="comment-creation-time-div"><%= conversion.getPostTimestamp() %></div>
                            
                            
                        </div>
                        </div>
                        <div class="comment-message-div"><%= commentList.getPhotoBoardPostComment(counter).getMessage() %></div>
                        
                    </div>
                        
                    
                                        
                    <%
                                    
                                    }

                                        %>
                                        
                                        
                                        
            </div>
                    <div id="post-comment-div">
                        
                        <div id="post-comment-picture-div">
                            
                            
                    
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
                                        
                                        
                            
                        </div>
                        <div id="post-comment-write-div">
                            
                            <div id="post-comment-textarea-div"><textarea class="photo-post-comment-textarea" id="photo-post-comment-textarea-<%= photoPost.getCreationTime() %>" rows="3" cols="66" placeholder="Write comment."></textarea></div>
                            <div id="post-comment-button-div">
                                
                                <input id="comment-button" class="btn" type="submit" onclick="registerPhotoBoardPostComment(<%= client.getClientID() %>, <%= boardID %>, '<%= photoPost.getPhotoID() %>', <%= photoPost.getClientID() %>, <%= photoPost.getCreationTime() %>)" value="Comment" />
                                
                            </div>
                            
                        </div>
                        
                    </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
                    TutorialBoardPost firstTutorialPost = null;
            
            if (postList.getObjectBoardPost(count) instanceof TutorialBoardPost)
                
            {
                    
                    TutorialBoardPost tutorialPost = (TutorialBoardPost) postList.getObjectBoardPost(count);
                    
                    if (firstTutorialPost == null)
                    
                    {
                        firstTutorialPost = (TutorialBoardPost) postList.getObjectBoardPost(count);
                    }
                
                    
                %>
            
            
            <div id="share-post">
                    
                    <div id="share-post-header">
                        
                        <div id="share-post-header-left">
                            
                            
                    
                    <%

                                    if (tutorialPost.getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= tutorialPost.getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (tutorialPost.getClientGender().equalsIgnoreCase("female")) {

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
                            
                            conversion = new DateLineConversion(tutorialPost.getCreationTime());

                                        %>
                            
                        </div>
                        <div id="share-post-header-right"><b><%= tutorialPost.getClientName() %></b> shared <b><%= tutorialPost.getTitle() %></b>.</div>
                    
                    </div>
                    <div id="share-poster-background">
                        
                        <iframe width="480" height="270" src="<%= tutorialPost.getVideoLocation() %>" frameborder="0" allowFullScreen></iframe>
                    
                    </div>
                        <div id="share-post-description"><%= tutorialPost.getMessage() %> <br><br><hr><br> <%= tutorialPost.getDescription() %> </div>
                    <div id="share-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                    <div id="share-post-feedback-write">
                        
                    <div class="share-post-feedback-write-area">



                            <div id="post-like-button"><span id="pepper-<%= tutorialPost.getCreationTime() %>"><%= tutorialPost.getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerTutorialBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= tutorialPost.getVideoID() %>', <%= tutorialPost.getClientID() %>, <%= tutorialPost.getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span id="comment-<%= tutorialPost.getCreationTime() %>"><%= tutorialPost.getNumberOfPostComments() %></span> &nbsp; <a class="comment-link-design" href="javascript:readAllComments('<%= tutorialPost.getCreationTime() %>');"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Toggle comments</span></a></div>

                            

                        </div>
                        
                    </div>
                            <div id="all-comments-<%= tutorialPost.getCreationTime() %>" style="display:block;">
                        
                    
                    <%
                        
                        TutorialBoardPostCommentList commentList = new TutorialBoardPostCommentList(tutorialPost.getVideoID(), boardID, tutorialPost.getClientID(), tutorialPost.getLongitudinalCreationDate());
                        
                        
                        for (int counter = 0; (counter < commentList.getSize()) && (commentList.getTutorialBoardPostComment(counter) != null); counter++)
                            
                        {
                            
                                        %>
                        
                        
                    <div class="comment-div">
                        <div class="comment-introductions">
                        <div class="comment-picture-div">
                            
                            
                    
                    <%
                                    
                                    if (commentList.getTutorialBoardPostComment(counter).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= commentList.getTutorialBoardPostComment(counter).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (commentList.getTutorialBoardPostComment(counter).getClientGender().equalsIgnoreCase("female")) {

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

                                    conversion = new DateLineConversion(commentList.getTutorialBoardPostComment(counter).getCommentCreationTime());
                                    
                                        %>
                            
                            
                            
                        </div>
                                        
                        <div class="comment-information-div">
                            
                            <div class="comment-client-name-div"><%= commentList.getTutorialBoardPostComment(counter).getClientName() %></div>
                            <div class="comment-creation-time-div"><%= conversion.getPostTimestamp() %></div>
                            
                            
                        </div>
                        </div>
                        <div class="comment-message-div"><%= commentList.getTutorialBoardPostComment(counter).getMessage() %></div>
                        
                    </div>
                        
                    
                                        
                    <%
                                    
                                    }

                                        %>
                                        
                                        
                                        
            </div>
                    <div id="post-comment-div">
                        
                        <div id="post-comment-picture-div">
                            
                            
                    
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
                                        
                                        
                            
                        </div>
                        <div id="post-comment-write-div">
                            
                            <div id="post-comment-textarea-div"><textarea class="post-comment-textarea" id="post-comment-textarea-<%= tutorialPost.getCreationTime() %>" rows="3" cols="66" placeholder="Write comment."></textarea></div>
                            <div id="post-comment-button-div">
                                
                                <input id="comment-button" class="btn" type="submit" onclick="registerTutorialBoardPostComment(<%= client.getClientID() %>, <%= boardID %>, '<%= tutorialPost.getVideoID() %>', <%= tutorialPost.getClientID() %>, <%= tutorialPost.getCreationTime() %>)" value="Comment" />
                                
                            </div>
                            
                        </div>
                        
                    </div>
                
            </div>
                    
            
        
        
        <%
            }

            if (firstTutorialPost != null)

            {

        %>
        
        
        <iframe onload="fillScreen('<%= firstTutorialPost.getVideoID() %>', '<%= firstTutorialPost.getTitle() %>', '<%= firstTutorialPost.getChannelTitle() %>')" src='' hidden></iframe>
        

        <%
            
            }
            
        }

        %>
               
        
        
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                        
                        ClientRetrieve boardClient = new ClientRetrieve(board.getClientID(), "client");
                        

                                    if (boardClient.getProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= boardClient.getProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (boardClient.getGender().equalsIgnoreCase("female")) {

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
        
        
            
                    
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                        
                                    
                                    if (boardClient.getProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= boardClient.getProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (boardClient.getGender().equalsIgnoreCase("female")) {

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
                            
                            conversion = new DateLineConversion(board.getRegistrationDate());

                                        %>
                        
                    </div>
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
                    
                    
                    TutorialRequestBoardPostList requestPostList = new TutorialRequestBoardPostList(boardID);
                    
                    
                    
                    %>
                    
                    
                    
        
        
        <div id="posts-left">
            
            
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < requestPostList.length()) && (requestPostList.getTutorialRequestBoardPost(count) != null); count++)
                
            {
                

        %>
        
        
        
            
            
            
            <div id="stream-post">
                
                <div id="stream-post-header">
                    
                    <div id="stream-post-header-top">
                        
                        <div id="stream-post-header-left">
                            
                            
                    
                    <%

                                    if (requestPostList.getTutorialRequestBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="stream-request-commenter-pic" src="<%= requestPostList.getTutorialRequestBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (requestPostList.getTutorialRequestBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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

                                        %>
                                        
                                        
                            
                        </div>
                        <div id="stream-post-header-right"><%= requestPostList.getTutorialRequestBoardPost(count).getClientName() %> requested:</div>
                        
                    </div>
                    <div id="stream-post-header-bottom"><b><%= requestPostList.getTutorialRequestBoardPost(count).getTitle() %></b></div>
                
                </div>
                <div id="stream-poster-background">
                    
                    <img id="stream-poster-background-image" src="<%= requestPostList.getTutorialRequestBoardPost(count).getThumbnail() %>" alt="poster"/><br><br>
                    
                </div>


                                        <%
                            
                            conversion = new DateLineConversion(requestPostList.getTutorialRequestBoardPost(count).getCreationTime());

                                        %>
                                        
                                        
                <div id="stream-post-feedback-read"><%= conversion.getPostTimestamp() %></div>
                <div id="stream-post-feedback-write">
                
                <div class="stream-post-feedback-write-area">
                        
                        
                            
                        <div id="stream-like-button"><span id="request-pepper-<%= requestPostList.getTutorialRequestBoardPost(count).getCreationTime() %>"><%= requestPostList.getTutorialRequestBoardPost(count).getNumberOfPostPeppers() %></span> &nbsp; <a class="pep-link-design" href="javascript:registerTutorialRequestBoardPostPep(<%= client.getClientID() %>, <%= boardID %>, '<%= requestPostList.getTutorialRequestBoardPost(count).getVideoID() %>', <%= requestPostList.getTutorialRequestBoardPost(count).getClientID() %>, <%= requestPostList.getTutorialRequestBoardPost(count).getCreationTime() %>);"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            
                        
                        
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
var type = "video";
var business = "rental";
        
var myVideo = document.getElementById("movieteaser"); 
var channel = ["https://www.youtube.com/embed/BQ0mxQXmLsk?rel=0", "https://www.youtube.com/embed/k2qgadSvNyU?rel=0", "https://www.youtube.com/embed/-MsvER1dpjM?rel=0", "https://www.youtube.com/embed/GMFewiplIbw?rel=0"];

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

function transferVideoByID(videoID)

{
    packageID = videoID;
    type = "video";
    var boardID = window.parent.document.getElementById("board-id-span").value;
    var endpoint = "board.jsp?board-id-request=" + boardID + "&page-request-number=" + videoID;
    
    if (videoID > 0)
        
    {
        document.getElementById("page-request-number").value = videoID;
        document.getElementById("page-request-form").action = endpoint;
        window.parent.document.getElementById("middle").src = "users.jsp";
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
    
    document.getElementById("title3").value = window.parent.document.getElementById("tutorial-title").value;
    document.getElementById("channel-title3").value = window.parent.document.getElementById("channel-title").value;
    document.getElementById("thumbnail3").value = window.parent.document.getElementById("thumbnail").value;
    document.getElementById("description3").value = window.parent.document.getElementById("description").value;
    
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
    document.getElementById("title3").value = window.parent.document.getElementById("tutorial-title").value;
    document.getElementById("channel-title3").value = window.parent.document.getElementById("channel-title").value;
    document.getElementById("thumbnail3").value = window.parent.document.getElementById("thumbnail").value;
    document.getElementById("description3").value = window.parent.document.getElementById("description").value;
    
   document.getElementById("share-form").submit();
}


function displayShareControls() 

{
    document.getElementById("title3").value = window.parent.document.getElementById("tutorial-title").value;
    document.getElementById("channel-title3").value = window.parent.document.getElementById("channel-title").value;
    document.getElementById("thumbnail3").value = window.parent.document.getElementById("thumbnail").value;
    document.getElementById("description3").value = window.parent.document.getElementById("description").value;
   document.getElementById('share-controls-div').style.display = "block";
}

function closeShareControls() 

{
   document.getElementById('share-controls-div').style.display = "none";
}

function displayPostControls() 

{
   document.getElementById('post-controls-div').style.display = "block";
}

function closePostControls() 

{
   document.getElementById('post-controls-div').style.display = "none";
}

function submitVideoPepperSubmitForm()

{
    document.forms["video-pepper-submit-form"].submit();
}

// When the user clicks on div, open the popup
function myFunction() 

{
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}

function displayPostControls() 

{
   document.getElementById('upload-control-center').style.display = "block";
}

function closePostControls() 

{
   document.getElementById('upload-control-center').style.display = "none";
}

function submitMoviePepperSubmitForm()

{
    document.forms["movie-pepper-submit-form"].submit();
}

function displayDocumentPostCenter()

{
    document.getElementById("document-board-post-center").style.display = "block";
    document.getElementById("photo-board-post-center").style.display = "none";
    document.getElementById("notice-board-post-center").style.display = "none";
    document.getElementById("document-post-control").style.backgroundColor = "#eee";
    document.getElementById("photo-post-control").style.backgroundColor = "#fff";
    document.getElementById("notice-post-control").style.backgroundColor = "#fff";
}

function displayPhotoPostCenter()

{
    document.getElementById("document-board-post-center").style.display = "none";
    document.getElementById("photo-board-post-center").style.display = "block";
    document.getElementById("notice-board-post-center").style.display = "none";
    document.getElementById("document-post-control").style.backgroundColor = "#fff";
    document.getElementById("photo-post-control").style.backgroundColor = "#eee";
    document.getElementById("notice-post-control").style.backgroundColor = "#fff";
}

function displayNoticePostCenter()

{
    document.getElementById("document-board-post-center").style.display = "none";
    document.getElementById("photo-board-post-center").style.display = "none";
    document.getElementById("notice-board-post-center").style.display = "block";
    document.getElementById("document-post-control").style.backgroundColor = "#fff";
    document.getElementById("photo-post-control").style.backgroundColor = "#fff";
    document.getElementById("notice-post-control").style.backgroundColor = "#eee";
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
                document.getElementById("pepper-" + postCreationTime + "").innerHTML = numberOfPeppers;
                
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
                document.getElementById("pepper-" + postCreationTime + "").innerHTML = numberOfPeppers;
                
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
                document.getElementById("pepper-" + postCreationTime + "").innerHTML = numberOfPeppers;
                
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
                document.getElementById("pepper-" + postCreationTime + "").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../JoinBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerTutorialBoardPostPep(pepperClientID, boardID, videoID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                document.getElementById("pepper-" + postCreationTime + "").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&video-id=" + videoID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../TutorialBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerTutorialRequestBoardPostPep(pepperClientID, boardID, videoID, postClientID, postCreationTime)

{
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                
                var numberOfPeppers = xml.responseXML.getElementsByTagName("peppers")[0].firstChild.nodeValue;
                var postID = "request-pepper-" + postCreationTime;
                document.getElementById("" + postID + "").innerHTML = numberOfPeppers;
                
            }
            
        }
        
    };
    
    var post = "pepper-client-id=" + pepperClientID + "&post-client-id=" + postClientID + "&video-id=" + videoID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../TutorialRequestBoardPostPepperCreateServlet?" + post, true);
    xml.send();
    
    
}

function readAllComments(postCreationTime)

{
        
        if (document.getElementById("all-comments-" + postCreationTime + "").style.display === "block")
        
        {
            document.getElementById("all-comments-" + postCreationTime + "").style.display = "none";
        }
        
        else if (document.getElementById("all-comments-" + postCreationTime + "").style.display === "none")
            
        {
            document.getElementById("all-comments-" + postCreationTime + "").style.display = "block";
        }
    
}

function registerTutorialBoardPostComment(commentClientID, boardID, videoID, postClientID, postCreationTime)

{
    var message = document.getElementById("post-comment-textarea-" + postCreationTime + "").value;
    document.getElementById("post-comment-textarea-" + postCreationTime + "").value = "";
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                var comment = xml.responseXML.getElementsByTagName("Comment")[0];
                
                var numberOfComments = comment.getElementsByTagName("size")[0].firstChild.nodeValue;
                var commentClientName = comment.getElementsByTagName("commenter")[0].firstChild.nodeValue;
                var commentTimestamp = comment.getElementsByTagName("timestamp")[0].firstChild.nodeValue;
                
                
                <%
                    
                    if (client.getProfilePicture() != null)
                    
                    {
                    
                    %>
                                        
                          var profilePicture = "<%= client.getProfilePicture() %>";
                          
                    <%
                    
                    }

                    else
                    
                    {

                        if (client.getGender().equalsIgnoreCase("male"))

                        {
                    
                    %>
                                        
                          profilePicture = "../male.jpg";              
                                        
                     <%
                    
                        }

                        else

                        {
                    
                    %>   
                                        
                          profilePicture = "../female.jpg";               
                                        
                     <%
                         }
                    
                    }
                    
                    %>                  
                                        
                
                var append = "<div class=\"comment-div\"><div class=\"comment-introductions\"><div class=\"comment-picture-div\">" + 
                                        "<img class=\"distributor-logo-area\" src=\"" + profilePicture + "\" alt=\"wallpaper\" />" + 
                        "</div><div class=\"comment-information-div\"><div class=\"comment-client-name-div\">" + commentClientName + "</div>" + 
                            "<div class=\"comment-creation-time-div\">" + commentTimestamp + "</div></div></div><div class=\"comment-message-div\">" + message + "</div></div>";
                
                document.getElementById("comment-" + postCreationTime + "").innerHTML = numberOfComments;
                document.getElementById("all-comments-" + postCreationTime + "").innerHTML += append;
                
            }
            
        }
        
    };
    
    var post = "comment-client-id=" + commentClientID + "&message=" + message + "&post-client-id=" + postClientID + "&video-id=" + videoID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../TutorialBoardPostCommentCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerDocumentBoardPostComment(commentClientID, boardID, documentID, postClientID, postCreationTime)

{
    var message = document.getElementById("document-post-comment-textarea-" + postCreationTime + "").value;
    document.getElementById("document-post-comment-textarea-" + postCreationTime + "").value = "";
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                var comment = xml.responseXML.getElementsByTagName("Comment")[0];
                
                var numberOfComments = comment.getElementsByTagName("size")[0].firstChild.nodeValue;
                var commentClientName = comment.getElementsByTagName("commenter")[0].firstChild.nodeValue;
                var commentTimestamp = comment.getElementsByTagName("timestamp")[0].firstChild.nodeValue;
                
                
                <%
                    
                    if (client.getProfilePicture() != null)
                    
                    {
                    
                    %>
                                        
                          var profilePicture = "<%= client.getProfilePicture() %>";
                          
                    <%
                    
                    }

                    else
                    
                    {

                        if (client.getGender().equalsIgnoreCase("male"))

                        {
                    
                    %>
                                        
                          profilePicture = "../male.jpg";              
                                        
                     <%
                    
                        }

                        else

                        {
                    
                    %>   
                                        
                          profilePicture = "../female.jpg";               
                                        
                     <%
                         }
                    
                    }
                    
                    %>                  
                                        
                
                var append = "<div class=\"comment-div\"><div class=\"comment-introductions\"><div class=\"comment-picture-div\">" + 
                                        "<img class=\"distributor-logo-area\" src=\"" + profilePicture + "\" alt=\"wallpaper\" />" + 
                        "</div><div class=\"comment-information-div\"><div class=\"comment-client-name-div\">" + commentClientName + "</div>" + 
                            "<div class=\"comment-creation-time-div\">" + commentTimestamp + "</div></div></div><div class=\"comment-message-div\">" + message + "</div></div>";
                
                document.getElementById("comment-" + postCreationTime + "").innerHTML = numberOfComments;
                document.getElementById("all-comments-" + postCreationTime + "").innerHTML += append;
                
            }
            
        }
        
    };
    
    var post = "comment-client-id=" + commentClientID + "&message=" + message + "&post-client-id=" + postClientID + "&document-id=" + documentID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../DocumentBoardPostCommentCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerJoinBoardPostComment(commentClientID, boardID, postClientID, postCreationTime)

{
    var message = document.getElementById("join-post-comment-textarea-" + postCreationTime + "").value;
    document.getElementById("join-post-comment-textarea-" + postCreationTime + "").value = "";
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                var comment = xml.responseXML.getElementsByTagName("Comment")[0];
                
                var numberOfComments = comment.getElementsByTagName("size")[0].firstChild.nodeValue;
                var commentClientName = comment.getElementsByTagName("commenter")[0].firstChild.nodeValue;
                var commentTimestamp = comment.getElementsByTagName("timestamp")[0].firstChild.nodeValue;
                
                
                <%
                    
                    if (client.getProfilePicture() != null)
                    
                    {
                    
                    %>
                                        
                          var profilePicture = "<%= client.getProfilePicture() %>";
                          
                    <%
                    
                    }

                    else
                    
                    {

                        if (client.getGender().equalsIgnoreCase("male"))

                        {
                    
                    %>
                                        
                          profilePicture = "../male.jpg";              
                                        
                     <%
                    
                        }

                        else

                        {
                    
                    %>   
                                        
                          profilePicture = "../female.jpg";               
                                        
                     <%
                         }
                    
                    }
                    
                    %>                  
                                        
                
                var append = "<div class=\"comment-div\"><div class=\"comment-introductions\"><div class=\"comment-picture-div\">" + 
                                        "<img class=\"distributor-logo-area\" src=\"" + profilePicture + "\" alt=\"wallpaper\" />" + 
                        "</div><div class=\"comment-information-div\"><div class=\"comment-client-name-div\">" + commentClientName + "</div>" + 
                            "<div class=\"comment-creation-time-div\">" + commentTimestamp + "</div></div></div><div class=\"comment-message-div\">" + message + "</div></div>";
                
                document.getElementById("comment-" + postCreationTime + "").innerHTML = numberOfComments;
                document.getElementById("all-comments-" + postCreationTime + "").innerHTML += append;
                
            }
            
        }
        
    };
    
    var post = "comment-client-id=" + commentClientID + "&message=" + message + "&post-client-id=" + postClientID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../JoinBoardPostCommentCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerNoticeBoardPostComment(commentClientID, boardID, postClientID, postCreationTime)

{
    var message = document.getElementById("notice-post-comment-textarea-" + postCreationTime + "").value;
    document.getElementById("notice-post-comment-textarea-" + postCreationTime + "").value = "";
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                var comment = xml.responseXML.getElementsByTagName("Comment")[0];
                
                var numberOfComments = comment.getElementsByTagName("size")[0].firstChild.nodeValue;
                var commentClientName = comment.getElementsByTagName("commenter")[0].firstChild.nodeValue;
                var commentTimestamp = comment.getElementsByTagName("timestamp")[0].firstChild.nodeValue;
                
                
                <%
                    
                    if (client.getProfilePicture() != null)
                    
                    {
                    
                    %>
                                        
                          var profilePicture = "<%= client.getProfilePicture() %>";
                          
                    <%
                    
                    }

                    else
                    
                    {

                        if (client.getGender().equalsIgnoreCase("male"))

                        {
                    
                    %>
                                        
                          profilePicture = "../male.jpg";              
                                        
                     <%
                    
                        }

                        else

                        {
                    
                    %>   
                                        
                          profilePicture = "../female.jpg";               
                                        
                     <%
                         }
                    
                    }
                    
                    %>                  
                                        
                
                var append = "<div class=\"comment-div\"><div class=\"comment-introductions\"><div class=\"comment-picture-div\">" + 
                                        "<img class=\"distributor-logo-area\" src=\"" + profilePicture + "\" alt=\"wallpaper\" />" + 
                        "</div><div class=\"comment-information-div\"><div class=\"comment-client-name-div\">" + commentClientName + "</div>" + 
                            "<div class=\"comment-creation-time-div\">" + commentTimestamp + "</div></div></div><div class=\"comment-message-div\">" + message + "</div></div>";
                
                document.getElementById("comment-" + postCreationTime + "").innerHTML = numberOfComments;
                document.getElementById("all-comments-" + postCreationTime + "").innerHTML += append;
                
            }
            
        }
        
    };
    
    var post = "comment-client-id=" + commentClientID + "&message=" + message + "&post-client-id=" + postClientID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../NoticeBoardPostCommentCreateServlet?" + post, true);
    xml.send();
    
    
}

function registerPhotoBoardPostComment(commentClientID, boardID, photoID, postClientID, postCreationTime)

{
    var message = document.getElementById("photo-post-comment-textarea-" + postCreationTime + "").value;
    document.getElementById("photo-post-comment-textarea-" + postCreationTime + "").value = "";
    
    var xml = new XMLHttpRequest();
    
    xml.onreadystatechange = function() {
        
        if (xml.readyState == 4)
            
        {
            
            if (xml.status == 200)
                
            {
                var comment = xml.responseXML.getElementsByTagName("Comment")[0];
                
                var numberOfComments = comment.getElementsByTagName("size")[0].firstChild.nodeValue;
                var commentClientName = comment.getElementsByTagName("commenter")[0].firstChild.nodeValue;
                var commentTimestamp = comment.getElementsByTagName("timestamp")[0].firstChild.nodeValue;
                
                
                <%
                    
                    if (client.getProfilePicture() != null)
                    
                    {
                    
                    %>
                                        
                          var profilePicture = "<%= client.getProfilePicture() %>";
                          
                    <%
                    
                    }

                    else
                    
                    {

                        if (client.getGender().equalsIgnoreCase("male"))

                        {
                    
                    %>
                                        
                          profilePicture = "../male.jpg";              
                                        
                     <%
                    
                        }

                        else

                        {
                    
                    %>   
                                        
                          profilePicture = "../female.jpg";               
                                        
                     <%
                         }
                    
                    }
                    
                    %>                  
                                        
                
                var append = "<div class=\"comment-div\"><div class=\"comment-introductions\"><div class=\"comment-picture-div\">" + 
                                        "<img class=\"distributor-logo-area\" src=\"" + profilePicture + "\" alt=\"wallpaper\" />" + 
                        "</div><div class=\"comment-information-div\"><div class=\"comment-client-name-div\">" + commentClientName + "</div>" + 
                            "<div class=\"comment-creation-time-div\">" + commentTimestamp + "</div></div></div><div class=\"comment-message-div\">" + message + "</div></div>";
                
                document.getElementById("comment-" + postCreationTime + "").innerHTML = numberOfComments;
                document.getElementById("all-comments-" + postCreationTime + "").innerHTML += append;
                
            }
            
        }
        
    };
    
    var post = "comment-client-id=" + commentClientID + "&message=" + message + "&post-client-id=" + postClientID + "&photo-id=" + photoID + "&board-id=" + boardID + "&post-creation-time=" + postCreationTime;
    
    xml.open("GET", "../PhotoBoardPostCommentCreateServlet?" + post, true);
    xml.send();
    
    
}

                        
                        
$(function() {

var searchField = $(this).parent().attr('#query');
var icon = $(this).parent().attr('#search-btn');

//focus handler
$(searchField).on('focus', function() {

$(this).animate({width: '100%'}, 400);
$(icon).animate({right: '10px'}, 400);

});

//blur event handler
$(searchField).on('blur', function() {

if (searchField.val() == '')

{
$(searchField).animate({width: '45%'}, 400, function(){});
$(icon).animate({right: '360px'}, 400, function(){});
}

});

$('#search-form').submit(function(e) {e.preventDefault();});


})


function search()

{
    document.getElementById("query").value = window.parent.document.getElementById("query").value;
    
    
//clear previous results
$('#results').html('');
$('#buttons').html('');
$('#dashboard').css("height", "1180px");
$('#video-listing-area').css("height", "1130px");



var navigationFn = {
    goToSection: function(id) {
        $('html, body').animate({
            scrollTop: $(id).offset().top
        }, 0);
    }
}

navigationFn.goToSection('#dashboard');



//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

document.getElementById("#results").scrollIntoView();

}


function loadAXIFrame(videoId, title, channelTitle, thumb, description)

{
    var boardID = window.parent.document.getElementById("board-id-span").value;
    var endpoint = "board.jsp?board-id-request=" + boardID + "&page-request-number=" + videoId;
    
    document.getElementById("page-request-number").value = videoId;
    document.getElementById("page-request-number-re").value = videoId;
    document.getElementById("page-request-form").action = endpoint;
    document.getElementById("title2").value = title;
    document.getElementById("channel-title2").value = channelTitle;
    document.getElementById("thumbnail2").value = thumb;
    document.getElementById("description2").value = description;
    window.parent.document.getElementById("middle").src = "tutorials.jsp";
    document.getElementById("page-request-form").submit();
    
}


function getOutput(item)

{
var videoId = item.id.videoId;
var title = item.snippet.title;
var description = item.snippet.description;
var thumb = item.snippet.thumbnails.high.url;
var channelTitle = item.snippet.channelTitle;
var videoDate = item.snippet.publishedAt;


   
        title = title.replace(/["']/g, "");
        channelTitle = channelTitle.replace(/["']/g, "");
        description = description.replace(/["']/g, "");


var output = '<li>' + '<div class="list-left">' + '<a href="javascript:loadAXIFrame(\'' + videoId + '\', \'' + title + '\', \'' + channelTitle + '\', \'' + thumb + '\', \'' + description + '\');"><img src="' + thumb + '"></a></div>' + 
'<div class="list-right"><a href="javascript:loadAXIFrame(\'' + videoId + '\', \'' + title + '\', \'' + channelTitle + '\', \'' + thumb + '\', \'' + description + '\');"><h3>' + title + '</h3></a>' 
+ '<small>By <span class="cTitle">' + channelTitle + '</span> on ' + videoDate + '</small>'
+ '<p>' + description + '</p>' 
+ '</div></li>'
+ '<div class="clearfix"></div>'
+ '';

return output;

}


function prevPage()

{
var token = $('#prev-button').data('token');
var q = $('#prev-button').data('query');

//clear previous results
$('#results').html('');
$('#buttons').html('');

//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
pageToken: token,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

}


function nextPage()

{
var token = $('#next-button').data('token');
var q = $('#next-button').data('query');

//clear previous results
$('#results').html('');
$('#buttons').html('');

//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
pageToken: token,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

}



function getButtons(prevPageToken, nextPageToken)

{
var btnoutput = 'Buttons';

if (!prevPageToken)

{
btnoutput = '<div class="button-container">' +
'<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' + 
'onclick="nextPage();">Next Page</button></div>';
}

else

{
btnoutput = '<div class="button-container">' +
'<button id="prev-button" class="paging-button" data-token="' + prevPageToken + '" data-query="' + q + '"' + 
'onclick="prevPage();">Previous Page</button></div>' + 
'<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' + 
'onclick="nextPage();">Next Page</button></div>';
}

return btnoutput;

}








    
    
</script>
        
    </body>
</html>
