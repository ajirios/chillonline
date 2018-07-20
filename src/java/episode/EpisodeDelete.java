/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode;

/**
 *
 * @author El Jefe
 */
public class EpisodeDelete 

{
    private long seriesID;
    private long episodeID;
    private String episodeName;
    private String podcast;
    private String thumbnail;
    private int order;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    public EpisodeDelete(long episodeID)
            
    {
        this.episodeID = episodeID;
        this.seriesID = -1;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.order = 0;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
    }

    public long getSeriesID() 
    
    {
        return seriesID;
    }

    public void setSeriesID(long seriesID) 
    
    {
        this.seriesID = seriesID;
    }

    public long getEpisodeID() 
    
    {
        return episodeID;
    }

    public void setEpisodeID(long episodeID) 
    
    {
        this.episodeID = episodeID;
    }

    public String getEpisodeName() 
    
    {
        return episodeName;
    }

    public void setEpisodeName(String episodeName) 
    
    {
        this.episodeName = episodeName;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public void setPodcast(String podcast) 
    
    {
        this.podcast = podcast;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) 
    
    {
        this.thumbnail = thumbnail;
    }

    public int getOrder() 
    
    {
        return order;
    }

    public void setOrder(int order) 
    
    {
        this.order = order;
    }

    public long getNumberOfPodcastFeeds() 
    
    {
        return numberOfPodcastFeeds;
    }

    public void setNumberOfPodcastFeeds(long numberOfPodcastFeeds) 
    
    {
        this.numberOfPodcastFeeds = numberOfPodcastFeeds;
    }

    public long getNumberOfPodcastPeppers() 
    
    {
        return numberOfPodcastPeppers;
    }

    public void setNumberOfPodcastPeppers(long numberOfPodcastPeppers) 
    
    {
        this.numberOfPodcastPeppers = numberOfPodcastPeppers;
    }

    public long getNumberOfPodcastShares() 
    
    {
        return numberOfPodcastShares;
    }

    public void setNumberOfPodcastShares(long numberOfPodcastShares) 
    
    {
        this.numberOfPodcastShares = numberOfPodcastShares;
    }
    
    
}
