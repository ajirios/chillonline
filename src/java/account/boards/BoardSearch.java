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
public class BoardSearch 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection boardsConnection = null;
    private PreparedStatement boardsStatement = null;
    private ResultSet boardSet = null;
    
    private int size;
    private String boardName;
    private Board[] boards;
    private int boardsListingContainerLength;
    private int boardsInitialLength;
    private int boardsInitialAreaLength;
    private int boardsListingAreaLength;
    private int boardsAreaLength;
    
    public BoardSearch(String boardName)
            
    {
        this.boardName = modifyChars(boardName);
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
            boardsStatement = boardsConnection.prepareStatement("SELECT boardID, boardName, description, clientID, reservationMode, "
                    + "boardClass, numberOfMembers, boardCover, registrationDate, deletionDate  FROM boards "
                    + "WHERE boardID IN (SELECT ALL boardID FROM boards WHERE boardName='" + boardName + "')");
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
            statement = connection.prepareStatement("SELECT COUNT(boardID) FROM boards WHERE boardName='" + boardName + "'");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(boardID)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private String modifyChars(String boardName)
            
    {
        String modification;
        char[] prohibitedChars = new char[19];
        int count;
        int index;
        boolean prohibitedExists = false;
        
        modification = "";
        prohibitedChars[0] = '@';
        prohibitedChars[1] = '#';
        prohibitedChars[2] = '%';
        prohibitedChars[3] = '^';
        prohibitedChars[4] = '&';
        prohibitedChars[5] = '*';
        prohibitedChars[6] = '(';
        prohibitedChars[7] = ')';
        prohibitedChars[8] = '+';
        prohibitedChars[9] = '=';
        prohibitedChars[10] = ';';
        prohibitedChars[11] = ':';
        prohibitedChars[12] = '`';
        prohibitedChars[13] = '~';
        prohibitedChars[14] = '\\';
        prohibitedChars[15] = '/';
        prohibitedChars[16] = '>';
        prohibitedChars[17] = '<';
        prohibitedChars[18] = '\"';
        modification = "";
        
        for (count = 0; count < boardName.length(); count++)
            
        {
            
            if (boardName.charAt(count) == '\'')
            
            {
                modification = modification + '\\'; 
            }
            
            for (index = 0; index < prohibitedChars.length; index++)
                
            {
                
                if (boardName.charAt(count) == prohibitedChars[index])

                {
                    prohibitedExists = true;
                }
                
            }
            
            if (prohibitedExists == false)
                
            {
                modification = modification + boardName.charAt(count);
            }
            
        }
        
        return modification;
        
    }
    
    public int getSize()
    
    {
        return this.size;
    }

    public String getBoardName() 
    
    {
        return boardName;
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
