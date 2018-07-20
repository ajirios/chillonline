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
public class SongCreate 

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
    
    public SongCreate(long musicID, String songName, int songOrder, String podcast)
            
    {
        
        if (!podcast.equals(""))
            
        {
            this.podcast = podcast;
        }
        
        this.musicID = musicID;
        this.songOrder = songOrder;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        
        
        if (!songName.equals("") && (this.musicID >= 0))
            
        {
            //check if database table is empty
            if (tableIsEmpty() == true)

            {
                //if database table is empty, set boardID to 0 
                this.songID = 0;
                this.songName = songName;
                constructSongCreate();
            }

            else if (tableIsEmpty() == false)

            {
                //else if boards database table is not null, get the next maximum boardID and set it
                this.songID = getNextMaximumID();
                this.songName = songName;
                constructSongCreate();
            }
        
        }
        
    }
    
    private void constructSongCreate()
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `songs`(songID, musicID, songName, podcast, songOrder, numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares) VALUES(" + songID + ", " + musicID + ", '" + songName + "', '" + podcast + "', " + songOrder + ", " + 0 + ", " + 0 + ", " + 0 + ")" ); 
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private boolean tableIsEmpty()
            
    {
        boolean tableIsEmpty;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        tableIsEmpty = false;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT songID FROM songs");
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet.next() == true)
                
            {
            
                tableIsEmpty = false;
            
            }
            
            else
                
            {
                
                tableIsEmpty = true;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return tableIsEmpty;
        
    }
    
    private long getNextMaximumID()
            
    {
        long nextMaximumID;
        long maximumID;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        nextMaximumID = 1;
        maximumID = 0;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT MAX(songID) FROM songs");
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet.next() == true)
                
            {
            
                maximumID = Long.parseLong(resultSet.getString("MAX(songID)")); 
                nextMaximumID = maximumID + 1;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return nextMaximumID;
        
    }
    
}
