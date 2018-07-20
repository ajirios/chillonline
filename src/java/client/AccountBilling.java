/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;


import java.sql.*;


/**
 *
 * @author El Jefe
 */
public class AccountBilling 

{
    private static final long creditCardID = 0;
    private long clientID;
    private String paymentType;
    private String creditCardNumber;
    private String nameOnCard;
    private String expiryDate;
    private String ccv;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public AccountBilling(long clientID, String paymentType, String creditCardNumber, String nameOnCard, String expiryDate, String ccv)
            
    {
        //this class will be called as form servlet for account-billing.jsp to post its parameters to itself and store.
        this.clientID = clientID;
        this.paymentType = paymentType;
        this.creditCardNumber = creditCardNumber;
        this.nameOnCard = nameOnCard;
        this.expiryDate = expiryDate;
        this.ccv = ccv;
        
        //check clients table if client=0 exists first
        setClientID(clientID);
        
        if (!paymentType.equals(""))
            
        {
            setPaymentType(paymentType);
        }
        
        if (!nameOnCard.equals(""))
            
        {
            setNameOnCard(nameOnCard);
        }
        
        if (!expiryDate.equals(""))
            
        {
            setExpiryDate(expiryDate);
        }
        
        if (!creditCardNumber.equals(""))
            
        {
            setCreditCardNumber(creditCardNumber);
        }
        
        if (!ccv.equals(""))
            
        {
            setCcv(ccv);
        }
        
        
        //if client=0 exists, insert the paymentType and so on into creditcards table with clientID
        
        
        //if client=0 does not exist, do nothing. The creditcards table doesn't change...
        
    }
    
    public long getClientID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        ResultSet clientIDSet;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        clientIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("SELECT clientID FROM `creditcards` WHERE creditCardID=" + this.creditCardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                clientIDSet = setClientIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (clientIDSet.next() == true)
                
            {
            
                this.clientID = Long.parseLong(clientIDSet.getString("clientID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("UPDATE `creditcards` set clientID=" + clientID + " WHERE creditCardID=" + this.creditCardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                result = setClientIDStatement.executeUpdate(); 
                this.clientID = clientID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        this.clientID = clientID;
    }

    public String getPaymentType() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPaymentTypeStatement;
        ResultSet paymentTypeSet;
        
        //initialise objects for backup
        connection = null;
        setPaymentTypeStatement = null;
        paymentTypeSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPaymentTypeStatement = connection.prepareStatement("SELECT paymentType FROM creditcards WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPaymentTypeStatement != null)
                
            {
            
                paymentTypeSet = setPaymentTypeStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (paymentTypeSet.next() == true)
                
            {
            
                this.paymentType = paymentTypeSet.getString("paymentType");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return this.paymentType;
    }

    public void setPaymentType(String paymentType) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPaymentTypeStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setPaymentTypeStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPaymentTypeStatement = connection.prepareStatement("UPDATE creditcards set paymentType='" + paymentType + "' WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPaymentTypeStatement != null)
                
            {
            
                result = setPaymentTypeStatement.executeUpdate(); 
                this.paymentType = paymentType;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getCreditCardNumber() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCardNumberStatement;
        ResultSet cardNumberSet;
        
        //initialise objects for backup
        connection = null;
        setCardNumberStatement = null;
        cardNumberSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCardNumberStatement = connection.prepareStatement("SELECT creditCardNumber FROM creditcards WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCardNumberStatement != null)
                
            {
            
                cardNumberSet = setCardNumberStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (cardNumberSet.next() == true)
                
            {
            
                this.creditCardNumber = cardNumberSet.getString("creditCardNumber");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return this.creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCardNumberStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setCardNumberStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCardNumberStatement = connection.prepareStatement("UPDATE creditcards set creditCardNumber='" + this.creditCardNumber + "' WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCardNumberStatement != null)
                
            {
            
                result = setCardNumberStatement.executeUpdate(); 
                this.creditCardNumber = creditCardNumber;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getNameOnCard() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCardNameStatement;
        ResultSet cardNameSet;
        
        //initialise objects for backup
        connection = null;
        setCardNameStatement = null;
        cardNameSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCardNameStatement = connection.prepareStatement("SELECT creditCardName FROM creditcards WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCardNameStatement != null)
                
            {
            
                cardNameSet = setCardNameStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (cardNameSet.next() == true)
                
            {
            
                this.nameOnCard = cardNameSet.getString("creditCardName");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return this.nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCardNameStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setCardNameStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCardNameStatement = connection.prepareStatement("UPDATE creditcards set creditCardName='" + nameOnCard + "' WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCardNameStatement != null)
                
            {
            
                result = setCardNameStatement.executeUpdate(); 
                this.nameOnCard = nameOnCard;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getExpiryDate() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setExpiryDateStatement;
        ResultSet expiryDateSet;
        
        //initialise objects for backup
        connection = null;
        setExpiryDateStatement = null;
        expiryDateSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setExpiryDateStatement = connection.prepareStatement("SELECT expiryDate FROM creditcards WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setExpiryDateStatement != null)
                
            {
            
                expiryDateSet = setExpiryDateStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (expiryDateSet.next() == true)
                
            {
            
                this.expiryDate = expiryDateSet.getString("expiryDate");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return this.expiryDate;
    }

    public void setExpiryDate(String expiryDate) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setExpiryDateStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setExpiryDateStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setExpiryDateStatement = connection.prepareStatement("UPDATE creditcards set expiryDate='" + this.expiryDate + "' WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setExpiryDateStatement != null)
                
            {
            
                result = setExpiryDateStatement.executeUpdate(); 
                this.expiryDate = expiryDate;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getCcv() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCCVStatement;
        ResultSet ccvSet;
        
        //initialise objects for backup
        connection = null;
        setCCVStatement = null;
        ccvSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCCVStatement = connection.prepareStatement("SELECT ccv FROM creditcards WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCCVStatement != null)
                
            {
            
                ccvSet = setCCVStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (ccvSet.next() == true)
                
            {
            
                this.ccv = ccvSet.getString("ccv");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return this.ccv;
    }

    public void setCcv(String ccv) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setCCVStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setCCVStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setCCVStatement = connection.prepareStatement("UPDATE creditcards set ccv='" + this.ccv + "' WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setCCVStatement != null)
                
            {
            
                result = setCCVStatement.executeUpdate(); 
                this.ccv = ccv;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
