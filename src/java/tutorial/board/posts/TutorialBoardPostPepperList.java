/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial.board.posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class TutorialBoardPostPepperList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private String videoID;
    private long postClientID;
    private long postLongitudinalCreationDate;
    private long boardID;
    private int size;
    
    public TutorialBoardPostPepperList(String videoID, long boardID, long postClientID, long postLongitudinalCreationDate)
            
    {
        this.videoID = videoID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.postLongitudinalCreationDate = postLongitudinalCreationDate;
        this.size = getTutorialBoardPostPepperCount();
        
    }
    
    private ResultSet getPeppers()
            
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
    
    private int getTutorialBoardPostPepperCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(pepperClientID) FROM tutorial_board_post_peppers WHERE boardID=" + this.boardID + 
                    " AND postClientID=" + this.postClientID + " AND postLongitudinalCreationDate=" + this.postLongitudinalCreationDate + " AND videoID='" + this.videoID + "'");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(pepperClientID)")); 
                
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
