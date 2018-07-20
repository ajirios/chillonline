/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeUpdate 

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
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public EpisodeUpdate(long episodeID)
            
    {
        this.seriesID = -1;
        this.episodeID = episodeID;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.order = 0;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        EpisodeRetrieve retrieve = new EpisodeRetrieve(episodeID);
        this.seriesID = retrieve.getSeriesID();
        
    }
    
    public EpisodeUpdate(long seriesID, int order)
            
    {
        this.seriesID = seriesID;
        this.episodeID = -1;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.order = order;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        EpisodeRetrieve retrieve = new EpisodeRetrieve(episodeID);
        this.episodeID = retrieve.getEpisodeID();
        
    }

    public void setSeriesID(long seriesID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set seriesID=" + seriesID + " WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.seriesID = seriesID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setEpisodeID(long episodeID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set episodeID=" + episodeID + " WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
                this.episodeID = episodeID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setEpisodeName(String episodeName) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set episodeName='" + episodeName + "' WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate();
                this.episodeName = episodeName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setPodcast(String podcast) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set podcast='" + podcast + "' WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.podcast = podcast;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setThumbnail(String thumbnail) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set thumbnail='" + thumbnail + "' WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.thumbnail = thumbnail;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setOrder(int order) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set episodeOrder=" + order + " WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.order = order;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNumberOfPodcastFeeds(long numberOfPodcastFeeds) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set numberOfPodcastFeeds=" + numberOfPodcastFeeds + " WHERE seriesID=" + this.seriesID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.numberOfPodcastFeeds = numberOfPodcastFeeds;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNumberOfPodcastPeppers(long numberOfPodcastPeppers) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set numberOfPodcastPeppers=" + numberOfPodcastPeppers + " WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.numberOfPodcastPeppers = numberOfPodcastPeppers;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNumberOfPodcastShares(long numberOfPodcastShares) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("UPDATE episodes set numberOfPodcastShares=" + numberOfPodcastShares + " WHERE episodeID=" + this.episodeID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
                
                result = statement.executeUpdate(); 
                this.numberOfPodcastShares = numberOfPodcastShares;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
    }
    
}
