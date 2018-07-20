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
public class VideoBoardPostCommentCreate 

{
    private String videoID;
    private long boardID;
    private long postClientID;
    private long commentClientID;
    private String postCreationTime;
    private String commentCreationTime;
    private String message;
    private long postLongitudinalCreationDate;
    private long commentLongitudinalCreationDate;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public VideoBoardPostCommentCreate(String videoID, long boardID, long postClientID, long commentClientID, String postCreationTime, String commentCreationTime, String message)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.commentClientID = commentClientID;
        this.postCreationTime = postCreationTime;
        this.commentCreationTime = commentCreationTime;
        this.message = message;
        this.postLongitudinalCreationDate = Long.parseLong(postCreationTime);
        this.commentLongitudinalCreationDate = Long.parseLong(commentCreationTime);
        
        insertVideoBoardPostComment();
        
    }
    
    private void insertVideoBoardPostComment()
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        message = modifyChars(message);
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO video_board_post_comments(videoID, boardID, postClientID, commentClientID, postCreationTime, commentCreationTime, postLongitudinalCreationDate, commentLongitudinalCreationDate, message) "
                    + "VALUES(" + this.videoID + ", " + this.boardID + ", " + this.postClientID + ", " + this.commentClientID + ", '" + this.postCreationTime + "', '" + this.commentCreationTime + "', " + this.postLongitudinalCreationDate + ", " + this.commentLongitudinalCreationDate + ", '" + this.message + "')");
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
