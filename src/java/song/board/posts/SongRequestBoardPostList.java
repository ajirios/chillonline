/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package song.board.posts;

import client.ClientRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import song.SongRetrieve;

/**
 *
 * @author El Jefe
 */
public class SongRequestBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private SongRequestBoardPost[] songs;
    
    public SongRequestBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getSongRequestBoardPostCount();
        this.songs = new SongRequestBoardPost[size];
        
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT songID, clientID, creationTime, numberOfPeppers FROM song_request_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 120");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateSongRequestBoardPosts();
        
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
    
    private void populateSongRequestBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet resultsSet = getSongs();
        SongRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (resultsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(resultsSet.getString("songID"));
                songs[count] = new SongRequestBoardPost(nextCount, boardID, Long.parseLong(resultsSet.getString("clientID")), resultsSet.getString("creationTime"));
                this.songs[count].setNumberOfPostPeppers(Long.parseLong(resultsSet.getString("numberOfPeppers")));
                
                retrieve = new SongRetrieve(nextCount);
                
                this.songs[count].setContent(retrieve.getPodcast());
                this.songs[count].setSongName(retrieve.getMusicName());
                this.songs[count].setMusicPoster(retrieve.getMusicPoster());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(resultsSet.getString("clientID")), "client");
                
                this.songs[count].setClientName(clientRetrieve.getClientName());
                this.songs[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.songs[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public SongRequestBoardPost getSongRequestBoardPost(int count)
            
    {
        return songs[count];
    }
    
    public long length()
            
    {
        return songs.length;
    }
    
    private int getSongRequestBoardPostCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM song_request_board_posts WHERE boardID=" + this.boardID);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(creationTime)")); 
                
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
