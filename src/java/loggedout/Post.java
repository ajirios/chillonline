/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;


import java.sql.*;


/**
 *
 * @author El Jefe
 */
public class Post 

{
    private long postID;
    private long clientID;
    private long boardID;
    private String postText;
    private int numberOfPeps;
    private int numberOfComments;
    private String postPicture;
    private String postVideo;
    private PepList peppers;
    private CommentList commenters;
    private Timestamp creationDate;
    private Timestamp deletionDate;
    
    public Post(long clientID, long boardID)
            
    {
        this.postID = -1;
        this.clientID = clientID;
        this.boardID = boardID;
        this.postText = null;
        this.postPicture = null;
        this.postVideo = null;
        this.peppers = null;
        this.numberOfPeps = 0;
        this.commenters = null;
        this.numberOfComments = 0;
    }

    public long getPostID() 
    
    {
        return postID;
    }

    public void setPostID(long postID) 
    
    {
        this.postID = postID;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getPostText() 
    
    {
        return postText;
    }

    public void setPostText(String postText) 
    
    {
        this.postText = postText;
    }

    public int getNumberOfPeps() 
    
    {
        return numberOfPeps;
    }

    public void setNumberOfPeps(int numberOfPeps) 
    
    {
        this.numberOfPeps = numberOfPeps;
    }

    public int getNumberOfComments() 
    
    {
        return numberOfComments;
    }

    public void setNumberOfComments(int numberOfComments) 
    
    {
        this.numberOfComments = numberOfComments;
    }

    public String getPostPicture() 
    
    {
        return postPicture;
    }

    public void setPostPicture(String postPicture) 
    
    {
        this.postPicture = postPicture;
    }

    public String getPostVideo() 
    
    {
        return postVideo;
    }

    public void setPostVideo(String postVideo) 
    
    {
        this.postVideo = postVideo;
    }

    public PepList getPeppers() 
    
    {
        return peppers;
    }

    public void setPeppers(PepList peppers) 
    
    {
        this.peppers = peppers;
    }

    public CommentList getCommenters() 
    
    {
        return commenters;
    }

    public void setCommenters(CommentList commenters) 
    
    {
        this.commenters = commenters;
    }
    
}
