<%-- 
    Document   : board-log
    Created on : 17-Sep-2016, 1:28:51 AM
    Author     : El Jefe
--%>

<%@page import="board.BoardRetrieve"%>
<%@page import="client.ClientRetrieve"%>
<%@page import="document.board.posts.DocumentBoardPostList"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
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
  
  .screen
  {
                width: 800px;
                height: 450px;
                background-color: #000;
                float: none;
                box-shadow: 0px 5px 6px #999;
                margin-top: 5px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 5px;
  }
  
  #post-field
            {
                margin: 25px auto 25px auto;
                width: 790px;
                height: 300px;
                background-color: #fff;
                float: none;
                padding: 5px 5px 5px 5px;
                
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
  
#controls
{
    width: 800px;
    height: 100px;
    background-color: #fff;
    float: none;
    box-shadow: 0px 1px px #ccc;
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

.upper-interactions
  {
      width: 800px;
      height: 65px;
      background-color: #fff;
      box-shadow: 0 1px 0px #aaa;
      margin-bottom: 1px;
      margin-left: auto;
    margin-right: auto;
  }
  
  .lower-interactions
  {
      width: 800px;
      height: 35px;
      background-color: #fff;
      margin-bottom: 10px;
      margin-left: auto;
    margin-right: auto;
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
  
  .distributor-name-area
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 24px;
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
      height: 620px;
      margin-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      margin-bottom: 10px;
  }
  
  #post-collapsed
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
  
  #post-event-field
  {
    height: 130px;
    background-color: #ccc;
    float: none;
    width: 800px;
    margin-top: 15px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 15px;
    padding-top: 10px;
  }
  
  #post-event-area
  {
      width: 722px;
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

#posts-left
{
    min-height: 200px;
    width: 0%;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 0%;
    margin-right: 0%;
    float: left;
}

#posts-right
{
    min-height: 200px;
    width: 100%;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 0%;
    margin-right: 0%;
    float: left;
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
    width: 610px;
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
    width: 705px;
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
    
  .distributor-logo-area
  {
      float: left;
      width: 50px;
      height: 50px;
      border-radius: 25px;
      background-image: url("../disney.jpg");
      background-size: contain;
  }
  
  #passageway
  {
      width: 720px;
      padding-top: 2px;
      margin-left: auto;
      margin-right: auto;
      padding-bottom: 20px;
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
                
                    
        
                
                <form hidden id="board-id-request-form" method="post" action="board-log.jsp">
                    
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
                
                
                
                BoardRetrieve board = new BoardRetrieve(boardID);
                String hostClientName = board.getCreatorName();

                if (hostClientName == null)

                {
                    hostClientName = "Boarding Services";
                }
                
                
                
                %>
      
        
        
        
        <%
                    
                    
                    DocumentBoardPostList documentPostList = new DocumentBoardPostList(boardID);
                    
                    
                    
                    %>
                    
                    
                    
        
        
        <div id="posts-right">
            
            
        
                <%
                    
            int count = 0;
            
            for (count = 0; (count < documentPostList.length()) && (documentPostList.getDocumentBoardPost(count) != null); count++)
                
            {
        %>
            
            
            <div id="news-post">
                    
                    <div id="news-post-header">
                        
                        <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (documentPostList.getDocumentBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= documentPostList.getDocumentBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (documentPostList.getDocumentBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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
                        <div id="join-post-header-right"><b><%= documentPostList.getDocumentBoardPost(count).getClientName() %></b> posted this document.</div>
                    
                    </div>
                    <div id="news-document-background">
                        
                        <iframe id="news-document-file" height="500" width="600" src="<%= "https://docs.google.com/gview?url=" + documentPostList.getDocumentBoardPost(count).getDocumentLocation() + "&embedded=true" %>" frameborder="0"></iframe>
                        
                    </div>
                        
                        
                        
                        <%
                            
                            if ((documentPostList.getDocumentBoardPost(count).getMessage() != null) && (!documentPostList.getDocumentBoardPost(count).getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= documentPostList.getDocumentBoardPost(count).getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            %>
                            
                            
                    
                    <div id="news-post-feedback-read"><%= documentPostList.getDocumentBoardPost(count).getCreationTime() %></div>
                    <div id="news-post-feedback-write">
                        
                    <div class="news-post-feedback-write-area">

                            

                            <div id="post-like-button"><span><%= documentPostList.getDocumentBoardPost(count).getNumberOfPostPeppers() %> &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span><%= documentPostList.getDocumentBoardPost(count).getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>

                            

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
        
        
        
  
    </body>
</html>
