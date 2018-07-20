<%-- 
    Document   : movies-copy
    Created on : 21-Sep-2017, 11:48:07 PM
    Author     : El Jefe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
                                
                                
                                
                                
            <%
                    
                    
                    MovieBoardPostList postList = new MovieBoardPostList(boardID);
                    DocumentBoardPostList documentPostList = new DocumentBoardPostList(boardID);
                    PhotoBoardPostList photoPostList = new PhotoBoardPostList(boardID);
                    NoticeBoardPostList noticePostList = new NoticeBoardPostList(boardID);
                    JoinBoardPostList joinPostList = new JoinBoardPostList(boardID);
                    
                    
                    
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
                        
                        <iframe id="news-document-file" height="500" width="400" src="<%= "https://docs.google.com/gview?url=" + documentPostList.getDocumentBoardPost(count).getDocumentLocation() + "&embedded=true" %>" frameborder="0"></iframe>
                        
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
            
            
        
        
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < joinPostList.length()) && (joinPostList.getJoinBoardPost(count) != null); count++)
                
            {
        %>
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (joinPostList.getJoinBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= joinPostList.getJoinBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (joinPostList.getJoinBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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
                    <div id="join-post-header-right"><b><%= joinPostList.getJoinBoardPost(count).getClientName() %></b> joined <%= board.getBoardName() %>.</div>
                
                </div>
                <div id="join-post-feedback-read"><%= joinPostList.getJoinBoardPost(count).getCreationTime() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span><%= joinPostList.getJoinBoardPost(count).getNumberOfPostPeppers() %> &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span><%= joinPostList.getJoinBoardPost(count).getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < noticePostList.length()) && (noticePostList.getNoticeBoardPost(count) != null); count++)
                
            {
        %>
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (noticePostList.getNoticeBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= noticePostList.getNoticeBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (noticePostList.getNoticeBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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
                    <div id="join-post-header-right"><b><%= noticePostList.getNoticeBoardPost(count).getClientName() %></b> posted this notice.</div>
                
                </div>
                        
                        
                        
                        <%
                            
                            if ((noticePostList.getNoticeBoardPost(count).getMessage() != null) && (!noticePostList.getNoticeBoardPost(count).getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= noticePostList.getNoticeBoardPost(count).getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            %>
                            
                            
                    
                <div id="join-post-feedback-read"><%= noticePostList.getNoticeBoardPost(count).getCreationTime() %></div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span><%= noticePostList.getNoticeBoardPost(count).getNumberOfPostPeppers() %> &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span><%= noticePostList.getNoticeBoardPost(count).getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < photoPostList.length()) && (photoPostList.getPhotoBoardPost(count) != null); count++)
                
            {
        %>
            
            
            <div id="share-post">
                    
                    <div id="share-post-header">
                        
                        <div id="share-post-header-left">
                            
                            
                    
                    <%
                                    
                                    if (photoPostList.getPhotoBoardPost(count).getClientProfilePicture() != null) {
                                        
                                        %>


                                    <img id="commenter-pic" src="<%= photoPostList.getPhotoBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (photoPostList.getPhotoBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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
                        <div id="share-post-header-right"><b><%= photoPostList.getPhotoBoardPost(count).getClientName() %></b> posted this photo.</div>
                    
                    </div>
                    <div id="share-poster-background">
                        
                        <img id="share-poster-background-image" src="<%= photoPostList.getPhotoBoardPost(count).getPhotoLocation() %>" alt="poster"/>
                        
                    </div>
                        
                        
                        
                        <%
                            
                            if ((photoPostList.getPhotoBoardPost(count).getMessage() != null) && (!photoPostList.getPhotoBoardPost(count).getMessage().equals("")))
                            
                            {
                            
                            %>
                        
                    <div id="share-post-description"><%= photoPostList.getPhotoBoardPost(count).getMessage() %></div>
                    
                    <%
                            
                            }
                            
                            %>
                            
                            
                    
                    <div id="share-post-feedback-read"><%= photoPostList.getPhotoBoardPost(count).getCreationTime() %></div>
                    <div id="share-post-feedback-write">
                    
                    <div class="share-post-feedback-write-area">



                            <div id="post-like-button"><span><%= photoPostList.getPhotoBoardPost(count).getNumberOfPostPeppers() %> &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span><%= photoPostList.getPhotoBoardPost(count).getNumberOfPostComments() %> &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>

                            

                        </div>

                    </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
            
            
        
        
        
                <%
                    
            count = 0;
            
            for (count = 0; (count < postList.length()) && (postList.getMovieBoardPost(count) != null); count++)
                
            {
        %>
            
            
            <div id="share-post">
                    
                    <div id="share-post-header">
                        
                        <div id="share-post-header-left">
                            
                            
                    
                    <%

                                    if (postList.getMovieBoardPost(count).getClientProfilePicture() != null) {

                                        %>


                                    <img id="commenter-pic" src="<%= postList.getMovieBoardPost(count).getClientProfilePicture() %>" alt="picture" />


                                    <%

                                    }

                                    else
                                    
                                    {
                                        if (postList.getMovieBoardPost(count).getClientGender().equalsIgnoreCase("female")) {

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
                        <div id="share-post-header-right"><b><%= postList.getMovieBoardPost(count).getClientName() %></b> shared <b><%= postList.getMovieBoardPost(count).getMovieName() %></b>.</div>
                    
                    </div>
                    <div id="share-poster-background">
                        
                        <img id="share-poster-background-image" src="<%= postList.getMovieBoardPost(count).getMoviePoster() %>" alt="poster"/>
                    
                    </div>
                    <div id="share-post-description"><%= postList.getMovieBoardPost(count).getMessage() %></div>
                    <div id="share-post-feedback-read"><%= postList.getMovieBoardPost(count).getCreationTime() %></div>
                    <div id="share-post-feedback-write">

                    <div class="share-post-feedback-write-area">



                            <div id="post-like-button"><span>0 &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span>0 &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>



                        </div>
                        
                    </div>
                
            </div>
                    
            
        
        
        <%
            }
        %>
               
        
        
            
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                        
                        
                        
                    </div>
                    <div id="join-post-header-right"><b><%= board.getCreatorName() %></b> joined <%= board.getBoardName() %>.</div>
                
                </div>
                <div id="join-post-feedback-read"><b>2</b> minutes ago</div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span>0 &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span>0 &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
        
        
            
            
            
            <div id="news-post">
                    
                    <div id="news-post-header">
                        
                        <div id="join-post-header-left">
                            
                            
                            
                        </div>
                        <div id="join-post-header-right"><b>Boarding Services</b> posted this document.</div>
                    
                    </div>
                    <div id="news-document-background">
                        
                       <embed id="news-document-file" src="../Chillonline_Quick_Start_Guide.pdf" width="400" height="500" /> 
                        
                    </div>
                    <div id="news-post-feedback-read"><b>3</b> minutes ago</div>
                    <div id="news-post-feedback-write">

                    <div class="news-post-feedback-write-area">



                            <div id="post-like-button"><span>0 &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                            <div id="post-reply-button"><span>0 &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>



                        </div>

                    </div>
                
            </div>
                    
            
            <div id="join-post">
                
                <div id="join-post-header">
                    
                    <div id="join-post-header-left">
                        
                        
                        
                    </div>
                    <div id="join-post-header-right"><b><%= board.getCreatorName() %></b> created <%= board.getBoardName() %>.</div>
                
                </div>
                <div id="join-post-feedback-read"><b>2</b> minutes ago</div>
                <div id="join-post-feedback-write">
                
                <div class="join-post-feedback-write-area">
                        
                        
                            
                        <div id="post-like-button"><span>0 &nbsp; </span><a class="pep-link-design" href="javascript:;"><i class="fa fa-thumbs-up" style="font-size:16px;color:#f40"></i> &nbsp; <span>Pep</span></a></div>
                        <div id="post-reply-button"><span>0 &nbsp; </span><a class="comment-link-design" href="javascript:;"><i class="material-icons" style="font-size:17px;color:#f40">question_answer</i> &nbsp; <span>Comment</span></a></div>
                            
                        
                        
                    </div>
                    
                </div>
                
            </div>
            
            
        </div>
        
        
    </body>
</html>
