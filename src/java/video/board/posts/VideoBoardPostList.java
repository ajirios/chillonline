/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video.board.posts;

import client.ClientRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import video.VideoRetrieve;

/**
 *
 * @author El Jefe
 */
public class VideoBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection moviesConnection = null;
    private PreparedStatement moviesStatement = null;
    private ResultSet movieSet = null;
    
    private long boardID;
    private int size;
    private VideoBoardPost[] movies;
    
    public VideoBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getVideoBoardPostCount();
        this.movies = new VideoBoardPost[size];
        
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT videoID, clientID, creationTime, message, numberOfPeppers, numberOfComments FROM video_board_posts "
                    + "WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateVideoBoardPosts();
        
    }
    
    private ResultSet getMovies()
    {
        try
        {
            movieSet = moviesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return movieSet;

    }
    
    private void populateVideoBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet moviesSet = getMovies();
        VideoRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (moviesSet.next() == true); count++) 
                
            {
                nextCount = Long.parseLong(moviesSet.getString("videoID"));
                movies[count] = new VideoBoardPost(nextCount, boardID, Long.parseLong(moviesSet.getString("clientID")), moviesSet.getString("creationTime"), moviesSet.getString("message"));
                this.movies[count].setNumberOfPostPeppers(Long.parseLong(moviesSet.getString("numberOfPeppers")));
                this.movies[count].setNumberOfPostComments(Long.parseLong(moviesSet.getString("numberOfComments")));
                
                retrieve = new VideoRetrieve(nextCount);
                
                this.movies[count].setContent(retrieve.getVideoContent());
                this.movies[count].setThumbnail(retrieve.getVideoThumbnail());
                this.movies[count].setVideoName(retrieve.getVideoName());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(moviesSet.getString("clientID")), "client");
                
                this.movies[count].setClientName(clientRetrieve.getClientName());
                this.movies[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.movies[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public VideoBoardPost getVideoBoardPost(int count)
            
    {
        return movies[count];
    }
    
    public long length()
            
    {
        return movies.length;
    }
    
    private int getVideoBoardPostCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM video_board_posts WHERE boardID=" + this.boardID);
            
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
