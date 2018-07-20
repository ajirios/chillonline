/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.requests;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class ConnectionRequestList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection connectionsConnection = null;
    private PreparedStatement connectionsStatement = null;
    private ResultSet connectionSet = null;
    
    private long accountNumber;
    private int size;
    private ConnectionRequest[] connections;
    private int connectionListingContainerLength;
    private int connectionsInitialLength;
    private int connectionsInitialAreaLength;
    private int connectionListingAreaLength;
    private int connectionsAreaLength;
    
    public ConnectionRequestList(long accountNumber)
    {
        this.accountNumber = accountNumber;
        this.size = getConnectionCount();
        this.connections = new ConnectionRequest[size];
        this.connectionsInitialLength = 350;
        this.connectionsInitialAreaLength = 450;
        this.connectionListingContainerLength = 120;
        this.connectionListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 4))) * this.connectionListingContainerLength);
        this.connectionsAreaLength = this.connectionListingAreaLength + 100;
        
        
        try
        {
            connectionsConnection = DriverManager.getConnection(URL, userName, password);
            connectionsStatement = connectionsConnection.prepareStatement("SELECT clientID, firstName, clientName, city, province, "
                    + "country, gender, emailAddress, phoneNumber, wallPoster, profilePicture FROM clients "
                    + "WHERE clientID IN (SELECT clientID FROM account_requests WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateConnections();

    }
    
    private ResultSet getConnections()
            
    {
        try
            
        {
            connectionSet = connectionsStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return connectionSet;

    }
    
    private void populateConnections()
            
    {
        int count;
        long nextCount = 0;
        ResultSet connectionsSet = getConnections();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (connectionsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(connectionsSet.getString("clientID"));
                connections[count] = new ConnectionRequest(this.accountNumber, nextCount, connectionsSet.getString("firstName"), connectionsSet.getString("clientName"), connectionsSet.getString("city"), connectionsSet.getString("province"), connectionsSet.getString("country"), connectionsSet.getString("gender"), connectionsSet.getString("emailAddress"), connectionsSet.getString("phoneNumber"), connectionsSet.getString("wallPoster"), connectionsSet.getString("profilePicture"));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public ConnectionRequest getConnection(int count)
            
    {
        return connections[count];
    }
    
    public long length()
            
    {
        return connections.length;
    }
    
    private int getConnectionCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(clientID) FROM account_requests WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(clientID)")); 
                
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
    
    public int getRequestListingAreaLength() 
    
    {
        return connectionListingAreaLength;
    }
    
    public int getRequestsAreaLength() 
    
    {
        return connectionsAreaLength;
    }

}
