/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package notice.board.posts;

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
public class NoticeBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private NoticeBoardPost[] notices;
    
    public NoticeBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getNoticeBoardPostCount();
        
        if (size > 25)
            
        {
            size = 25;
        }
        
        this.notices = new NoticeBoardPost[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT clientID, creationTime, longitudinalCreationDate, message, numberOfPeppers, numberOfComments FROM notice_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 25");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateNoticeBoardPosts();
        
    }
    
    private ResultSet getNotices()
            
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
    
    private void populateNoticeBoardPosts()
            
    {
        int count;
        ResultSet noticesSet = getNotices();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (noticesSet.next() == true); count++) 

            {
                notices[count] = new NoticeBoardPost(boardID, Long.parseLong(noticesSet.getString("clientID")), noticesSet.getString("creationTime"), noticesSet.getString("message"));
                this.notices[count].setNumberOfPostPeppers(Long.parseLong(noticesSet.getString("numberOfPeppers")));
                this.notices[count].setNumberOfPostComments(Long.parseLong(noticesSet.getString("numberOfComments")));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(noticesSet.getString("clientID")), "client");
                
                this.notices[count].setClientName(clientRetrieve.getClientName());
                this.notices[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.notices[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public NoticeBoardPost getNoticeBoardPost(int count)
            
    {
        return notices[count];
    }
    
    public long length()
            
    {
        return notices.length;
    }
    
    private int getNoticeBoardPostCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM notice_board_posts WHERE boardID=" + this.boardID);
            
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
