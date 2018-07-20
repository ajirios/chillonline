/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.client;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class BoardClientList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection boardsConnection = null;
    private PreparedStatement boardsStatement = null;
    private ResultSet boardSet = null;
    
    private long boardID;
    private int size;
    private BoardClient[] boardClients;
    private int leftWingStart;
    private int leftWingEnd;
    private int rightWingStart;
    private int rightWingEnd;
    
    public BoardClientList(long boardID)
            
    {
        this.boardID = boardID;
        this.size = getBoardClientCount();
        this.boardClients = new BoardClient[size];
        this.leftWingStart = 0;
        this.leftWingEnd = this.leftWingStart + ((this.size - 1) / 2);
        this.rightWingStart = this.leftWingEnd + 1;
        this.rightWingEnd = this.size - 1;
        
        
        try
        {
            boardsConnection = DriverManager.getConnection(URL, userName, password);
            boardsStatement = boardsConnection.prepareStatement("SELECT clientID, firstName, lastName, middleName, clientName, city, "
                    + "province, country, gender, phoneNumber, profilePicture  FROM clients "
                    + "WHERE clientID IN (SELECT accountHolderID FROM accounts "
                    + "WHERE accountType='client' AND accountNumber IN (SELECT accountNumber FROM account_boards WHERE boardID=" + this.boardID + "))");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateBoardClients();
        
    }
    
    private ResultSet getBoards()
            
    {
        try
            
        {
            boardSet = boardsStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return boardSet;

    }
    
    private void populateBoardClients()
            
    {
        int count;
        long nextCount = 0;
        ResultSet boardsSet = getBoards();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (boardsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(boardsSet.getString("clientID"));
                boardClients[count] = new BoardClient(boardID, nextCount);
                boardClients[count].setFirstName(boardsSet.getString("firstName"));
                boardClients[count].setLastName(boardsSet.getString("lastName"));
                boardClients[count].setMiddleName(boardsSet.getString("middleName"));
                boardClients[count].setClientName(boardsSet.getString("clientName"));
                boardClients[count].setCity(boardsSet.getString("city"));
                boardClients[count].setProvince(boardsSet.getString("province"));
                boardClients[count].setCountry(boardsSet.getString("country"));
                boardClients[count].setGender(boardsSet.getString("gender"));
                boardClients[count].setPhoneNumber(boardsSet.getString("phoneNumber"));
                boardClients[count].setProfilePicture(boardsSet.getString("profilePicture"));
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public BoardClient getBoardClient(int count)
            
    {
        return boardClients[count];
    }
    
    public long length()
            
    {
        return boardClients.length;
    }
    
    private int getBoardClientCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(accountNumber) FROM account_boards WHERE boardID=" + this.boardID);
            
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
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true) 
                    
                {
                    
                    count = Integer.parseInt(resultSet.getString("COUNT(accountNumber)")); 
                    
                }
                
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
    
    public int getLeftWingStart() 
    
    {
        return leftWingStart;
    }

    public int getLeftWingEnd() 
    
    {
        return leftWingEnd;
    }

    public int getRightWingStart() 
    
    {
        return rightWingStart;
    }

    public int getRightWingEnd() 
    
    {
        return rightWingEnd;
    }
    
}
