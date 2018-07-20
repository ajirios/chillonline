/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package song;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class SongRetrieve 

{
    private long musicID;
    private long songID;
    private String songName;
    private int songOrder;
    private String podcast;
    private String musicName;
    private String musicPoster;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public SongRetrieve(long songID)
            
    {
        this.songID = songID;
        this.musicID = -1;
        this.songName = null;
        this.songOrder = 0;
        this.podcast = null;
        this.musicName = null;
        this.musicPoster = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        constructRetrieve();
        constructMusic();
        
    }
    
    public SongRetrieve(long musicID, int songOrder)
            
    {
        this.songID = -1;
        this.musicID = musicID;
        this.songName = null;
        this.songOrder = songOrder;
        this.podcast = null;
        this.musicName = null;
        this.musicPoster = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        constructRetrieveByOrder();
        constructMusic();
        
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT musicID, songName, songOrder, podcast, numberOfPodcastPeppers, numberOfPodcastFeeds, numberOfPodcastShares "
                    + "FROM songs WHERE songID=" + this.songID);
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
                    
                    this.songName = resultSet.getString("songName"); 
                    this.songOrder = Integer.parseInt(resultSet.getString("songOrder"));
                    this.podcast = resultSet.getString("podcast");
                    this.numberOfPodcastFeeds = Long.parseLong(resultSet.getString("numberOfPodcastFeeds"));
                    this.numberOfPodcastPeppers = Long.parseLong(resultSet.getString("numberOfPodcastPeppers"));
                    this.numberOfPodcastShares = Long.parseLong(resultSet.getString("numberOfPodcastShares"));
                    this.musicID = Long.parseLong(resultSet.getString("musicID"));
                    
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT songID, songName, podcast, numberOfPodcastPeppers, numberOfPodcastFeeds, numberOfPodcastShares "
                    + "FROM songs WHERE musicID=" + this.musicID + " AND songOrder=" + this.songOrder);
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
                    
                    this.songName = resultSet.getString("songName"); 
                    this.podcast = resultSet.getString("podcast");
                    this.numberOfPodcastFeeds = Long.parseLong(resultSet.getString("numberOfPodcastFeeds"));
                    this.numberOfPodcastPeppers = Long.parseLong(resultSet.getString("numberOfPodcastPeppers"));
                    this.numberOfPodcastShares = Long.parseLong(resultSet.getString("numberOfPodcastShares"));
                    this.songID = Long.parseLong(resultSet.getString("songID"));
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructMusic()
            
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT musicPoster, musicName "
                    + "FROM music WHERE musicID=" + this.musicID);
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
                    
                    this.musicName = resultSet.getString("musicName"); 
                    this.musicPoster = resultSet.getString("musicPoster");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
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

    public String getMusicName() 
    
    {
        return musicName;
    }

    public String getMusicPoster() 
    
    {
        return musicPoster;
    }
    
}
