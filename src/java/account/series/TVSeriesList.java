/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.series;


import series.TVSeries;
import java.sql.*;


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
    
    private long accountNumber;
    private int size;
    TVSeries[] tvSeries;
    private int tvSeriesListingContainerLength;
    private int tvSeriesListingAreaLength;
    private int tvSeriesAreaLength;
    
    public TVSeriesList(long accountNumber)
    {
        this.accountNumber = accountNumber;
        this.size = getSeriesCount();
        this.tvSeries = new TVSeries[size];
        this.tvSeriesListingContainerLength = 235;
        this.tvSeriesListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 5))) * this.tvSeriesListingContainerLength) + 60;
        this.tvSeriesAreaLength = this.tvSeriesListingAreaLength + 200;
        

        try
        {
            tvSeriesConnection = DriverManager.getConnection(URL, userName, password);
            tvSeriesStatement = tvSeriesConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, locality, rentalPrice, purchasePrice FROM series "
                    + "WHERE seriesID IN (SELECT seriesID FROM account_series WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVSeries();

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
        long nextCount = 0;
        ResultSet tvSeriesListSet = getTVSeriesList();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (tvSeriesListSet.next() == true); count++) 

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
            statement = connection.prepareStatement("SELECT COUNT(seriesID) FROM account_series WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(seriesID)")); 
                
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

    public int getTvSeriesListingAreaLength() 
    
    {
        return tvSeriesListingAreaLength;
    }

    public int getTvSeriesAreaLength() 
    
    {
        return tvSeriesAreaLength;
    }
    
}
