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
public class EpisodeRetrieve 

{
    private long seriesID;
    private long episodeID;
    private String episodeName;
    private String podcast;
    private String thumbnail;
    private String seriesName;
    private String seriesPoster;
    private int order;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public EpisodeRetrieve(long seriesID, int order)
            
    {
        this.seriesID = seriesID;
        this.episodeID = -1;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.seriesName = null;
        this.seriesPoster = null;
        this.order = order;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        constructRetrieveByOrder();
        constructSeries();
        
    }
    
    public EpisodeRetrieve(long episodeID)
            
    {
        this.seriesID = -1;
        this.episodeID = episodeID;
        this.episodeName = null;
        this.podcast = null;
        this.thumbnail = null;
        this.seriesName = null;
        this.seriesPoster = null;
        this.order = 0;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        constructRetrieve();
        constructSeries();
        
    }
    
    private void constructRetrieve()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("SELECT seriesID, episodeName, episodeOrder, podcast, thumbnail, numberOfPodcastPeppers, numberOfPodcastFeeds, numberOfPodcastShares "
                    + "FROM episodes WHERE episodeID=" + this.episodeID);
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
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.episodeName = resultSet.getString("episodeName"); 
                    this.thumbnail = resultSet.getString("thumbnail"); 
                    this.order = Integer.parseInt(resultSet.getString("episodeOrder"));
                    this.podcast = resultSet.getString("podcast");
                    this.numberOfPodcastFeeds = Long.parseLong(resultSet.getString("numberOfPodcastFeeds"));
                    this.numberOfPodcastPeppers = Long.parseLong(resultSet.getString("numberOfPodcastPeppers"));
                    this.numberOfPodcastShares = Long.parseLong(resultSet.getString("numberOfPodcastShares"));
                    this.seriesID = Long.parseLong(resultSet.getString("seriesID"));
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructRetrieveByOrder()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("SELECT episodeID, episodeName, podcast, thumbnail, numberOfPodcastPeppers, numberOfPodcastFeeds, numberOfPodcastShares "
                    + "FROM episodes WHERE seriesID=" + seriesID + " AND episodeOrder=" + order);
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
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.episodeName = resultSet.getString("episodeName"); 
                    this.thumbnail = resultSet.getString("thumbnail"); 
                    this.podcast = resultSet.getString("podcast");
                    this.numberOfPodcastFeeds = Long.parseLong(resultSet.getString("numberOfPodcastFeeds"));
                    this.numberOfPodcastPeppers = Long.parseLong(resultSet.getString("numberOfPodcastPeppers"));
                    this.numberOfPodcastShares = Long.parseLong(resultSet.getString("numberOfPodcastShares"));
                    this.episodeID = Long.parseLong(resultSet.getString("episodeID"));
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructSeries()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password); 
            statement = connection.prepareStatement("SELECT seriesPoster, seriesName "
                    + "FROM series WHERE seriesID=" + this.seriesID);
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
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.seriesName = resultSet.getString("seriesName"); 
                    this.seriesPoster = resultSet.getString("seriesPoster");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public long getSeriesID() 
    
    {
        return seriesID;
    }

    public long getEpisodeID() 
    
    {
        return episodeID;
    }

    public String getEpisodeName() 
    
    {
        return episodeName;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public int getOrder() 
    
    {
        return order;
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

    public String getSeriesName() 
    
    {
        return seriesName;
    }

    public String getSeriesPoster() 
    
    {
        return seriesPoster;
    }
    
}
