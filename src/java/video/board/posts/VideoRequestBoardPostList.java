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
public class VideoRequestBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private VideoRequestBoardPost[] videos;
    
    public VideoRequestBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getVideoRequestBoardPostCount();
        this.videos = new VideoRequestBoardPost[size];
        
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT videoID, clientID, creationTime, numberOfPeppers FROM video_request_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 120");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateVideoRequestBoardPosts();
        
    }
    
    private ResultSet getVideos()
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
    
    private void populateVideoRequestBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet resultsSet = getVideos();
        VideoRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (resultsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(resultsSet.getString("videoID"));
                videos[count] = new VideoRequestBoardPost(nextCount, boardID, Long.parseLong(resultsSet.getString("clientID")), resultsSet.getString("creationTime"));
                this.videos[count].setNumberOfPostPeppers(Long.parseLong(resultsSet.getString("numberOfPeppers")));
                
                retrieve = new VideoRetrieve(nextCount);
                
                this.videos[count].setContent(retrieve.getVideoContent());
                this.videos[count].setThumbnail(retrieve.getVideoThumbnail());
                this.videos[count].setVideoName(retrieve.getVideoName());
                this.videos[count].setVideoPoster(retrieve.getVideoThumbnail());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(resultsSet.getString("clientID")), "client");
                
                this.videos[count].setClientName(clientRetrieve.getClientName());
                this.videos[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.videos[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public VideoRequestBoardPost getVideoRequestBoardPost(int count)
            
    {
        return videos[count];
    }
    
    public long length()
            
    {
        return videos.length;
    }
    
    private int getVideoRequestBoardPostCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM video_request_board_posts WHERE boardID=" + this.boardID);
            
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
