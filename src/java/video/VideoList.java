/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video;


import java.sql.*;


/**
 *
 * @author El Jefe
 */
public class VideoList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection videosConnection = null;
    PreparedStatement videosStatement = null;
    ResultSet videoSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    Video[] videos;

    public VideoList()
    {
        this.size = getVideoCount();
        this.videos = new Video[size];

        try
        {
            videosConnection = DriverManager.getConnection(URL, userName, password);
            videosStatement = videosConnection.prepareStatement("SELECT videoID, videoName, thumbnail, distributor, purchasePrice, locality FROM videos WHERE videoID<" + this.size);
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateVideos();

    }

    public VideoList(int pageNumber)
    {
        this.size = getVideoCount();
        this.videos = new Video[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            videosConnection = DriverManager.getConnection(URL, userName, password);
            videosStatement = videosConnection.prepareStatement("SELECT videoID, videoName, thumbnail, distributor, purchasePrice, locality FROM videos "
                    + "WHERE videoID>=" + this.startID + " AND videoID<=" + this.endID);
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateVideoPage();

    }

    private ResultSet getVideos()
    {
        try
        {
            videoSet = videosStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return videoSet;

    }
    
    private void populateVideos()
            
    {
        int count;
        int randomElement;
        ResultSet videosSet = getVideos();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (videosSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                videos[count] = new Video(nextCount, videosSet.getString("videoName"), videosSet.getString("thumbnail"), videosSet.getString("distributor"), videosSet.getString("purchasePrice"), videosSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateVideoPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet videosSet = getVideos();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (videosSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(videosSet.getString("videoID"));
                videos[count] = new Video(nextCount, videosSet.getString("videoName"), videosSet.getString("thumbnail"), videosSet.getString("distributor"), videosSet.getString("purchasePrice"), videosSet.getString("locality"));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Video getVideo(int count)
            
    {
        return videos[count];
    }
    
    public long length()
            
    {
        return videos.length;
    }
    
    private int getVideoCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(thumbnail) FROM videos");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(thumbnail)")); 
                
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
