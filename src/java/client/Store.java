/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class Store 

{
    private long clientID;
    private int currentPageNumber;
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int numberOfPrograms;
    private int numberOfStorePages;
    private StorePage[] storePages;
    private StorePage storePage;
    private ProgramList programList;
    private String department;
    private String genre;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Store(long clientID, int currentPageNumber, String department, String genre)
            
    {
        this.clientID = clientID;
        this.department = department;
        this.genre = genre;
        this.currentPageNumber = currentPageNumber;
        this.programList = new ProgramList();
        this.numberOfPrograms = this.programList.length();
        double programCountNumerator = (double) numberOfPrograms;
        double stepCountDenominator = (double) NUMBER_OF_PROGRAMS_PER_PAGE;
        this.numberOfStorePages = (int) Math.ceil(programCountNumerator / stepCountDenominator);
        this.storePages = new StorePage[numberOfStorePages];
        this.storePage = storePages[currentPageNumber - 1];
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public int getCurrentPageNumber() 
    
    {
        return currentPageNumber;
    }

    public void setCurrentPageNumber(int currentPageNumber) 
    
    {
        this.currentPageNumber = currentPageNumber;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public void setDepartment(String department) 
    
    {
        this.department = department;
    }

    public String getGenre() 
    
    {
        return genre;
    }

    public void setGenre(String genre) 
    
    {
        this.genre = genre;
    }

    public int getNumberOfStorePages() 
    
    {
        return numberOfStorePages;
    }

    public void setNumberOfStorePages(int numberOfStorePages) 
    
    {
        this.numberOfStorePages = numberOfStorePages;
    }

    public StorePage[] getStorePages() 
    
    {
        return storePages;
    }

    public void setStorePages(StorePage[] storePages) 
    
    {
        this.storePages = storePages;
    }

    public int getNumberOfPrograms() 
    
    {
        return numberOfPrograms;
    }

    public void setNumberOfPrograms(int numberOfPrograms) 
    
    {
        this.numberOfPrograms = numberOfPrograms;
    }

    public ProgramList getProgramList() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT * FROM movies");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (resultSet.next() == true)
                
            {
            
                
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return programList;
    }

    public void setProgramList(ProgramList programList) 
    
    {
        
        
        this.programList = programList;
    }

    public StorePage getStorePage() 
    
    {
        return storePage;
    }

    public void setStorePage(StorePage storePage) 
    
    {
        this.storePage = storePage;
    }
    
}
