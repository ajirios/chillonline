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
public class CreditCardSearch 

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
    
    public CreditCardSearch(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        ClientRetrieve clientRetrieve = new ClientRetrieve(accountNumber);
        CreditCardRetrieve cardRetrieve = new CreditCardRetrieve(accountNumber);
        this.clientID = clientRetrieve.getClientID();
        this.creditCardID = -1;
        this.creditCardNumber = cardRetrieve.getCreditCardNumber();
        this.expiryMonth = 0;
        this.expiryYear = 0;
        this.ccv = cardRetrieve.getCcv();
        this.paymentType = null;
        this.creditCardName = null;
    }
    
    public boolean search()
            
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
    
}
