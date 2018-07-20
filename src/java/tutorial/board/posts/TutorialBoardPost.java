/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial.board.posts;

/**
 *
 * @author El Jefe
 */
public class TutorialBoardPost 

{
    private long boardID;
    private long clientID;
    private String videoID;
    private String creationTime;
    private String deletionTime;
    private String title;
    private String channelTitle;
    private String thumbnail;
    private String message;
    private String description;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String videoLocation;
    private long longitudinalCreationDate;
    private long numberOfPostPeppers;
    private long numberOfPostComments;
    
    public TutorialBoardPost(String videoID, long boardID, long clientID, String creationTime, String message)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.title = null;
        this.channelTitle = null;
        this.thumbnail = null;
        this.message = message;
        this.description = null;
        this.videoLocation = null;
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.numberOfPostPeppers = 0;
        this.numberOfPostComments = 0;
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

    public long getLongitudinalCreationDate() 
    
    {
        return longitudinalCreationDate;
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        this.longitudinalCreationDate = longitudinalCreationDate;
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

    public long getNumberOfPostPeppers() 
    
    {
        return numberOfPostPeppers;
    }

    public void setNumberOfPostPeppers(long numberOfPostPeppers) 
    
    {
        this.numberOfPostPeppers = numberOfPostPeppers;
    }

    public long getNumberOfPostComments() 
    
    {
        return numberOfPostComments;
    }

    public void setNumberOfPostComments(long numberOfPostComments) 
    
    {
        this.numberOfPostComments = numberOfPostComments;
    }

    public String getVideoID() 
    
    {
        return videoID;
    }

    public void setVideoID(String videoID) 
    
    {
        this.videoID = videoID;
    }

    public String getTitle() 
    
    {
        return title;
    }

    public void setTitle(String title) 
    
    {
        this.title = title;
    }

    public String getChannelTitle() 
    
    {
        return channelTitle;
    }

    public void setChannelTitle(String channelTitle) 
    
    {
        this.channelTitle = channelTitle;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) 
    
    {
        this.thumbnail = thumbnail;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public void setDescription(String description) 
    
    {
        this.description = description;
    }

    public String getVideoLocation() 
    
    {
        return videoLocation;
    }

    public void setVideoLocation(String videoLocation) 
    
    {
        this.videoLocation = videoLocation;
    }
    
}
