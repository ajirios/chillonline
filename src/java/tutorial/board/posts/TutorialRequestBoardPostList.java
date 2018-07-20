/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial.board.posts;

import client.ClientRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class TutorialRequestBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private TutorialRequestBoardPost[] tutorials;
    
    public TutorialRequestBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getTutorialRequestBoardPostCount();
        this.tutorials = new TutorialRequestBoardPost[size];
        
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT videoID, title, thumbnail, clientID, creationTime, numberOfPeppers FROM tutorial_request_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 120");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateTutorialRequestBoardPosts();
        
    }
    
    private ResultSet getTutorials()
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
    
    private void populateTutorialRequestBoardPosts()
            
    {
        int count;
        String nextCount = null;
        ResultSet resultsSet = getTutorials();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (resultsSet.next() == true); count++) 

            {
                nextCount = resultsSet.getString("videoID");
                tutorials[count] = new TutorialRequestBoardPost(nextCount, boardID, Long.parseLong(resultsSet.getString("clientID")), resultsSet.getString("creationTime"));
                this.tutorials[count].setNumberOfPostPeppers(Long.parseLong(resultsSet.getString("numberOfPeppers")));
                this.tutorials[count].setTitle(resultsSet.getString("title"));
                this.tutorials[count].setThumbnail(resultsSet.getString("thumbnail"));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(resultsSet.getString("clientID")), "client");
                
                this.tutorials[count].setClientName(clientRetrieve.getClientName());
                this.tutorials[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.tutorials[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public TutorialRequestBoardPost getTutorialRequestBoardPost(int count)
            
    {
        return tutorials[count];
    }
    
    public long length()
            
    {
        return tutorials.length;
    }
    
    private int getTutorialRequestBoardPostCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM tutorial_request_board_posts WHERE boardID=" + this.boardID);
            
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
