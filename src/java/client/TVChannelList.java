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
public class TVChannelList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection tvChannelsConnection = null;
    PreparedStatement tvChannelsStatement = null;
    ResultSet tvChannelSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    TVChannel[] tvChannels;

    public TVChannelList()
    {
        this.size = getTVChannelCount();
        this.tvChannels = new TVChannel[size];

        try
        {
            tvChannelsConnection = DriverManager.getConnection(URL, userName, password);
            tvChannelsStatement = tvChannelsConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributor, rentalPrice, locality FROM tv WHERE channelID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVChannels();

    }

    public TVChannelList(int pageNumber)
    {
        this.size = getTVChannelCount();
        this.tvChannels = new TVChannel[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            tvChannelsConnection = DriverManager.getConnection(URL, userName, password);
            tvChannelsStatement = tvChannelsConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributor, rentalPrice, locality FROM tv "
                    + "WHERE channelID>=" + this.startID + " AND channelID<=" + this.endID);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVChannelPage();

    }

    private ResultSet getTVChannels()
    {
        try
        {
            tvChannelSet = tvChannelsStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return tvChannelSet;

    }
    
    private void populateTVChannels()
            
    {
        int count;
        int randomElement;
        ResultSet tvChannelsSet = getTVChannels();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (tvChannelsSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                tvChannels[count] = new TVChannel(nextCount, tvChannelsSet.getString("channelName"), tvChannelsSet.getString("channelPoster"), tvChannelsSet.getString("distributor"), tvChannelsSet.getString("rentalPrice"), tvChannelsSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateTVChannelPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet tvChannelsSet = getTVChannels();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (tvChannelsSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(tvChannelsSet.getString("channelID"));
                tvChannels[count] = new TVChannel(nextCount, tvChannelsSet.getString("channelName"), tvChannelsSet.getString("channelPoster"), tvChannelsSet.getString("distributor"), tvChannelsSet.getString("rentalPrice"), tvChannelsSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public TVChannel getTVChannel(int count)
            
    {
        return tvChannels[count];
    }
    
    public long length()
            
    {
        return tvChannels.length;
    }
    
    private int getTVChannelCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(channelPoster) FROM tv");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(channelPoster)")); 
                
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
