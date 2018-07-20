/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class AccountRetrieve 

{
    private long accountNumber;
    private long accountHolderID;
    private String accountType;
    private String emailAddress;
    private String password;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public AccountRetrieve(String emailAddress, String password)
            
    {
        this.accountNumber = -1;
        this.accountType = "client";
        this.accountHolderID = -1;
        this.emailAddress = emailAddress;
        this.password = password;
    }
    
    public AccountRetrieve(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.accountType = "client";
        this.accountHolderID = -1;
        this.emailAddress = null;
        this.password = null;
    }
    
    public AccountRetrieve(long clientID, String accountType)
            
    {
        this.accountNumber = -1;
        this.accountType = accountType;
        this.accountHolderID = clientID;
        this.emailAddress = null;
        this.password = null;
    }

    public long getAccountNumber() 
    
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT accountNumber FROM `accounts` WHERE emailAddress='" + this.emailAddress + 
                    "' AND password='" + this.password + "' AND accountType='client'");
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet != null)
                
            {
                if (resultSet.next() == true)

                {
                    
                    accountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                    
                }

                else

                {

                    accountNumber = -1; 

                }
                
            }
            
            else
                
            {
                accountNumber = -1;
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return accountNumber;
    }

    public long getAccountHolderID() 
    
    {
        return accountHolderID;
    }
    
    public long getAccountNumberByClientID()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT accountNumber FROM `accounts` WHERE accountType='client' AND accountHolderID=" + this.accountHolderID);
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true)
                    
                {
                    
                    accountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                    
                }
                
                else
                    
                {
                    
                    accountNumber = -1; 
                    
                }
                
            }
            
            else
                
            {
                
                accountNumber = -1; 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return accountNumber;
        
    }

    public long getAccountHolderIDByAccountNumber() 
    
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT accountHolderID FROM `accounts` WHERE accountNumber=" + this.accountNumber);
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true)
                    
                {
                    
                    accountHolderID = Long.parseLong(resultSet.getString("accountHolderID")); 
                    
                }
                
                else
                    
                {
                    
                    accountHolderID = -1; 
                    
                }
                
            }
            
            else
                
            {
                
                accountHolderID = -1; 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return accountHolderID;
    }

    public String getAccountType() 
    
    {
        return accountType;
    }

    public String getEmailAddress() 
    
    {
        return emailAddress;
    }

    public String getPassword() 
    
    {
        return password;
    }
    
}
