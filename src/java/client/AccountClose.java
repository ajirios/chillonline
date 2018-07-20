/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class AccountClose 

{
    private long closingID;
    private long clientID;
    private String password;
    private String closingReason;
    private String closingFeedback;
    private String securityAnswer1;
    private String securityAnswer2;
    private String securityAnswer3;
    private String securityAnswer4;
    private String securityAnswer5;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public AccountClose(long clientID, String password, String closingReason, String closingFeedback, String securityAnswer1, String securityAnswer2, String securityAnswer3, String securityAnswer4, String securityAnswer5)
            
    {
        this.closingID = 0;
        this.clientID = clientID;
        this.password = password;
        this.closingReason = closingReason;
        this.closingFeedback = closingFeedback;
        this.securityAnswer1 = securityAnswer1;
        this.securityAnswer2 = securityAnswer2;
        this.securityAnswer3 = securityAnswer3;
        this.securityAnswer4 = securityAnswer4;
        this.securityAnswer5 = securityAnswer5;
        
        setClientID(clientID);
        
        if (!closingReason.equals(""))
            
        {
            setClosingReason(closingReason);
        }
        
        if (!closingFeedback.equals(""))
            
        {
            setClosingFeedback(closingFeedback);
        }
        
        if (!securityAnswer1.equals(""))
            
        {
            setSecurityAnswer1(securityAnswer1);
        }
        
        if (!securityAnswer2.equals(""))
            
        {
            setSecurityAnswer2(securityAnswer2);
        }
        
        if (!securityAnswer3.equals(""))
            
        {
            setSecurityAnswer3(securityAnswer3);
        }
        
        if (!securityAnswer4.equals(""))
            
        {
            setSecurityAnswer4(securityAnswer4);
        }
        
        if (!securityAnswer5.equals(""))
            
        {
            setSecurityAnswer5(securityAnswer5);
        }
        
    }

    public long getClosingID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingIDStatement;
        ResultSet closingIDSet;
        
        //initialise objects for backup
        connection = null;
        setClosingIDStatement = null;
        closingIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingIDStatement = connection.prepareStatement("SELECT closingID FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingIDStatement != null)
                
            {
            
                closingIDSet = setClosingIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (closingIDSet.next() == true)
                
            {
            
                this.closingID = Long.parseLong(closingIDSet.getString("closingID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return closingID;
    }

    public void setClosingID(long closingID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClosingIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingIDStatement = connection.prepareStatement("UPDATE `account-closings` set closingID=" + closingID + " WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingIDStatement != null)
                
            {
            
                result = setClosingIDStatement.executeUpdate(); 
                this.closingID = closingID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
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
            setClientIDStatement = connection.prepareStatement("SELECT clientID FROM `account-closings` WHERE closingID=" + this.closingID);
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
            setClientIDStatement = connection.prepareStatement("UPDATE `account-closings` set clientID=" + clientID + " WHERE closingID=" + this.closingID);
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

    public String getClosingReason() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingReasonStatement;
        ResultSet closingReasonSet;
        
        //initialise objects for backup
        connection = null;
        setClosingReasonStatement = null;
        closingReasonSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingReasonStatement = connection.prepareStatement("SELECT closingReason FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingReasonStatement != null)
                
            {
            
                closingReasonSet = setClosingReasonStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (closingReasonSet.next() == true)
                
            {
            
                this.closingReason = closingReasonSet.getString("closingReason"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return closingReason;
    }

    public void setClosingReason(String closingReason) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingReasonStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClosingReasonStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingReasonStatement = connection.prepareStatement("UPDATE `account-closings` set closingReason='" + closingReason + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingReasonStatement != null)
                
            {
            
                result = setClosingReasonStatement.executeUpdate(); 
                this.closingReason = closingReason;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getClosingFeedback() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingFeedbackStatement;
        ResultSet closingFeedbackSet;
        
        //initialise objects for backup
        connection = null;
        setClosingFeedbackStatement = null;
        closingFeedbackSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingFeedbackStatement = connection.prepareStatement("SELECT closingFeedback FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingFeedbackStatement != null)
                
            {
            
                closingFeedbackSet = setClosingFeedbackStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (closingFeedbackSet.next() == true)
                
            {
            
                this.closingFeedback = closingFeedbackSet.getString("closingFeedback"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return closingFeedback;
    }

    public void setClosingFeedback(String closingFeedback) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClosingFeedbackStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClosingFeedbackStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClosingFeedbackStatement = connection.prepareStatement("UPDATE `account-closings` set closingFeedback=" + closingFeedback + " WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClosingFeedbackStatement != null)
                
            {
            
                result = setClosingFeedbackStatement.executeUpdate(); 
                this.closingFeedback = closingFeedback;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getPassword() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPasswordStatement;
        ResultSet passwordSet;
        
        //initialise objects for backup
        connection = null;
        setPasswordStatement = null;
        passwordSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPasswordStatement = connection.prepareStatement("SELECT password FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPasswordStatement != null)
                
            {
            
                passwordSet = setPasswordStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (passwordSet.next() == true)
                
            {
            
                this.password = passwordSet.getString("password"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return password;
    }

    public void setPassword(String password) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setPasswordStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setPasswordStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setPasswordStatement = connection.prepareStatement("UPDATE `account-closings` set password=" + password + " WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setPasswordStatement != null)
                
            {
            
                result = setPasswordStatement.executeUpdate(); 
                this.password = password;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getSecurityAnswer1() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        ResultSet securityAnswerSet;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        securityAnswerSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("SELECT securityAnswer1 FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                securityAnswerSet = setSecurityAnswerStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (securityAnswerSet.next() == true)
                
            {
            
                this.securityAnswer1 = securityAnswerSet.getString("securityAnswer1"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return securityAnswer1;
    }

    public void setSecurityAnswer1(String securityAnswer1) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("UPDATE `account-closings` set securityAnswer1='" + securityAnswer1 + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                result = setSecurityAnswerStatement.executeUpdate(); 
                this.securityAnswer1 = securityAnswer1;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getSecurityAnswer2() 
    
    {
        //SQL (update creditcards set paymentType="visa';)s
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        ResultSet securityAnswerSet;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        securityAnswerSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("SELECT securityAnswer2 FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                securityAnswerSet = setSecurityAnswerStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (securityAnswerSet.next() == true)
                
            {
            
                this.securityAnswer2 = securityAnswerSet.getString("securityAnswer2"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return securityAnswer2;
    }

    public void setSecurityAnswer2(String securityAnswer2) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("UPDATE `account-closings` set securityAnswer2='" + securityAnswer2 + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                result = setSecurityAnswerStatement.executeUpdate(); 
                this.securityAnswer2 = securityAnswer2;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getSecurityAnswer3() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        ResultSet securityAnswerSet;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        securityAnswerSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("SELECT securityAnswer3 FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                securityAnswerSet = setSecurityAnswerStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (securityAnswerSet.next() == true)
                
            {
            
                this.securityAnswer3 = securityAnswerSet.getString("securityAnswer3"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return securityAnswer3;
    }

    public void setSecurityAnswer3(String securityAnswer3) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("UPDATE `account-closings` set securityAnswer3='" + securityAnswer3 + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                result = setSecurityAnswerStatement.executeUpdate(); 
                this.securityAnswer3 = securityAnswer3;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getSecurityAnswer4() 
    
    {
        //SQL (update creditcards set paymentType="visa';)s
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        ResultSet securityAnswerSet;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        securityAnswerSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("SELECT securityAnswer4 FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                securityAnswerSet = setSecurityAnswerStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (securityAnswerSet.next() == true)
                
            {
            
                this.securityAnswer4 = securityAnswerSet.getString("securityAnswer4"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return securityAnswer4;
    }

    public void setSecurityAnswer4(String securityAnswer4) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("UPDATE `account-closings` set securityAnswer4='" + securityAnswer4 + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                result = setSecurityAnswerStatement.executeUpdate(); 
                this.securityAnswer4 = securityAnswer4;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getSecurityAnswer5() 
    
    {
        //SQL (update creditcards set paymentType="visa';)s
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        ResultSet securityAnswerSet;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        securityAnswerSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("SELECT securityAnswer5 FROM `account-closings` WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                securityAnswerSet = setSecurityAnswerStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (securityAnswerSet.next() == true)
                
            {
            
                this.securityAnswer5 = securityAnswerSet.getString("securityAnswer5"); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return securityAnswer5;
    }

    public void setSecurityAnswer5(String securityAnswer5) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setSecurityAnswerStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setSecurityAnswerStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setSecurityAnswerStatement = connection.prepareStatement("UPDATE `account-closings` set securityAnswer5='" + securityAnswer5 + "' WHERE closingID=" + this.closingID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setSecurityAnswerStatement != null)
                
            {
            
                result = setSecurityAnswerStatement.executeUpdate(); 
                this.securityAnswer5 = securityAnswer5;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
