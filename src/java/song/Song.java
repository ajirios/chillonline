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
public class Song 

{
    private long musicID;
    private long songID;
    private String songName;
    private int songOrder;
    private String podcast;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Song (long musicID, long songID, String songName, String podcast, int songOrder)
            
    {
        this.songID = songID;
        this.musicID = musicID;
        this.songName = songName;
        this.songOrder = songOrder;
        this.podcast = podcast;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
    }
    
    public long getMusicID() 
    
    {
        return musicID;
    }

    public long getSongID() 
    
    {
        return songID;
    }

    public String getSongName() 
    
    {
        return songName;
    }

    public int getSongOrder() 
    
    {
        return songOrder;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public long getNumberOfPodcastFeeds() 
    
    {
        return numberOfPodcastFeeds;
    }

    public long getNumberOfPodcastPeppers() 
    
    {
        return numberOfPodcastPeppers;
    }

    public long getNumberOfPodcastShares() 
    
    {
        return numberOfPodcastShares;
    }

    public void setNumberOfPodcastFeeds(long numberOfPodcastFeeds) 
    
    {
        this.numberOfPodcastFeeds = numberOfPodcastFeeds;
    }

    public void setNumberOfPodcastPeppers(long numberOfPodcastPeppers) 
    
    {
        this.numberOfPodcastPeppers = numberOfPodcastPeppers;
    }

    public void setNumberOfPodcastShares(long numberOfPodcastShares) 
    
    {
        this.numberOfPodcastShares = numberOfPodcastShares;
    }
    
}
