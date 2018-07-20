/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.charges;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class BoardChargeCreate 

{
    private long boardID;
    private long accountNumber;
    private String amount;
    private long longitudinalChargeDate;
    private String chargeDate;
    private int chargeMonth;
    private int chargeDay;
    private int chargeHour;
    private int chargeMinute;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public BoardChargeCreate(long boardID, long accountNumber, int amount, String chargeDate, int chargeMonth, int chargeDay, int chargeHour, int chargeMinute)
            
    {
        this.boardID = boardID;
        this.accountNumber = accountNumber;
        this.amount = "USD$" + String.valueOf((double) ((double) amount / 100.0));
        this.chargeDate = chargeDate;
        this.longitudinalChargeDate = Long.parseLong(chargeDate);
        this.chargeMonth = chargeMonth;
        this.chargeDay = chargeDay;
        this.chargeHour = chargeHour;
        this.chargeMinute = chargeMinute;
        
        constructBoardChargeCreate();
        
    }
    
    public BoardChargeCreate(long boardID, long accountNumber, String chargeDate, int chargeMonth, int chargeDay, int chargeHour, int chargeMinute)
            
    {
        this.boardID = boardID;
        this.accountNumber = accountNumber;
        this.amount = null;
        this.chargeDate = chargeDate;
        this.longitudinalChargeDate = Long.parseLong(chargeDate);
        this.chargeMonth = chargeMonth;
        this.chargeDay = chargeDay;
        this.chargeHour = chargeHour;
        this.chargeMinute = chargeMinute;
        
        constructBoardChargeCreate();
        
    }
    
    public void constructBoardChargeCreate()
            
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
            statement = connection.prepareStatement("INSERT INTO board_charges(boardID, accountNumber, amount, chargeDate, longitudinalChargeDate, chargeMonth, chargeDay, chargeHour, chargeMinute) "
                    + "VALUES(" + this.boardID
                    + ", " + this.accountNumber
                    + ", '" + this.amount
                    + "', '" + this.chargeDate
                    + "', " + this.longitudinalChargeDate
                    + ", " + this.chargeMonth
                    + ", " + this.chargeDay
                    + ", " + this.chargeHour
                    + ", " + this.chargeMinute + ")");
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
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }

    public String getAmount() 
    
    {
        return amount;
    }

    public void setAmount(String amount) 
    
    {
        this.amount = amount;
    }

    public long getLongitudinalChargeDate() 
    
    {
        return longitudinalChargeDate;
    }

    public void setLongitudinalChargeDate(long longitudinalChargeDate) 
    
    {
        this.longitudinalChargeDate = longitudinalChargeDate;
    }

    public String getChargeDate() 
    
    {
        return chargeDate;
    }

    public void setChargeDate(String chargeDate) 
    
    {
        this.chargeDate = chargeDate;
    }
    
}
