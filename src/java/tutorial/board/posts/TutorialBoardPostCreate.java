/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial.board.posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class TutorialBoardPostCreate 

{
    private long boardID;
    private long clientID;
    private String videoID;
    private String creationTime;
    private String deletionTime;
    private String title;
    private String channelTitle;
    private String thumbnail;
    private String message;
    private String description;
    private String videoLocation;
    private long longitudinalCreationDate;
    private long numberOfPostPeppers;
    private long numberOfPostComments;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public TutorialBoardPostCreate(String videoID, long boardID, long clientID, String creationTime, String message, String title, String channelTitle, String thumbnail, String description)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.title = title;
        this.channelTitle = channelTitle;
        this.thumbnail = thumbnail;
        this.message = message;
        this.description = description;
        this.videoLocation = "https://www.youtube.com/embed/" + videoID;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.numberOfPostPeppers = 0;
        this.numberOfPostComments = 0;
        
        insertTutorialBoardPost();
        
    }
    
    private void insertTutorialBoardPost()
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        message = modifyChars(message);
        description = modifyChars(description);
        title = modifyChars(title);
        channelTitle = modifyChars(channelTitle);
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO tutorial_board_posts(videoID, boardID, clientID, creationTime, longitudinalCreationDate, message, title, channelTitle, description, thumbnail, videoLocation, numberOfPeppers, numberOfComments) "
                    + "VALUES('" + this.videoID 
                    + "', " + this.boardID 
                    + ", " + this.clientID 
                    + ", '" + this.creationTime 
                    + "', " + this.longitudinalCreationDate 
                    + ", '" + this.message 
                    + "', '" + this.title 
                    + "', '" + this.channelTitle 
                    + "', '" + this.description 
                    + "', '" + this.thumbnail 
                    + "', '" + this.videoLocation 
                    + "', " + this.numberOfPostPeppers 
                    + ", " + this.numberOfPostComments 
                    + ")");
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
    
    private String modifyChars(String movieName)
            
    {
        String modification;
        char[] prohibitedChars = new char[19];
        int count;
        int index;
        boolean prohibitedExists = false;
        
        modification = "";
        prohibitedChars[0] = '`';
        prohibitedChars[1] = '~';
        modification = "";
        
        
        if ((movieName != null) && (!movieName.equals("")))
            
        {
            
            
            for (count = 0; count < movieName.length(); count++)
                
            {
                
                if (movieName.charAt(count) == '\'')
                    
                {
                    modification = modification + '\\'; 
                }
                
                if (movieName.charAt(count) == '\"')

                {
                    modification = modification + '\\'; 
                }
                
                for (index = 0; index < prohibitedChars.length; index++)
                    
                {
                    
                    if (movieName.charAt(count) == prohibitedChars[index])
                        
                    {
                        prohibitedExists = true;
                    }
                    
                }
                
                if (prohibitedExists == false)
                    
                {
                    modification = modification + movieName.charAt(count);
                }
                
            }
            
        }
        
        return modification;
        
    }
    
}
