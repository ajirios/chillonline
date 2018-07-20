/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class Comment 

{
    private long postID;
    private long commentID;
    private long clientID;
    private long boardID;
    private String commentText;
    private PepList peppers;
    private int numberOfPeps;
    
    public Comment(long clientID, long boardID, long postID)
            
    {
        this.postID = postID;
        this.clientID = clientID;
        this.boardID = boardID;
        this.commentID = -1;
        this.commentText = null;
        this.peppers = null;
        this.numberOfPeps = 0;
    }

    public long getPostID() 
    
    {
        return postID;
    }

    public void setPostID(long postID) 
    
    {
        this.postID = postID;
    }

    public long getCommentID() 
    
    {
        return commentID;
    }

    public void setCommentID(long commentID) 
    
    {
        this.commentID = commentID;
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

    public String getCommentText() 
    
    {
        return commentText;
    }

    public void setCommentText(String commentText) 
    
    {
        this.commentText = commentText;
    }

    public PepList getPeppers() 
    
    {
        return peppers;
    }

    public void setPeppers(PepList peppers) 
    
    {
        this.peppers = peppers;
    }

    public int getNumberOfPeps() 
    
    {
        return numberOfPeps;
    }

    public void setNumberOfPeps(int numberOfPeps) 
    
    {
        this.numberOfPeps = numberOfPeps;
    }
    
}
