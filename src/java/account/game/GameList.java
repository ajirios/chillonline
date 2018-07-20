/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.game;


import game.Game;
import java.sql.*;


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
    
    private long accountNumber;
    private int size;
    Game[] games;

    public GameList(long accountNumber)
    {
        this.accountNumber = accountNumber;
        this.size = getGameCount();
        this.games = new Game[size];
        
        
        try
        {
            gamesConnection = DriverManager.getConnection(URL, userName, password);
            gamesStatement = gamesConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, purchasePrice, locality FROM games "
                    + "WHERE gameID IN (SELECT gameID FROM account_games WHERE accountNumber=" + this.accountNumber + ")");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateGames();

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
        long nextCount = 0;
        ResultSet gamesSet = getGames();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (gamesSet.next() == true); count++) 

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
            statement = connection.prepareStatement("SELECT COUNT(gameID) FROM account_games WHERE accountNumber=" + this.accountNumber);
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(gameID)")); 
                
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
