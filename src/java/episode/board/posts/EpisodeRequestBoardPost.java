/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode.board.posts;

/**
 *
 * @author El Jefe
 */
public class EpisodeRequestBoardPost 

{
    private long boardID;
    private long clientID;
    private long episodeID;
    private String creationTime;
    private String deletionTime;
    private long longitudinalCreationDate;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String thumbnail;
    private String content;
    private String seriesPoster;
    private String episodeName;
    private long numberOfPostPeppers;
    
    public EpisodeRequestBoardPost(long episodeID, long boardID, long clientID, String creationTime)
            
    {
        this.episodeID = episodeID;
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
        this.seriesPoster = null;
        this.episodeName = null;
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
    
    public long getEpisodeID() 
    
    {
        return episodeID;
    }

    public void setEpisodeID(long episodeID) 
    
    {
        this.episodeID = episodeID;
    }

    public String getSeriesPoster() 
    
    {
        return seriesPoster;
    }

    public void setSeriesPoster(String seriesPoster) 
    
    {
        this.seriesPoster = seriesPoster;
    }

    public String getEpisodeName() 
    
    {
        return episodeName;
    }

    public void setEpisodeName(String episodeName) 
    
    {
        this.episodeName = episodeName;
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
