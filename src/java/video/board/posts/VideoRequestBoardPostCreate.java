/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video.board.posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class VideoRequestBoardPostCreate 

{
    private long boardID;
    private long clientID;
    private long videoID;
    private String creationTime;
    private String deletionTime;
    private long longitudinalCreationDate;
    private String thumbnail;
    private String content;
    private String videoPoster;
    private String videoName;
    private long numberOfPostPeppers;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public VideoRequestBoardPostCreate(long videoID, long boardID, long clientID, String creationTime)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.thumbnail = null;
        this.content = null;
        this.videoPoster = null;
        this.videoName = null;
        this.numberOfPostPeppers = 0;
        
        boolean exists = search();
        
        if (exists == false)
            
        {
            insertVideoBoardPost();
        }
        
    }
    
    private boolean search()
            
    {
        boolean programExistsInAccount = false;
        
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT videoID FROM video_request_board_posts WHERE videoID=" + this.videoID + 
                    " AND boardID=" + this.boardID + " AND clientID=" + this.clientID + " AND creationTime='" + this.creationTime + "'");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true)
                    
                {

                    programExistsInAccount = true; 

                }
                
                else
                    
                {
                    
                    programExistsInAccount = false;
                    
                }
                
            }
            
            else
                
            {
                
                programExistsInAccount = false;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return programExistsInAccount;
        
    }
    
    private void insertVideoBoardPost()
            
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
            statement = connection.prepareStatement("INSERT INTO video_request_board_posts(videoID, boardID, clientID, creationTime, longitudinalCreationDate, numberOfPeppers) "
                    + "VALUES(" + this.videoID + ", " + this.boardID + ", " + this.clientID + ", '" + this.creationTime + "', " + this.longitudinalCreationDate + ", " + this.numberOfPostPeppers + ")");
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
        prohibitedChars[0] = '@';
        prohibitedChars[1] = '^';
        prohibitedChars[2] = '&';
        prohibitedChars[3] = ';';
        prohibitedChars[4] = '`';
        prohibitedChars[5] = '~';
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
