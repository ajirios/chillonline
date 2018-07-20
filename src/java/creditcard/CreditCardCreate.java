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
public class CreditCardCreate 

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
    
    public CreditCardCreate(long accountNumber, String creditCardNumber, int expiryMonth, int expiryYear, String ccv, String creditCardName, String paymentType)
            
    {
        this.accountNumber = accountNumber;
        ClientRetrieve client = new ClientRetrieve(accountNumber);
        this.clientID = client.getClientID();
        this.creditCardNumber = creditCardNumber;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.ccv = ccv;
        this.creditCardName = creditCardName;
        this.paymentType = paymentType;
        
        if (tableIsEmpty() == true)
            
        {
            //if boards database table is empty, set boardID to 0 
            this.creditCardID = 0;
            
            //try insert into boards (boardID) values (boardID);
            insertCreditCard(this.creditCardID);
        }
        
        else if (tableIsEmpty() == false)
            
        {
            //else if boards database table is not null, get the next maximum boardID and set it
            this.creditCardID = getNextMaximumCreditCardID();
            
            //try insert into boards (boardID) values (boardID);
            insertCreditCard(this.creditCardID);
        }
        
    }
    
    public void insertCreditCard(long creditCardID)
            
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
            statement = connection.prepareStatement("INSERT INTO `creditcards`(creditCardID, clientID, creditCardNumber, creditCardName, ccv, paymentType, expiryMonth, expiryYear) "
                    + "VALUES(" + creditCardID 
                    + ", " + this.clientID 
                    + ", '" + this.creditCardNumber 
                    + "', '" + this.creditCardName 
                    + "', '" + this.ccv 
                    + "', '" + this.paymentType 
                    + "', " + this.expiryMonth 
                    + ", " + this.expiryYear 
                    + ")");
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
    
    private boolean tableIsEmpty()
            
    {
        boolean tableIsEmpty;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        tableIsEmpty = false;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT creditCardID FROM creditcards");
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
                    
                    tableIsEmpty = false;
                    
                }
                
                else
                    
                {
                    
                    tableIsEmpty = true;
                    
                }
                
            }
            
            else
                
            {
                
                tableIsEmpty = true;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return tableIsEmpty;
    }
    
    private long getNextMaximumCreditCardID()
            
    {
        long nextMaximumBoardID;
        long maximumBoardID;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        nextMaximumBoardID = 1;
        maximumBoardID = 0;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT MAX(creditCardID) FROM creditcards");
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
            
                maximumBoardID = Long.parseLong(resultSet.getString("MAX(creditCardID)")); 
                nextMaximumBoardID = maximumBoardID + 1;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return nextMaximumBoardID;
        
    }
    
    private boolean search()
            
    {
        boolean programExistsInAccount = false;
        
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
            statement = connection.prepareStatement("SELECT creditCardID FROM creditcards WHERE creditCardNumber='" + this.creditCardNumber + "' AND ccv='" + this.ccv + "'");
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

                    programExistsInAccount = true; 

                }
                
                else
                    
                {
                    
                    programExistsInAccount = false;
                    
                }
                
            }
            
            else
                
            {
                
                programExistsInAccount = false;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return programExistsInAccount;
        
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }

    public String getCreditCardNumber() 
    
    {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) 
    
    {
        this.creditCardNumber = creditCardNumber;
    }

    public int getExpiryMonth() 
    
    {
        return expiryMonth;
    }

    public void setExpiryMonth(int expiryMonth) 
    
    {
        this.expiryMonth = expiryMonth;
    }

    public int getExpiryYear() 
    
    {
        return expiryYear;
    }

    public void setExpiryYear(int expiryYear) 
    
    {
        this.expiryYear = expiryYear;
    }

    public String getCcv() 
    
    {
        return ccv;
    }

    public void setCcv(String ccv) 
    
    {
        this.ccv = ccv;
    }
    
}
