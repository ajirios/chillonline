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
 * @author ajirios
 */
public class Account 

{
    protected long accountNumber;
    protected String accountType;
    protected String emailAddress;
    protected String password;
    protected long accountHolderID;
    protected String registrationDate;
    protected String deletionDate;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Account(String emailAddress)
            
    {
        this.accountNumber = -1;
        this.accountType = null;
        this.accountHolderID = -1;
        this.emailAddress = emailAddress;
        this.password = null;
        this.registrationDate = null;
        this.deletionDate = null;
        boolean emailExists = false;
        
        emailExists = emailAddressExists(emailAddress);
        
        if (emailExists == true)
            
        {
             constructAccount(emailAddress);
        }
        
    }
    
    public Account(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.accountType = null;
        this.accountHolderID = -1;
        this.emailAddress = null;
        this.password = null;
        boolean emailExists = false;
        
        emailExists = emailAddressExists(emailAddress);
        
        if (emailExists == true)
            
        {
             constructAccount(accountNumber);
        }
        
    }
    
    private void constructAccount(long accountNumber)
            
    {
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
            statement = connection.prepareStatement("SELECT accountType, accountHolderID, emailAddress, password FROM accounts WHERE accountNumber=" + accountNumber);
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
            if (resultSet.next() == true)
                
            {
            
                this.emailAddress = resultSet.getString("emailAddress"); 
                this.password = resultSet.getString("password"); 
                this.accountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                this.accountType = resultSet.getString("accountType"); 
                this.accountHolderID = Long.parseLong(resultSet.getString("accountHolderID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructAccount(String emailAddress)
            
    {
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
            statement = connection.prepareStatement("SELECT accountNumber, accountType, accountHolderID, password FROM accounts WHERE emailAddress='" + emailAddress + "'");
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
            if (resultSet.next() == true)
                
            {
            
                this.emailAddress = resultSet.getString("emailAddress"); 
                this.password = resultSet.getString("password"); 
                this.accountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                this.accountType = resultSet.getString("accountType"); 
                this.accountHolderID = Long.parseLong(resultSet.getString("accountHolderID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public void createAccount(String emailAddress, String password, long accountNumber, String accountType, long accountHolderID)
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `accounts`(accountNumber, accountType, accountHolderID, emailAddress, password) "
                    + "VALUES(" + accountNumber + ", '" + accountType + "', " + accountHolderID + ", '" + emailAddress + "', '" + password + "')");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private boolean emailAddressExists(String emailAddress)
            
    {
        boolean emailAddressExists;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        emailAddressExists = false;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT accountNumber FROM accounts WHERE emailAddress='" + emailAddress + "'");
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
        
        if (resultSet != null)
            
        {
            
            emailAddressExists = true;
            
        }
        
        else
            
        {

            emailAddressExists = false;
            
        }
        
        return emailAddressExists;
    }
    
    private long requestNewAccountNumber()
            
    {
        long newAccountNumber;
        long maximumNumber;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        newAccountNumber = 1;
        maximumNumber = 0;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT MAX(accountNumber) FROM accounts");
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
            if (resultSet.next() == true)
                
            {
            
                maximumNumber = Long.parseLong(resultSet.getString("MAX(accountNumber)")); 
                newAccountNumber = maximumNumber + 1;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return newAccountNumber;
        
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) 
    
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
            statement = connection.prepareStatement("UPDATE accounts set accountNumber=" + accountNumber + " WHERE accountNumber=" + this.accountNumber);
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
                this.accountNumber = accountNumber;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getAccountType() 
    
    {
        return accountType;
    }

    public void setAccountType(String accountType) 
    
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
            statement = connection.prepareStatement("UPDATE accounts set accountType='" + accountType + "' WHERE accountNumber=" + this.accountNumber);
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
                this.accountType = accountType;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getEmailAddress() 
    
    {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) 
    
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
            statement = connection.prepareStatement("UPDATE accounts set emailAddress='" + emailAddress + "' WHERE accountNumber=" + this.accountNumber);
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
                this.emailAddress = emailAddress;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getPassword() 
    
    {
        return password;
    }

    public void setPassword(String password) 
    
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
            statement = connection.prepareStatement("UPDATE accounts set password='" + password + "' WHERE accountNumber=" + this.accountNumber);
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

    public long getAccountHolderID() 
    
    {
        return accountHolderID;
    }

    public void setAccountHolderID(long accountHolderID) 
    
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
            statement = connection.prepareStatement("UPDATE accounts set accountHolderID=" + accountHolderID + " WHERE accountNumber=" + this.accountNumber);
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
                this.accountHolderID = accountHolderID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
