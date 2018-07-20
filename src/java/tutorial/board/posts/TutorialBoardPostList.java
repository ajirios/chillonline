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
public class TutorialBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private TutorialBoardPost[] tutorials;
    
    public TutorialBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getTutorialBoardPostCount();
        
        if (size > 50)
            
        {
            size = 50;
        }
        
        this.tutorials = new TutorialBoardPost[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT videoID, title, channelTitle, thumbnail, description, videoLocation, clientID, creationTime, longitudinalCreationDate, message, numberOfPeppers, numberOfComments FROM tutorial_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 50");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateTutorialBoardPosts();
        
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
    
    private void populateTutorialBoardPosts()
            
    {
        int count;
        String nextCount = null;
        ResultSet tutorialsSet = getTutorials();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (tutorialsSet.next() == true); count++) 

            {
                nextCount = tutorialsSet.getString("videoID");
                tutorials[count] = new TutorialBoardPost(nextCount, boardID, Long.parseLong(tutorialsSet.getString("clientID")), tutorialsSet.getString("creationTime"), tutorialsSet.getString("message"));
                this.tutorials[count].setNumberOfPostPeppers(Long.parseLong(tutorialsSet.getString("numberOfPeppers")));
                this.tutorials[count].setNumberOfPostComments(Long.parseLong(tutorialsSet.getString("numberOfComments")));
                this.tutorials[count].setVideoLocation(tutorialsSet.getString("videoLocation"));
                this.tutorials[count].setTitle(tutorialsSet.getString("title"));
                this.tutorials[count].setChannelTitle(tutorialsSet.getString("channelTitle"));
                this.tutorials[count].setThumbnail(tutorialsSet.getString("thumbnail"));
                this.tutorials[count].setDescription(tutorialsSet.getString("description"));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(tutorialsSet.getString("clientID")), "client");
                
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
    
    public TutorialBoardPost getTutorialBoardPost(int count)
            
    {
        return tutorials[count];
    }
    
    public long length()
            
    {
        return tutorials.length;
    }
    
    private int getTutorialBoardPostCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM tutorial_board_posts WHERE boardID=" + this.boardID);
            
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
