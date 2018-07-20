/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package song;

/**
 *
 * @author El Jefe
 */
public class SongDelete 

{
    private long musicID;
    private long songID;
    private String songName;
    private int songOrder;
    private String podcast;
    private int numberOfPodcastFeeds;
    private int numberOfPodcastPeppers;
    private int numberOfPodcastShares;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public SongDelete(long songID)
            
    {
        this.songID = songID;
        this.musicID = -1;
        this.songName = null;
        this.songOrder = 0;
        this.podcast = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
    }

    public void setMusicID(long musicID) 
    
    {
        this.musicID = musicID;
    }

    public void setSongID(long songID) 
    
    {
        this.songID = songID;
    }

    public void setSongName(String songName) 
    
    {
        this.songName = songName;
    }

    public void setSongOrder(int songOrder) 
    
    {
        this.songOrder = songOrder;
    }

    public void setPodcast(String podcast) 
    
    {
        this.podcast = podcast;
    }

    public void setNumberOfPodcastFeeds(int numberOfPodcastFeeds) 
    
    {
        this.numberOfPodcastFeeds = numberOfPodcastFeeds;
    }

    public void setNumberOfPodcastPeppers(int numberOfPodcastPeppers) 
    
    {
        this.numberOfPodcastPeppers = numberOfPodcastPeppers;
    }

    public void setNumberOfPodcastShares(int numberOfPodcastShares) 
    
    {
        this.numberOfPodcastShares = numberOfPodcastShares;
    }
    
}
