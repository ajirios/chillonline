/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.sql.*;
import java.math.*;

/**
 *
 * @author El Jefe
 */
public class RadioChannelList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection radioChannelsConnection = null;
    PreparedStatement radioChannelsStatement = null;
    ResultSet radioChannelSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    RadioChannel[] radioChannels;

    public RadioChannelList()
    {
        this.size = getRadioChannelCount();
        this.radioChannels = new RadioChannel[size];

        try
        {
            radioChannelsConnection = DriverManager.getConnection(URL, userName, password);
            radioChannelsStatement = radioChannelsConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, locality FROM radio WHERE radioID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateRadioChannels();

    }

    public RadioChannelList(int pageNumber)
    {
        this.size = getRadioChannelCount();
        this.radioChannels = new RadioChannel[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            radioChannelsConnection = DriverManager.getConnection(URL, userName, password);
            radioChannelsStatement = radioChannelsConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, locality FROM radio "
                    + "WHERE radioID>=" + this.startID + " AND radioID<=" + this.endID);
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateRadioChannelPage();

    }

    private ResultSet getRadioChannels()
    {
        try
        {
            radioChannelSet = radioChannelsStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return radioChannelSet;

    }
    
    private void populateRadioChannels()
            
    {
        int count;
        int randomElement;
        ResultSet radioChannelsSet = getRadioChannels();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (radioChannelsSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                radioChannels[count] = new RadioChannel(nextCount, radioChannelsSet.getString("radioName"), radioChannelsSet.getString("radioPoster"), radioChannelsSet.getString("distributor"), radioChannelsSet.getString("rentalPrice"), radioChannelsSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateRadioChannelPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet radioChannelsSet = getRadioChannels();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (radioChannelsSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(radioChannelsSet.getString("radioID"));
                radioChannels[count] = new RadioChannel(nextCount, radioChannelsSet.getString("radioName"), radioChannelsSet.getString("radioPoster"), radioChannelsSet.getString("distributor"), radioChannelsSet.getString("rentalPrice"), radioChannelsSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public RadioChannel getRadioChannel(int count)
            
    {
        return radioChannels[count];
    }
    
    public long length()
            
    {
        return radioChannels.length;
    }
    
    private int getRadioChannelCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(radioPoster) FROM radio");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(radioPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private int getStartID(int pageNumber)
            
    {
        int databaseID;
        
        databaseID = 0;
        
        if (pageNumber > 0)
            
        {
            
            databaseID = (18 * (pageNumber - 1)) + 1;
        
        }
        
        return databaseID;
        
    }
    
    private int getEndID(int pageNumber)
            
    {
        int databaseID;
        
        databaseID = 0;
        
        if (pageNumber > 0)
            
        {
            databaseID = (18 * pageNumber);
            
            if (databaseID <= this.size)
                
            {
                databaseID = (18 * pageNumber);
            }
            
            else if (databaseID > this.size)
                
            {
                databaseID = this.size;
            }
        
        }
        
        return databaseID;
        
    }

    public int getCurrentPageNumber() 
    
    {
        return currentPageNumber;
    }

    public int getFinalPageNumber() 
    
    {
        return finalPageNumber;
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
}
