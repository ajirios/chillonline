/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.charges;

import dateline.DateLineConversion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author El Jefe
 */
public class ChronologicalBoardCharges 

{
    private BoardChargeCreate[] boardCharges;
    private int size;
    
    private int year;
    private int month;
    private int day;
    private int hour;
    private int minute;
    private int second;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    public ChronologicalBoardCharges()
            
    {
        
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String currentTime  = dateFormat.format(date);
        
        DateLineConversion conversion = new DateLineConversion(currentTime);
        
        this.year = conversion.getYear();
        this.month = conversion.getMonth();
        this.day = conversion.getDay();
        this.hour = conversion.getHour();
        this.minute = conversion.getMinute();
        this.second = conversion.getSecond();
        
        this.size = getBoardChargeCreateCount();
        
        
        if (this.size > 0)
            
        {
            this.boardCharges = new BoardChargeCreate[size];
            
            try
            {
                connection = DriverManager.getConnection(URL, userName, password);
                statement = connection.prepareStatement("SELECT accountNumber, boardID, joinDate FROM account_boards WHERE hour=" + hour 
                        + " AND boardID IN (SELECT boardID FROM boards WHERE boardClass>1)");
            }
            
            catch (SQLException e)

            {
                e.printStackTrace();
            }

            populateBoardChargeCreates();
            
        }
        
        else
            
        {
            this.boardCharges = null;
        }
        
    }

    private ResultSet getEpisodes()
    {
        try
        {
            resultSet = statement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return resultSet;

    }
    
    private void populateBoardChargeCreates()
            
    {
        int count;
        long nextCount = 0;
        ResultSet episodesSet = getEpisodes();
        
        try
            
        {
                        
            for (count = 0; (count < size) && (episodesSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(episodesSet.getString("episodeID"));
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public BoardChargeCreate getBoardChargeCreate(int count)
            
    {
        return this.boardCharges[count];
    }
    
    public long length()
            
    {
        return boardCharges.length;
    }
    
    private int getBoardChargeCreateCount()
            
    {
        int count = 0;
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(podcast) FROM episodes WHERE seriesID=");
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(podcast)")); 
                
            }
            
            else
                
            {
                count = 0;
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
    
}
