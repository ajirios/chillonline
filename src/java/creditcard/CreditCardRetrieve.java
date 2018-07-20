/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package creditcard;

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
public class CreditCardRetrieve 

{
    private long accountNumber;
    private long clientID;
    private long creditCardID;
    private String creditCardNumber;
    private int expiryMonth;
    private int expiryYear;
    private String ccv;
    private String paymentType;
    private String creditCardName;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public CreditCardRetrieve(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        ClientRetrieve clientRetrieve = new ClientRetrieve(accountNumber);
        this.clientID = clientRetrieve.getClientID();
        this.creditCardID = -1;
        this.creditCardNumber = null;
        this.expiryMonth = 0;
        this.expiryYear = 0;
        this.ccv = null;
        this.paymentType = null;
        this.creditCardName = null;
        
        constructRetrieve();
        System.out.println("Retrieved credit card " + creditCardNumber + " expiring on " + expiryMonth + ", " + expiryYear + " for account " + this.accountNumber);
        
    }
    
    private void constructRetrieve()
            
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
            statement = connection.prepareStatement("SELECT creditCardID, creditCardNumber, expiryMonth, expiryYear, creditCardName, ccv, paymentType "
                    + "FROM creditcards WHERE clientID=" + this.clientID);
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
                    
                    this.creditCardID = Long.parseLong(resultSet.getString("creditCardID"));
                    this.creditCardNumber = resultSet.getString("creditCardNumber");
                    this.expiryMonth = Integer.parseInt(resultSet.getString("expiryMonth"));
                    this.expiryYear = Integer.parseInt(resultSet.getString("expiryYear"));
                    this.ccv = resultSet.getString("ccv");
                    this.paymentType = resultSet.getString("paymentType");
                    this.creditCardName = resultSet.getString("creditCardName");
                    
                }
                
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

    public long getClientID() 
    
    {
        return clientID;
    }

    public long getCreditCardID() 
    
    {
        return creditCardID;
    }

    public String getCreditCardNumber() 
    
    {
        return creditCardNumber;
    }

    public int getExpiryMonth() 
    
    {
        return expiryMonth;
    }

    public int getExpiryYear() 
    
    {
        return expiryYear;
    }

    public String getCcv() 
    
    {
        return ccv;
    }

    public String getPaymentType() 
    
    {
        return paymentType;
    }

    public String getCreditCardName() 
    
    {
        return creditCardName;
    }
    
}
