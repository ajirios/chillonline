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
public class TVSeriesList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection tvSeriesConnection = null;
    PreparedStatement tvSeriesStatement = null;
    ResultSet tvSeriesSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    TVSeries[] tvSeries;

    public TVSeriesList()
    {
        this.size = getSeriesCount();
        this.tvSeries = new TVSeries[size];

        try
        {
            tvSeriesConnection = DriverManager.getConnection(URL, userName, password);
            tvSeriesStatement = tvSeriesConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, locality, rentalPrice, purchasePrice FROM series WHERE seriesID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVSeries();

    }

    public TVSeriesList(int pageNumber)
    {
        this.size = getSeriesCount();
        this.tvSeries = new TVSeries[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            tvSeriesConnection = DriverManager.getConnection(URL, userName, password);
            tvSeriesStatement = tvSeriesConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, locality, rentalPrice, purchasePrice FROM series "
                    + "WHERE seriesID>=" + this.startID + " AND seriesID<=" + this.endID);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVSeriesPage();
        
    }

    private ResultSet getTVSeriesList()
    {
        try
        {
            tvSeriesSet = tvSeriesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return tvSeriesSet;

    }
    
    private void populateTVSeries()
            
    {
        int count;
        int randomElement;
        ResultSet tvSeriesListSet = getTVSeriesList();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (tvSeriesListSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                tvSeries[count] = new TVSeries(nextCount, tvSeriesListSet.getString("seriesName"), tvSeriesListSet.getString("seriesPoster"), tvSeriesListSet.getString("distributor"), tvSeriesListSet.getString("locality"), tvSeriesListSet.getString("rentalPrice"), tvSeriesListSet.getString("purchasePrice"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateTVSeriesPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet tvSeriesListSet = getTVSeriesList();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (tvSeriesListSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(tvSeriesListSet.getString("seriesID"));
                tvSeries[count] = new TVSeries(nextCount, tvSeriesListSet.getString("seriesName"), tvSeriesListSet.getString("seriesPoster"), tvSeriesListSet.getString("distributor"), tvSeriesListSet.getString("locality"), tvSeriesListSet.getString("rentalPrice"), tvSeriesListSet.getString("purchasePrice"));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public TVSeries getTVSeries(int count)
            
    {
        return tvSeries[count];
    }
    
    public long length()
            
    {
        return tvSeries.length;
    }
    
    private int getSeriesCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(seriesPoster) FROM series");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(seriesPoster)")); 
                
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
