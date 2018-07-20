/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.charges;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class LatestBoardChargeRetrieve 

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
    private int creationMonth;
    private int creationDay;
    private int creationHour;
    private int creationMinute;
    
    private int size;
    private BoardCharge boardCharge;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet set = null;
    
    public LatestBoardChargeRetrieve(long boardID, int creationMonth, int creationDay, int creationHour,int creationMinute)
            
    {
        this.boardID = boardID;
        this.accountNumber = -1;
        this.amount = null;
        this.chargeDate = null;
        this.longitudinalChargeDate = 0;
        this.chargeMonth = 0;
        this.chargeDay = 0;
        this.chargeHour = 0;
        this.chargeMinute = 0;
        this.creationDay = creationDay;
        this.creationHour = creationHour;
        this.creationMinute = creationMinute;
        this.creationMonth = creationMonth;

        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT boardID, accountNumber, amount, chargeDate, longitudinalChargeDate, chargeMonth, chargeDay, chargeHour, chargeMinute "
                    + "FROM board_charges WHERE longitudinalChargeDate IN (SELECT MAX(longitudinalChargeDate) FROM board_charges "
                    + "WHERE chargeDay=" + this.creationDay + ") AND boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        constructLatestBoardCharge();
        
    }

    private ResultSet getBoards()
    {
        try
            
        {
            set = statement.executeQuery();
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }

        return set;

    }
    
    private void constructLatestBoardCharge()
            
    {
        int count;
        long nextCount = 0;
        ResultSet boardsSet = getBoards();
        
        try
            
        {
            if (boardsSet != null)
                
            {
                
                for (count = 0; (count < 1) && (boardsSet.next() == true); count++) 
                    
                {
                    
                    this.boardID = Long.parseLong(boardsSet.getString("boardID"));
                    this.accountNumber = Long.parseLong(boardsSet.getString("accountNumber"));
                    this.amount = boardsSet.getString("amount");
                    this.chargeDate = boardsSet.getString("chargeDate");
                    this.longitudinalChargeDate = Long.parseLong(boardsSet.getString("longitudinalChargeDate"));
                    this.chargeMonth = Integer.parseInt(boardsSet.getString("chargeMonth"));
                    this.chargeDay = Integer.parseInt(boardsSet.getString("chargeDay"));
                    this.chargeHour = Integer.parseInt(boardsSet.getString("chargeHour"));
                    this.chargeMinute = Integer.parseInt(boardsSet.getString("chargeMinute"));
                    
                }
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public String getAmount() 
    
    {
        return amount;
    }

    public long getLongitudinalChargeDate() 
    
    {
        return longitudinalChargeDate;
    }

    public String getChargeDate() 
    
    {
        return chargeDate;
    }

    public int getChargeMonth() 
    
    {
        return chargeMonth;
    }

    public int getChargeDay() 
    
    {
        return chargeDay;
    }

    public int getChargeHour() 
    
    {
        return chargeHour;
    }

    public int getChargeMinute() 
    
    {
        return chargeMinute;
    }

    public int getSize() 
    
    {
        return size;
    }

    public BoardCharge getBoardCharge() 
    
    {
        return boardCharge;
    }
    
}
