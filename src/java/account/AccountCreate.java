/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author El Jefe
 */
public class AccountCreate 

{
    private long accountNumber;
    private long accountHolderID;
    private String accountType;
    private String emailAddress;
    private String password;
    protected String registrationDate;
    protected String deletionDate;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public AccountCreate(long accountHolderID, String accountType, String emailAddress, String password)
            
    {
        this.accountNumber = -1;
        this.accountType = accountType;
        this.accountHolderID = accountHolderID;
        this.registrationDate = null;
        this.deletionDate = null;
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        this.registrationDate  = dateFormat.format(calendar.getTime());
        
        if (!emailAddress.equals(""))
            
        {
            //setEmail(email);
            this.emailAddress = emailAddress;
        }
        
        if (!password.equals(""))
            
        {
            //setPassword(password);
            this.password = password;
        }
        
        if (!emailAddress.equals(""))
            
        {
            this.accountNumber = generateAccountNumber();
            insertAccount();
        }
        
    }
    
    private long generateAccountNumber()
            
    {
        //generate two random integer numbers and multiply to create a long number to return
        long newAccountNumber;
        int leftInteger, rightInteger;
        String leftString, rightString, wholeString;
        
        newAccountNumber = 0;
        leftInteger = 0;
        rightInteger = 0;
        leftString = null;
        rightString = null;
        wholeString = null;
        
        leftInteger = (int) Math.ceil(Math.random() * 99); 
        rightInteger = (int) Math.ceil(Math.random() * 99); 
        leftString = String.valueOf(leftInteger);
        rightString = String.valueOf(rightInteger);
        wholeString = leftString + rightString;
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String creationTime  = dateFormat.format(calendar.getTime());
        
        newAccountNumber = Long.parseLong(wholeString + creationTime);
        
        return newAccountNumber;
        
    }
    
    private void insertAccount()
            
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
            statement = connection.prepareStatement("INSERT INTO `accounts`(accountNumber, accountType, accountHolderID, emailAddress, password, registrationDate) "
                    + "VALUES(" + accountNumber + ", '" + accountType + "', " + accountHolderID + ", '" + emailAddress + "', '" + password + "', '" + registrationDate + "')");
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
    
    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public long getAccountHolderID() 
    
    {
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
    
    public String getRegistrationDate() 
    
    {
        return registrationDate;
    }

    public String getDeletionDate() 
    
    {
        return deletionDate;
    }
    
}
