/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video.board.posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



/**
 *
 * @author El Jefe
 */
public class VideoRequestBoardPostPepperCreate 

{
    private long videoID;
    private long boardID;
    private long postClientID;
    private long pepperClientID;
    private String postCreationTime;
    private long postLongitudinalCreationDate;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public VideoRequestBoardPostPepperCreate(long videoID, long boardID, long postClientID, long pepperClientID, String postCreationTime)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.pepperClientID = pepperClientID;
        this.postCreationTime = postCreationTime;
        this.postLongitudinalCreationDate = Long.parseLong(postCreationTime);
        
        insertVideoRequestBoardPostPepper();
        
    }
    
    private void insertVideoRequestBoardPostPepper()
            
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
            statement = connection.prepareStatement("INSERT INTO video_request_board_post_peppers(videoID, boardID, postClientID, pepperClientID, postCreationTime, postLongitudinalCreationDate) "
                    + "VALUES(" + this.videoID + ", " + this.boardID + ", " + this.postClientID + ", " + this.pepperClientID + ", '" + this.postCreationTime + "', " + this.postLongitudinalCreationDate + ")");
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
        
        return modification;
        
    }
    
}
