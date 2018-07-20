/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package music;


import java.sql.*;

/**
 *
 * @author El Jefe
 */
public class MusicList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection musicConnection = null;
    PreparedStatement musicStatement = null;
    ResultSet musicSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    Music[] musicList;

    public MusicList()
    {
        this.size = getMusicCount();
        this.musicList = new Music[size];

        try
        {
            musicConnection = DriverManager.getConnection(URL, userName, password);
            musicStatement = musicConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, purchasePrice, locality FROM music WHERE musicID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMusic();

    }
    
    public MusicList(int pageNumber)
    {
        this.size = getMusicCount();
        this.musicList = new Music[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            musicConnection = DriverManager.getConnection(URL, userName, password);
            musicStatement = musicConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, purchasePrice, locality FROM music "
                    + "WHERE musicID>=" + this.startID + " AND musicID<=" + this.endID);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateMusicPage();

    }

    private ResultSet getMusic()
    {
        try
        {
            musicSet = musicStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return musicSet;

    }
    
    private void populateMusic()
            
    {
        int count;
        int randomElement;
        ResultSet musicListSet = getMusic();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (musicListSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                musicList[count] = new Music(nextCount, musicListSet.getString("musicName"), musicListSet.getString("musicPoster"), musicListSet.getString("distributor"), musicListSet.getString("purchasePrice"), musicListSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateMusicPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet musicListSet = getMusic();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (musicListSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(musicListSet.getString("musicID"));
                musicList[count] = new Music(nextCount, musicListSet.getString("musicName"), musicListSet.getString("musicPoster"), musicListSet.getString("distributor"), musicListSet.getString("purchasePrice"), musicListSet.getString("locality"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Music getMusic(int count)
            
    {
        return musicList[count];
    }
    
    public long length()
            
    {
        return musicList.length;
    }
    
    private int getMusicCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(musicPoster) FROM music");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(musicPoster)")); 
                
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
