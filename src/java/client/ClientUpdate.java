/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class ClientUpdate 

{
    private long accountNumber;
    private long clientID;
    private String firstName;
    private String lastName;
    private String middleName;
    private String clientName;
    private int nameStyle;
    private String city;
    private String province;
    private String country;
    private String gender;
    private String emailAddress;
    private String password;
    private String phoneNumber;
    private String profilePicture;
    private String wallPaper;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public ClientUpdate(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        ClientRetrieve retrieve = new ClientRetrieve(accountNumber);
        this.clientID = retrieve.getClientID();
        this.firstName = null;
        this.lastName = null;
        this.middleName = null;
        this.clientName = null;
        this.nameStyle = 1;
        this.city = null;
        this.province = null;
        this.country = null;
        this.gender = null;
        this.emailAddress = null;
        this.password = null;
        this.phoneNumber = null;
        this.profilePicture = null;
        this.wallPaper = null;
        
    }
    
    public void setClientID(long clientID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set clientID=" + clientID + " WHERE clientID=" + this.clientID);
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
    
    public void setFirstName(String firstName)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set firstName='" + firstName + "' WHERE clientID=" + this.clientID);
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
                this.firstName = firstName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setLastName(String lastName)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set lastName='" + lastName + "' WHERE clientID=" + this.clientID);
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
                this.lastName = lastName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setMiddleName(String middleName)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set middleName='" + middleName + "' WHERE clientID=" + this.clientID);
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
                this.middleName = middleName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setClientName(String clientName) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set clientName='" + clientName + "' WHERE clientID=" + this.clientID);
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
                this.clientName = clientName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setNameStyle(int nameStyle) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set nameStyle=" + nameStyle + " WHERE clientID=" + this.clientID);
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
                this.nameStyle = nameStyle;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setCity(String city)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set city='" + city + "' WHERE clientID=" + this.clientID);
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
                this.city = city;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setProvince(String province)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set province='" + province + "' WHERE clientID=" + this.clientID);
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
                this.province = province;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setCountry(String country)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set country='" + country + "' WHERE clientID=" + this.clientID);
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
                this.country = country;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setGender(String gender)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set gender='" + gender + "' WHERE clientID=" + this.clientID);
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
                this.gender = gender;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setEmail(String email)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set emailAddress='" + email + "' WHERE clientID=" + this.clientID);
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
                this.emailAddress = email;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void setPassword(String password)
            
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set password='" + password + "' WHERE clientID=" + this.clientID);
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
                this.password = password;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set phoneNumber='" + phoneNumber + "' WHERE clientID=" + this.clientID);
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
                this.phoneNumber = phoneNumber;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setProfilePicture(String profilePicture) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
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
            statement = connection.prepareStatement("UPDATE clients set profilePicture='" + profilePicture + "' WHERE clientID=" + this.clientID);
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
                this.profilePicture = profilePicture;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setWallPaper(String wallPaper) 
    
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
            statement = connection.prepareStatement("UPDATE clients set wallPoster='" + wallPaper + "' WHERE clientID=" + this.clientID);
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
                this.wallPaper = wallPaper;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
