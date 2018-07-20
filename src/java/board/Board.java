/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

import client.ClientList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class Board 

{
    protected long boardID;
    protected long clientID;
    protected String boardName;
    protected int boardClass;
    protected int boardPrice;
    protected String description;
    protected String boardPoster;
    protected String registrationDate;
    protected String deletionDate;
    protected String publicityMode;
    protected long numberOfMembers;
    protected String creatorName;
    protected ClientList clientList;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Board(long clientID, String boardName, int boardClass, String description, String publicityMode)
            
    {
        this.boardID = -1;
        this.clientID = clientID;
        this.boardName = boardName;
        this.boardClass = boardClass;
        this.boardPrice = 0;
        this.description = description;
        this.publicityMode = publicityMode;
        this.boardPoster = null;
        this.numberOfMembers = 0;
        this.registrationDate = null;
        this.deletionDate = null;
        this.clientList = null;
        
        this.creatorName = constructCreatorName();
    }
    
    public Board(long boardID)
            
    {
        this.boardID = boardID;
        this.clientID = -1;
        this.boardName = null;
        this.boardClass = -1;
        this.boardPrice = 0;
        this.description = null;
        this.publicityMode = null;
        this.boardPoster = null;
        this.numberOfMembers = 0;
        this.registrationDate = null;
        this.deletionDate = null;
        this.clientList = null;
        
        this.creatorName = constructCreatorName();
    }
    
    private String constructCreatorName()
            
    {
        String clientName = null;
        
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
            statement = connection.prepareStatement("SELECT clientName FROM clients WHERE clientID=" + this.clientID);
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
                    
                    clientName = resultSet.getString("clientName"); 
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return clientName;
        
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getBoardName() 
    
    {
        return boardName;
    }

    public void setBoardName(String boardName) 
    
    {
        this.boardName = boardName;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public void setDescription(String description) 
    
    {
        this.description = description;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public int getBoardPrice() 
    
    {
        return boardPrice;
    }

    public void setBoardPrice(int boardPrice) 
    
    {
        this.boardPrice = boardPrice;
    }

    public String getBoardPoster() 
    
    {
        return boardPoster;
    }

    public void setBoardPoster(String boardPoster) 
    
    {
        this.boardPoster = boardPoster;
    }

    public String getPublicityMode() 
    
    {
        return publicityMode;
    }

    public void setPublicityMode(String publicityMode) 
    
    {
        this.publicityMode = publicityMode;
    }

    public ClientList getClientList() 
    
    {
        return clientList;
    }

    public void setClientList(ClientList clientList) 
    
    {
        this.clientList = clientList;
    }

    public String getRegistrationDate() 
    
    {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) 
    
    {
        this.registrationDate = registrationDate;
    }

    public String getDeletionDate() 
    
    {
        return deletionDate;
    }

    public void setDeletionDate(String deletionDate) 
    
    {
        this.deletionDate = deletionDate;
    }

    public int getBoardClass() 
    
    {
        return boardClass;
    }

    public void setBoardClass(int boardClass) 
    
    {
        this.boardClass = boardClass;
    }

    public long getNumberOfMembers() 
    
    {
        return numberOfMembers;
    }

    public void setNumberOfMembers(long numberOfMembers) 
    
    {
        this.numberOfMembers = numberOfMembers;
    }

    public String getCreatorName() 
    
    {
        return creatorName;
    }

    public void setCreatorName(String creatorName) 
    
    {
        this.creatorName = creatorName;
    }
    
}
