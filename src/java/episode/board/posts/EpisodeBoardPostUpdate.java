/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode.board.posts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeBoardPostUpdate 

{
    private long boardID;
    private long clientID;
    private long episodeID;
    private String creationTime;
    private String deletionTime;
    private String message;
    private long longitudinalCreationDate;
    private long numberOfPostPeppers;
    private long numberOfPostComments;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public EpisodeBoardPostUpdate(long episodeID, long boardID, long clientID, String creationTime)
            
    {
        this.episodeID = episodeID;
        this.boardID = boardID;
        this.clientID = clientID;
        this.creationTime = creationTime;
        this.deletionTime = null;
        this.message = null;
        this.longitudinalCreationDate = Long.parseLong(creationTime);
        this.numberOfPostPeppers = 0;
        this.numberOfPostComments = 0;
        
    }

    public void setClientID(long clientID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set clientID=" + clientID + " WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate(); 
                this.clientID = clientID;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setEpisodeID(long episodeID) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE document_board_posts set episodeID=" + episodeID + " WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate();
                this.episodeID = episodeID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationTime(String creationTime) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set creationTime='" + creationTime + "' WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate();
                this.creationTime = creationTime;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setDeletionTime(String deletionTime) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set deletionTime='" + deletionTime + "' WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate();
                this.deletionTime = deletionTime;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setMessage(String message) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set message='" + message + "' WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
                
                result = statement.executeUpdate();
                this.message = message;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setLongitudinalCreationDate(long longitudinalCreationDate) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set longitudinalCreationDate=" + longitudinalCreationDate + " WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate(); 
                this.longitudinalCreationDate = longitudinalCreationDate;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNumberOfPostPeppers(long numberOfPostPeppers) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set numberOfPeppers=" + numberOfPostPeppers + " WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
            
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
            
                result = statement.executeUpdate(); 
                this.numberOfPostPeppers = numberOfPostPeppers;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNumberOfPostComments(long numberOfPostComments) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE episode_board_posts set numberOfComments=" + numberOfPostComments + " WHERE boardID=" + this.boardID + 
                    " AND clientID=" + this.clientID + " AND longitudinalCreationDate=" + this.longitudinalCreationDate + " AND episodeID=" + this.episodeID);
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
            
                result = statement.executeUpdate(); 
                this.numberOfPostComments = numberOfPostComments;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
