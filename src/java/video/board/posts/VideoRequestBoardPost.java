/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video.board.posts;

/**
 *
 * @author El Jefe
 */
public class VideoRequestBoardPost 

{
    private long boardID;
    private long clientID;
    private long videoID;
    private String creationTime;
    private String deletionTime;
    private long longitudinalCreationDate;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String thumbnail;
    private String content;
    private String videoPoster;
    private String videoName;
    private long numberOfPostPeppers;
    
    public VideoRequestBoardPost(long videoID, long boardID, long clientID, String creationTime)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.thumbnail = null;
        this.content = null;
        this.videoPoster = null;
        this.videoName = null;
        this.numberOfPostPeppers = 0;
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public long getVideoID() 
    
    {
        return videoID;
    }

    public void setVideoID(long videoID) 
    
    {
        this.videoID = videoID;
    }

    public String getVideoPoster() 
    
    {
        return videoPoster;
    }

    public void setVideoPoster(String videoPoster) 
    
    {
        this.videoPoster = videoPoster;
    }

    public String getVideoName() 
    
    {
        return videoName;
    }

    public void setVideoName(String videoName) 
    
    {
        this.videoName = videoName;
    }

    public String getCreationTime() 
    
    {
        return creationTime;
    }

    public void setCreationTime(String creationTime) 
    
    {
        this.creationTime = creationTime;
    }

    public String getDeletionTime() 
    
    {
        return deletionTime;
    }

    public void setDeletionTime(String deletionTime) 
    
    {
        this.deletionTime = deletionTime;
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

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) 
    
    {
        this.thumbnail = thumbnail;
    }

    public String getContent() 
    
    {
        return content;
    }

    public void setContent(String content) 
    
    {
        this.content = content;
    }

    public long getLongitudinalCreationDate() 
    
    {
        return longitudinalCreationDate;
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        this.longitudinalCreationDate = longitudinalCreationDate;
    }

    public long getNumberOfPostPeppers() 
    
    {
        return numberOfPostPeppers;
    }

    public void setNumberOfPostPeppers(long numberOfPostPeppers) 
    
    {
        this.numberOfPostPeppers = numberOfPostPeppers;
    }
    
}
