/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package join.board.posts;

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
public class JoinBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private JoinBoardPost[] joins;
    
    public JoinBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getJoinBoardPostCount();
        
        if (size > 25)
            
        {
            size = 25;
        }
        
        this.joins = new JoinBoardPost[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT clientID, creationTime, longitudinalCreationDate, numberOfPeppers, numberOfComments FROM join_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 25");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateJoinBoardPosts();
        
    }
    
    private ResultSet getJoins()
            
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
    
    private void populateJoinBoardPosts()
            
    {
        int count;
        ResultSet joinsSet = getJoins();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (joinsSet.next() == true); count++) 

            {
                joins[count] = new JoinBoardPost(boardID, Long.parseLong(joinsSet.getString("clientID")), joinsSet.getString("creationTime"));
                this.joins[count].setNumberOfPostPeppers(Long.parseLong(joinsSet.getString("numberOfPeppers")));
                this.joins[count].setNumberOfPostComments(Long.parseLong(joinsSet.getString("numberOfComments")));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(joinsSet.getString("clientID")), "client");
                
                this.joins[count].setClientName(clientRetrieve.getClientName());
                this.joins[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.joins[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public JoinBoardPost getJoinBoardPost(int count)
            
    {
        return joins[count];
    }
    
    public long length()
            
    {
        return joins.length;
    }
    
    private int getJoinBoardPostCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM join_board_posts WHERE boardID=" + this.boardID);
            
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
