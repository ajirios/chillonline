/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode.board.posts;

import client.ClientRetrieve;
import episode.EpisodeRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeRequestBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private EpisodeRequestBoardPost[] episodes;
    
    public EpisodeRequestBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getEpisodeRequestBoardPostCount();
        this.episodes = new EpisodeRequestBoardPost[size];
        
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT episodeID, clientID, creationTime, numberOfPeppers FROM episode_request_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 120");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateEpisodeRequestBoardPosts();
        
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
    
    private void populateEpisodeRequestBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet resultsSet = getEpisodes();
        EpisodeRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (resultsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(resultsSet.getString("episodeID"));
                episodes[count] = new EpisodeRequestBoardPost(nextCount, boardID, Long.parseLong(resultsSet.getString("clientID")), resultsSet.getString("creationTime"));
                this.episodes[count].setNumberOfPostPeppers(Long.parseLong(resultsSet.getString("numberOfPeppers")));
                
                retrieve = new EpisodeRetrieve(nextCount);
                
                this.episodes[count].setContent(retrieve.getPodcast());
                this.episodes[count].setThumbnail(retrieve.getThumbnail());
                this.episodes[count].setEpisodeName(retrieve.getEpisodeName());
                this.episodes[count].setSeriesPoster(retrieve.getSeriesPoster());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(resultsSet.getString("clientID")), "client");
                
                this.episodes[count].setClientName(clientRetrieve.getClientName());
                this.episodes[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.episodes[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public EpisodeRequestBoardPost getEpisodeRequestBoardPost(int count)
            
    {
        return episodes[count];
    }
    
    public long length()
            
    {
        return episodes.length;
    }
    
    private int getEpisodeRequestBoardPostCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM episode_request_board_posts WHERE boardID=" + this.boardID);
            
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
