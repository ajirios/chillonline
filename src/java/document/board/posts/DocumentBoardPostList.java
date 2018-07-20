/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package document.board.posts;

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
public class DocumentBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    private long boardID;
    private int size;
    private DocumentBoardPost[] documents;
    
    public DocumentBoardPostList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getDocumentBoardPostCount();
        
        if (size > 25)
            
        {
            size = 25;
        }
        
        this.documents = new DocumentBoardPost[size];
        
        
        try
            
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT documentID, documentLocation, clientID, creationTime, longitudinalCreationDate, message, numberOfPeppers, numberOfComments FROM document_board_posts "
                    + "WHERE boardID=" + this.boardID + " ORDER BY longitudinalCreationDate DESC LIMIT 25");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateDocumentBoardPosts();
        
    }
    
    private ResultSet getDocuments()
            
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
    
    private void populateDocumentBoardPosts()
            
    {
        int count;
        String nextCount = null;
        ResultSet documentsSet = getDocuments();
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (documentsSet.next() == true); count++) 

            {
                nextCount = documentsSet.getString("documentID");
                documents[count] = new DocumentBoardPost(nextCount, boardID, Long.parseLong(documentsSet.getString("clientID")), documentsSet.getString("creationTime"), documentsSet.getString("message"));
                this.documents[count].setNumberOfPostPeppers(Long.parseLong(documentsSet.getString("numberOfPeppers")));
                this.documents[count].setNumberOfPostComments(Long.parseLong(documentsSet.getString("numberOfComments")));
                this.documents[count].setDocumentLocation(documentsSet.getString("documentLocation"));
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(documentsSet.getString("clientID")), "client");
                
                this.documents[count].setClientName(clientRetrieve.getClientName());
                this.documents[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.documents[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public DocumentBoardPost getDocumentBoardPost(int count)
            
    {
        return documents[count];
    }
    
    public long length()
            
    {
        return documents.length;
    }
    
    private int getDocumentBoardPostCount()
            
    {
        int count = 0;
        
        try
            
        {
            
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM document_board_posts WHERE boardID=" + this.boardID);
            
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
