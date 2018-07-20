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
public class GameList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection gamesConnection = null;
    PreparedStatement gamesStatement = null;
    ResultSet gameSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    private int startID;
    private int endID;
    private int currentPageNumber;
    private int finalPageNumber;
    Game[] games;

    public GameList()
    {
        this.size = getGameCount();
        this.games = new Game[size];

        try
        {
            gamesConnection = DriverManager.getConnection(URL, userName, password);
            gamesStatement = gamesConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, purchasePrice, locality FROM games WHERE gameID<" + this.size);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateGames();

    }
    
    public GameList(int pageNumber)
    {
        this.size = getGameCount();
        this.games = new Game[18];
        this.startID = getStartID(pageNumber);
        this.endID = getEndID(pageNumber);
        this.currentPageNumber = pageNumber;
        this.finalPageNumber = (int) Math.ceil(((double) this.size) / ((double) NUMBER_OF_PROGRAMS_PER_PAGE)); 
        

        try
        {
            gamesConnection = DriverManager.getConnection(URL, userName, password);
            gamesStatement = gamesConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, purchasePrice, locality FROM games "
                    + "WHERE gameID>=" + this.startID + " AND gameID<=" + this.endID);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateGamePage();

    }

    private ResultSet getGames()
    {
        try
        {
            gameSet = gamesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return gameSet;

    }
    
    private void populateGames()
            
    {
        int count;
        int randomElement;
        ResultSet gamesSet = getGames();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (gamesSet.next() == true); count++) 

            {
                randomElement = (int) (Math.random() * this.size);
                long nextCount = count + 1;
                games[count] = new Game(nextCount, gamesSet.getString("gameName"), gamesSet.getString("gamePoster"), gamesSet.getString("distributor"), gamesSet.getString("locality"), gamesSet.getString("purchasePrice"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void populateGamePage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet gamesSet = getGames();
        
        try
            
        {
                        
            for (count = 0; (count < 18) && (gamesSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(gamesSet.getString("gameID"));
                games[count] = new Game(nextCount, gamesSet.getString("gameName"), gamesSet.getString("gamePoster"), gamesSet.getString("distributor"), gamesSet.getString("locality"), gamesSet.getString("purchasePrice"));

            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Game getGame(int count)
            
    {
        return games[count];
    }
    
    public long length()
            
    {
        return games.length;
    }
    
    private int getGameCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(gamePoster) FROM games");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(gamePoster)")); 
                
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
