/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package song.board.posts;

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
public class SongBoardPostCommentList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private String songID;
    private long postClientID;
    private long postLongitudinalCreationDate;
    private long boardID;
    private int size;
    private SongBoardPostComment[] comments;
    
    public SongBoardPostCommentList(String songID, long boardID, long postClientID, long postLongitudinalCreationDate)
            
    {
        this.songID = songID;
        this.boardID = boardID;
        this.postClientID = postClientID;
        this.postLongitudinalCreationDate = postLongitudinalCreationDate;
        this.size = getSongBoardPostCommentCount();
        this.comments = new SongBoardPostComment[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT commentClientID, commentCreationTime, commentLongitudinalCreationDate, message"
                    + "FROM song_board_post_comments WHERE boardID=" + this.boardID + " AND postClientID=" + this.postClientID + " AND postLongitudinalCreationDate=" 
                    + this.postLongitudinalCreationDate + " AND songID=" + this.songID + " ORDER BY commentLongitudinalCreationDate DESC");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateSongBoardPostComments();
        
    }
    
    private ResultSet getComments()
            
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
    
    private void populateSongBoardPostComments()
            
    {
        int count;
        String nextCount = null;
        ResultSet commentsSet = getComments();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (commentsSet.next() == true); count++) 

            {
                nextCount = commentsSet.getString("songID");
                comments[count] = new SongBoardPostComment(nextCount, boardID, Long.parseLong(commentsSet.getString("postClientID")), Long.parseLong(commentsSet.getString("commentClientID")), 
                        commentsSet.getString("postCreationTime"), commentsSet.getString("commentCreationTime"), commentsSet.getString("message"));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(commentsSet.getString("clientID")), "client");
                
                this.comments[count].setClientName(clientRetrieve.getClientName());
                this.comments[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.comments[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public SongBoardPostComment getSongBoardPostComment(int count)
            
    {
        return comments[count];
    }
    
    public long length()
            
    {
        return comments.length;
    }
    
    private int getSongBoardPostCommentCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(commentCreationTime) FROM song_board_post_comments WHERE boardID=" + this.boardID + 
                    " AND postClientID=" + this.postClientID + " AND postLongitudinalCreationDate=" + this.postLongitudinalCreationDate + " AND songID=" + this.songID);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(commentCreationTime)")); 
                
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
