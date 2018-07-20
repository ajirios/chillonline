/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;



/**
 *
 * @author El Jefe
 */
public class Pep 

{
    private long clientID;
    private long boardID;
    private long postID;
    private long commentID;
    
    public Pep(long clientID, long boardID)
            
    {
        this.clientID = clientID;
        this.boardID = boardID;
        this.postID = 0;
        this.commentID = 0;
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
    
}
