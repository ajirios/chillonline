/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

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
    private int currentPageNumber;
    private int numberOfProgramsInStore;
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int numberOfStorePages;
    private StorePage[] storePages;
    private StorePage storePage;
    private ProgramList programList;
    private String department;
    private String genre;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Store(int currentPageNumber, String department, String genre)
            
    {
        this.department = department;
        this.genre = genre;
        this.currentPageNumber = currentPageNumber;
        this.programList = new ProgramList();
        this.numberOfProgramsInStore = this.programList.length();
        double programCountNumerator = (double) numberOfProgramsInStore;
        double stepCountDenominator = (double) NUMBER_OF_PROGRAMS_PER_PAGE;
        //this.numberOfStorePages = (int) Math.ceil(programCountNumerator / stepCountDenominator);
        this.numberOfStorePages = 8;
        this.storePages = new StorePage[numberOfStorePages];
        initialiseStorePages();
        this.storePage = storePages[currentPageNumber - 1];
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

    public ProgramList getProgramList() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        Program program;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        program = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies");
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
        
        //try getting the resultSet
        try
            
        {
            while (resultSet.next() == true)
                
            {
                long programID = Long.parseLong(resultSet.getString("movieID"));
                String programName = resultSet.getString("movieName");
                String programPoster = resultSet.getString("moviePoster");
                String distributor = resultSet.getString("distributor");
                String locality = resultSet.getString("locality");
                program = new Program(programID, programName, programPoster, distributor, locality);
                this.programList.insert(program);
            
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
    
    private void initialiseStorePages()
            
    {
        int pageCount;
        int programCount;
        ProgramNode currentNode;
        StorePage currentStorePage;
        Program[] currentPrograms;
        
        pageCount = 0;
        programCount = 0;
        currentNode = this.programList.getFirstNode();
        currentStorePage = null;
        currentPrograms = new Program[NUMBER_OF_PROGRAMS_PER_PAGE];
        
        for (pageCount = 0; (pageCount < this.numberOfStorePages) && (currentNode != null); pageCount++)
            
        {
            //currentStorePage = this.storePages[pageCount];
            
            for (programCount = 0; (programCount < NUMBER_OF_PROGRAMS_PER_PAGE) && (currentNode != null); programCount++)
                
            {
                
                currentPrograms[programCount] = currentNode.getProgram();
                currentNode = currentNode.getNextNode();
                
            }
            
            this.storePages[pageCount].setPrograms(currentPrograms);
            
        }
        
    }

    public int getNumberOfProgramsInStore() 
    
    {
        return numberOfProgramsInStore;
    }

    public void setNumberOfProgramsInStore(int numberOfProgramsInStore) 
    
    {
        this.numberOfProgramsInStore = numberOfProgramsInStore;
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

    public StorePage getStorePage() 
    
    {
        return storePage;
    }

    public void setStorePage(StorePage storePage) 
    
    {
        this.storePage = storePage;
    }
    
}
