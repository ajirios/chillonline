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
public class SongRequestBoardPost 

{
    private long boardID;
    private long clientID;
    private long songID;
    private String creationTime;
    private String deletionTime;
    private long longitudinalCreationDate;
    private String clientProfilePicture;
    private String clientName;
    private String clientGender;
    private String content;
    private String musicPoster;
    private String songName;
    private long numberOfPostPeppers;
    
    public SongRequestBoardPost(long songID, long boardID, long clientID, String creationTime)
            
    {
        this.songID = songID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.clientProfilePicture = null;
        this.clientName = null;
        this.clientGender = null;
        this.content = null;
        this.musicPoster = null;
        this.songName = null;
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

    public long getSongID() 
    
    {
        return songID;
    }

    public void setSongID(long songID) 
    
    {
        this.songID = songID;
    }

    public String getMusicPoster() 
    
    {
        return musicPoster;
    }

    public void setMusicPoster(String musicPoster) 
    
    {
        this.musicPoster = musicPoster;
    }

    public String getSongName() 
    
    {
        return songName;
    }

    public void setSongName(String songName) 
    
    {
        this.songName = songName;
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
