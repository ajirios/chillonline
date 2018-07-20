/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.boards;

import board.Board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class PopularBoardsList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection boardsConnection = null;
    private PreparedStatement boardsStatement = null;
    private ResultSet boardSet = null;
    
    private long accountNumber;
    private int size;
    private Board[] boards;
    private int boardsListingContainerLength;
    private int boardsInitialLength;
    private int boardsInitialAreaLength;
    private int boardsListingAreaLength;
    private int boardsAreaLength;
    private static final int maximumListSize = 90;
    
    public PopularBoardsList(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.size = getBoardCount();
        this.boards = new Board[size];
        this.boardsInitialLength = 350;
        this.boardsInitialAreaLength = 450;
        this.boardsListingContainerLength = 370;
        this.boardsListingAreaLength = (((int) (Math.ceil((double) this.size / (double) 3))) * this.boardsListingContainerLength);
        this.boardsAreaLength = this.boardsListingAreaLength + 90;
        
        
        try
        {
            boardsConnection = DriverManager.getConnection(URL, userName, password);
            String statement = "SELECT boardID, boardName, description, clientID, reservationMode, boardClass, numberOfMembers, boardCover, registrationDate, deletionDate "
                    + "FROM boards WHERE boardID NOT IN (SELECT ALL boardID FROM boards WHERE boardID IN "
                    + "(SELECT ALL boardID FROM account_boards WHERE accountNumber=" + this.accountNumber + ")) "
                    + "AND reservationMode!='private' AND ready='yes' AND boardName NOT LIKE \"%_community\" ORDER BY numberOfMembers DESC";
            boardsStatement = boardsConnection.prepareStatement(statement);
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateBoards();
        
    }
    
    private ResultSet getBoards()
            
    {
        try
            
        {
            boardSet = boardsStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return boardSet;

    }
    
    private void populateBoards()
            
    {
        int count;
        long nextCount = 0;
        ResultSet boardsSet = getBoards();
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (boardsSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(boardsSet.getString("clientID"));
                boards[count] = new Board(nextCount, boardsSet.getString("boardName"), Integer.parseInt(boardsSet.getString("boardClass")), boardsSet.getString("description"), boardsSet.getString("reservationMode"));
                boards[count].setBoardID(Long.parseLong(boardsSet.getString("boardID")));
                boards[count].setBoardPoster(boardsSet.getString("boardCover"));
                boards[count].setNumberOfMembers(Long.parseLong(boardsSet.getString("numberOfMembers")));
                boards[count].setRegistrationDate(boardsSet.getString("registrationDate"));
                boards[count].setDeletionDate(boardsSet.getString("deletionDate"));
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Board getBoard(int count)
            
    {
        return boards[count];
    }
    
    public long length()
            
    {
        return boards.length;
    }
    
    private int getBoardCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(boardID) FROM boards WHERE boardID NOT IN (SELECT boardID FROM boards WHERE boardID IN "
                    + "(SELECT boardID FROM account_boards WHERE accountNumber=" + this.accountNumber + ")) "
                    + "AND reservationMode!='private' AND ready='yes' ORDER BY numberOfMembers DESC");
            
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
            
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true) 
                    
                {
                    
                    count = Integer.parseInt(resultSet.getString("COUNT(boardID)")); 
                    
                }
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        if (count > maximumListSize)
            
        {
            count = maximumListSize;
        }
        
        return count;
        
    }
    
    public int getSize()
    
    {
        return this.size;
    }
    
    public int getBoardsListingAreaLength() 
    
    {
        return boardsListingAreaLength;
    }
    
    public int getBoardsAreaLength() 
    
    {
        return boardsAreaLength;
    }
    
}
