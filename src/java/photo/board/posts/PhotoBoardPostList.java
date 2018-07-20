/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photo.board.posts;

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
public class PhotoBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private PhotoBoardPost[] photos;
    
    public PhotoBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getPhotoBoardPostCount();
        
        if (size > 25)
            
        {
            size = 25;
        }
        
        this.photos = new PhotoBoardPost[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT photoID, photoLocation, clientID, creationTime, longitudinalCreationDate, message, numberOfPeppers, numberOfComments FROM photo_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 25");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populatePhotoBoardPosts();
        
    }
    
    private ResultSet getPhotos()
            
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
    
    private void populatePhotoBoardPosts()
            
    {
        int count;
        String nextCount = null;
        ResultSet photosSet = getPhotos();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (photosSet.next() == true); count++) 

            {
                nextCount = photosSet.getString("photoID");
                photos[count] = new PhotoBoardPost(nextCount, boardID, Long.parseLong(photosSet.getString("clientID")), photosSet.getString("creationTime"), photosSet.getString("message"));
                this.photos[count].setNumberOfPostPeppers(Long.parseLong(photosSet.getString("numberOfPeppers")));
                this.photos[count].setNumberOfPostComments(Long.parseLong(photosSet.getString("numberOfComments")));
                this.photos[count].setPhotoLocation(photosSet.getString("photoLocation"));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(photosSet.getString("clientID")), "client");
                
                this.photos[count].setClientName(clientRetrieve.getClientName());
                this.photos[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.photos[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public PhotoBoardPost getPhotoBoardPost(int count)
            
    {
        return photos[count];
    }
    
    public long length()
            
    {
        return photos.length;
    }
    
    private int getPhotoBoardPostCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM photo_board_posts WHERE boardID=" + this.boardID);
            
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
