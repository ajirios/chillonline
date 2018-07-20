/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photo.board.posts;

/**
 *
 * @author El Jefe
 */
public class PhotoBoardPostPepper 

{
    private String photoID;
    private long boardID;
    private long postClientID;
    private long pepperClientID;
    private String postCreationTime;
    private String clientName;
    private long postLongitudinalCreationDate;
    
    public PhotoBoardPostPepper(String photoID, long boardID, long postClientID, long pepperClientID, String postCreationTime)
            
    {
        this.photoID = photoID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.pepperClientID = pepperClientID;
        this.postCreationTime = postCreationTime;
        this.clientName = null;
        this.postLongitudinalCreationDate = Long.parseLong(postCreationTime);
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getPhotoID() 
    
    {
        return photoID;
    }

    public void setPhotoID(String photoID) 
    
    {
        this.photoID = photoID;
    }

    public long getPostClientID() 
    
    {
        return postClientID;
    }

    public void setPostClientID(long postClientID) 
    
    {
        this.postClientID = postClientID;
    }

    public long getPepperClientID() 
    
    {
        return pepperClientID;
    }

    public void setPepperClientID(long pepperClientID) 
    
    {
        this.pepperClientID = pepperClientID;
    }

    public String getPostCreationTime() 
    
    {
        return postCreationTime;
    }

    public void setPostCreationTime(String postCreationTime) 
    
    {
        this.postCreationTime = postCreationTime;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }

    public long getPostLongitudinalCreationDate() 
    
    {
        return postLongitudinalCreationDate;
    }

    public void setPostLongitudinalCreationDate(long postLongitudinalCreationDate) 
    
    {
        this.postLongitudinalCreationDate = postLongitudinalCreationDate;
    }
    
}
