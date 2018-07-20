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
public class SongList 

{
    private long musicID;
    private long songID;
    private String songName;
    private String podcast;
    private int songOrder;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    
    private Song[] songList;
    private int size;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    public SongList(long musicID)
            
    {
        this.musicID = musicID;
        this.size = getSongCount();
        
        
        if (this.size > 0)
            
        {
            this.songList = new Song[size];
            
            try
            {
                connection = DriverManager.getConnection(URL, userName, password);
                statement = connection.prepareStatement("SELECT musicID, songID, songName, podcast, songOrder, "
                        + "numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares FROM songs WHERE musicID=" + this.musicID);
            }
            
            catch (SQLException e)

            {
                e.printStackTrace();
            }

            populateSongPage();

        }
        
        else
            
        {
            this.songList = null;
        }
        
        
    }

    private ResultSet getSongs()
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
    
    private void populateSongPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet songsSet = getSongs();
        
        try
            
        {
                        
            for (count = 0; (count < size) && (songsSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(songsSet.getString("songID"));
                songList[count] = new Song(Long.parseLong(songsSet.getString("musicID")), nextCount, songsSet.getString("songName"), songsSet.getString("podcast"), Integer.parseInt(songsSet.getString("songOrder")));
                songList[count].setNumberOfPodcastFeeds(Long.parseLong(songsSet.getString("numberOfPodcastFeeds")));
                songList[count].setNumberOfPodcastPeppers(Long.parseLong(songsSet.getString("numberOfPodcastPeppers")));
                songList[count].setNumberOfPodcastShares(Long.parseLong(songsSet.getString("numberOfPodcastShares")));
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Song getSong(int count)
            
    {
        return this.songList[count];
    }
    
    public long length()
            
    {
        return songList.length;
    }
    
    private int getSongCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(podcast) FROM songs WHERE musicID=" + this.musicID);
            
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
