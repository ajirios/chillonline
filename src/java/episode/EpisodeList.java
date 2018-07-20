/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeList 

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
    
    private Episode[] episodeList;
    private int size;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    public EpisodeList(long seriesID)
            
    {
        this.seriesID = seriesID;
        this.size = getEpisodeCount();
        
        
        if (this.size > 0)
            
        {
            this.episodeList = new Episode[size];
            
            try
            {
                connection = DriverManager.getConnection(URL, userName, password);
                statement = connection.prepareStatement("SELECT seriesID, episodeID, episodeName, podcast, thumbnail, episodeOrder, "
                        + "numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares FROM episodes WHERE seriesID=" + this.seriesID);
            }
            
            catch (SQLException e)

            {
                e.printStackTrace();
            }

            populateEpisodePage();

        }
        
        else
            
        {
            this.episodeList = null;
        }
        
        
    }

    private ResultSet getEpisodes()
    {
        try
        {
            resultSet = statement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return resultSet;

    }
    
    private void populateEpisodePage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet episodesSet = getEpisodes();
        
        try
            
        {
                        
            for (count = 0; (count < size) && (episodesSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(episodesSet.getString("episodeID"));
                episodeList[count] = new Episode(Long.parseLong(episodesSet.getString("seriesID")), nextCount, episodesSet.getString("episodeName"), episodesSet.getString("podcast"), episodesSet.getString("thumbnail"), Integer.parseInt(episodesSet.getString("episodeOrder")));
                episodeList[count].setNumberOfPodcastFeeds(Long.parseLong(episodesSet.getString("numberOfPodcastFeeds")));
                episodeList[count].setNumberOfPodcastPeppers(Long.parseLong(episodesSet.getString("numberOfPodcastPeppers")));
                episodeList[count].setNumberOfPodcastShares(Long.parseLong(episodesSet.getString("numberOfPodcastShares")));
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Episode getEpisode(int count)
            
    {
        return this.episodeList[count];
    }
    
    public long length()
            
    {
        return episodeList.length;
    }
    
    private int getEpisodeCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(podcast) FROM episodes WHERE seriesID=" + this.seriesID);
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(podcast)")); 
                
            }
            
            else
                
            {
                count = 0;
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
    
}
