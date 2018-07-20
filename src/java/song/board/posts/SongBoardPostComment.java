/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package song.board.posts;



/**
 *
 * @author El Jefe
 */
public class SongBoardPostComment 

{
    private String songID;
    private long boardID;
    private long postClientID;
    private long commentClientID;
    private String postCreationTime;
    private String commentCreationTime;
    private String message;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private long postLongitudinalCreationDate;
    private long commentLongitudinalCreationDate;
    
    public SongBoardPostComment(String songID, long boardID, long postClientID, long commentClientID, String postCreationTime, String commentCreationTime, String message)
            
    {
        this.songID = songID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.commentClientID = commentClientID;
        this.postCreationTime = postCreationTime;
        this.commentCreationTime = commentCreationTime;
        this.message = message;
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.postLongitudinalCreationDate = Long.parseLong(postCreationTime);
        this.commentLongitudinalCreationDate = Long.parseLong(commentCreationTime);
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getSongID() 
    
    {
        return songID;
    }

    public void setSongID(String songID) 
    
    {
        this.songID = songID;
    }

    public long getPostClientID() 
    
    {
        return postClientID;
    }

    public void setPostClientID(long postClientID) 
    
    {
        this.postClientID = postClientID;
    }

    public long getCommentClientID() 
    
    {
        return commentClientID;
    }

    public void setCommentClientID(long commentClientID) 
    
    {
        this.commentClientID = commentClientID;
    }

    public String getPostCreationTime() 
    
    {
        return postCreationTime;
    }

    public void setPostCreationTime(String postCreationTime) 
    
    {
        this.postCreationTime = postCreationTime;
    }

    public String getCommentCreationTime() 
    
    {
        return commentCreationTime;
    }

    public void setCommentCreationTime(String commentCreationTime) 
    
    {
        this.commentCreationTime = commentCreationTime;
    }

    public String getMessage() 
    
    {
        return message;
    }

    public void setMessage(String message) 
    
    {
        this.message = message;
    }

    public String getClientProfilePicture() 
    
    {
        return clientProfilePicture;
    }

    public void setClientProfilePicture(String clientProfilePicture) 
    
    {
        this.clientProfilePicture = clientProfilePicture;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }

    public String getClientGender() 
    
    {
        return clientGender;
    }

    public void setClientGender(String clientGender) 
    
    {
        this.clientGender = clientGender;
    }

    public long getPostLongitudinalCreationDate() 
    
    {
        return postLongitudinalCreationDate;
    }

    public void setPostLongitudinalCreationDate(long postLongitudinalCreationDate) 
    
    {
        this.postLongitudinalCreationDate = postLongitudinalCreationDate;
    }

    public long getCommentLongitudinalCreationDate() 
    
    {
        return commentLongitudinalCreationDate;
    }

    public void setCommentLongitudinalCreationDate(long commentLongitudinalCreationDate) 
    
    {
        this.commentLongitudinalCreationDate = commentLongitudinalCreationDate;
    }
    
}
